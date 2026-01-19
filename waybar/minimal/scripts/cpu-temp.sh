#!/usr/bin/env bash
temp=$(sensors | awk '/^Package id 0:/ {print int($4)}')
alt=0
if [[ $temp -lt 50 ]]; then
  alt=0
elif [[ $temp -gt 50 ]] && [[ $temp -lt 65 ]]; then
  alt=1
elif [[ $temp -gt 65 ]] && [[ $temp -lt 80 ]]; then
  alt=2
elif [[ $temp -gt 80 ]]; then
  alt=3
fi
echo -e "{ \"text\":\"$temp\", \"alt\":\"$alt\" }"
