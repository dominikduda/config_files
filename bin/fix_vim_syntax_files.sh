#!/bin/bash

function fix_file {
  sed -i -e '/exe/! {s/contains=/contains=@Spell,/g}' $1
  sed -i -e 's/contains=@Spell,ALL/contains=ALL/g' $1
  sed -i -e 's/contains=@Spell,ALLBUT/contains=ALLBUT/g' $1
  sed -i -e 's/contains=@Spell,TOP/contains=TOP/g' $1
  sed -i -e 's/contains=@Spell,CONTAINED/contains=CONTAINED/g' $1
  sed -i -e 's/contains=@Spell,NONE/contains=@Spell/g' $1
  sed -i -e '/^ *syn match/ {/contains=/! s/$/ contains=@Spell/g}' $1
  sed -i -e '/^ *syn region/ {/contains=/! s/$/ contains=@Spell/g}' $1
  return 0
}

function revert_file {
  mv "$1/$2.spellfix-backup" "$1/$2"
  return 0
}

function fix_recursively_in_catalog {
  syntax_catalogs_paths="$(find $1 -type d ! -name '*.*' -not -path '*git*' -print)"
  syntax_catalogs_count="$(echo "${syntax_catalogs_paths}" | wc -l)"

  echo "${syntax_catalogs_count} syntax catalogs found and will be scanned for files"

  echo "${syntax_catalogs_paths}" | while read -r catalog_path ; do
      echo "    Scanning $catalog_path"
      ls -p "${catalog_path}" | grep -v / | grep -v .spellfix-backup | grep .vim | while read -r file_name ; do
          cp "${catalog_path}/${file_name}" "${catalog_path}/${file_name}.spellfix-backup"
          fix_file "${catalog_path}/${file_name}"
          echo "        Fixing ${file_name} (backup created as ${file_name}.spellfix-backup)"
      done
  done
  echo 'Fix done.'
  echo 'Remember to REVERT FIX before updating vim plugins'
  return 0
}

function revert_recursively_in_catalog {
  syntax_catalogs_paths="$(find $1 -type d ! -name '*.*' -not -path '*git*' -print)"
  syntax_catalogs_count="$(echo "${syntax_catalogs_paths}" | wc -l)"

  echo "${syntax_catalogs_count} syntax catalogs found and will be scanned for spellfix-backup files"

  echo "${syntax_catalogs_paths}" | while read -r catalog_path ; do
      echo "    Scanning $catalog_path"
      ls -p "${catalog_path}" | grep -v / | grep -v .spellfix-backup | grep .vim | while read -r file_name ; do
          revert_file "${catalog_path}" "${file_name}"
          echo "        Reverting ${file_name} (from file ${file_name}.spellfix-backup)"
      done
  done
  echo 'Revert done.'
  echo 'Remember to FIX AGAIN after plugins update (or set it as a post update hook)'
  return 0
}

function main {
  syntax_catalogs_paths="$(find $1 -type d ! -name '*.*' -not -path '*git*' -print)"
  while read -r catalog_path ; do
      if ls -p "${catalog_path}" | grep -v / | grep .spellfix-backup; then
        echo ".spellfix-backup files found, reverting fix!"
        echo "--------------------------------------------"
        revert_recursively_in_catalog $1
        return 0
      fi
  done < <(echo "${syntax_catalogs_paths}")
  echo ".spellfix-backup files NOT found, fixing!"
  echo "-----------------------------------------"
  fix_recursively_in_catalog $1
}

# Use path to your vim plugins directory
main ~/.config/nvim/plug/
