#!/bin/bash

old_build_count='0'
old_build_time=0

while true
do
  current_build_count=$(
    ls '/home/dominikduda/github/catalyst/public/generated' | grep --invert-match 'video' | grep 'app\.' | wc -l
  )
  current_build_time=$(date +%s)
  if [ "$old_build_count" != "$current_build_count" ]; then
    old_build_count=$current_build_count
    old_build_time=$current_build_time
  fi
  time_diff=`expr $current_build_time - $old_build_time`
  echo -e "Build nr: $old_build_count\t done $time_diff seconds ago"
  sleep 1
done
