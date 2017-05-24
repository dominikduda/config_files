#!/bin/bash

function fix_file {
  sed -i -e 's/contains=/contains=@Spell,/g' $1

  sed -i -e 's/contains=@Spell,ALL/contains=ALL/g' $1
  sed -i -e 's/contains=@Spell,ALLBUT/contains=ALLBUT/g' $1
  sed -i -e 's/contains=@Spell,TOP/contains=TOP/g' $1
  sed -i -e 's/contains=@Spell,CONTAINED/contains=CONTAINED/g' $1
  sed -i -e 's/contains=@Spell,NONE/contains=@Spell/g' $1

  # Append 'contains=@Spell' to all lines containing 'syn match' and not containing 'contains='
  sed -i -e '/syn match/ {/contains=/! s/$/ contains=@Spell/g}' $1
  return 0
}

function revert_file {
  mv "$1/$2.spellfix-backup" "$1/$2"
  return 0
}

function fix_recursively_in_catalog {
  syntax_catalogs_paths="$(find $1 -type d -name 'syntax' -print)"
  syntax_catalogs_count="$(echo "${syntax_catalogs_paths}" | wc -l)"

  echo "${syntax_catalogs_count} syntax catalogs found and will be scanned for files"

  echo "${syntax_catalogs_paths}" | while read -r catalog_path ; do
      echo "    $catalog_path"
      ls "${catalog_path}" | grep -v .spellfix-backup | grep .vim | while read -r file_name ; do
          cp "${catalog_path}/${file_name}" "${catalog_path}/${file_name}.spellfix-backup"
          fix_file "${catalog_path}/${file_name}"
          echo "        ${file_name} FIXED (backup created as ${file_name}.spellfix-backup)"
      done
  done
  echo 'Fix done.'
  echo 'Remember to REVERT FIX before updating vim plugins'
  return 0
}

function revert_recursively_in_catalog {
  syntax_catalogs_paths="$(find $1 -type d -name 'syntax' -print)"
  syntax_catalogs_count="$(echo "${syntax_catalogs_paths}" | wc -l)"

  echo "${syntax_catalogs_count} syntax catalogs found and will be scanned for spellfix-backup files"

  echo "${syntax_catalogs_paths}" | while read -r catalog_path ; do
      echo "    $catalog_path"
      ls "${catalog_path}" | grep -v .spellfix-backup | grep .vim | while read -r file_name ; do
          revert_file "${catalog_path}" "${file_name}"
          echo "        ${file_name} REVERTED (from file ${file_name}.spellfix-backup)"
      done
  done
  echo 'Revert done.'
  echo 'Remember to FIX AGAIN after plugins update (or set it as a post update hook)'
  return 0
}

function main {
  syntax_catalogs_paths="$(find $1 -type d -name 'syntax' -print)"
  while read -r catalog_path ; do
      if ls "${catalog_path}" | grep .spellfix-backup; then
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

main ~/.config/nvim/plug
