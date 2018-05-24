#!/bin/bash

array=(`ps aux | grep Clip[y]`)

if [ `echo $array | wc -w` -eq 0 ]; then # 起動してなかったら
  open /Applications/Clipy.app
  osascript -e 'display notification "is dead and has restarted." with title "Clipy"'
else
  if [ `echo ${array[2]}/1 | bc` -gt 10 ]; then # CPUが10を超えてたら
    kill ${array[1]}
    open /Applications/Clipy.app
    osascript -e 'display notification "has killed and restarted." with title "Clipy"'
  fi
fi
