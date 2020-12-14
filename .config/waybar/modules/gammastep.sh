#!/bin/sh

class=$(gammastep -p 2>&1 | grep -e 'Notice: Period:' | awk '{print $3}')

if [[ $class == "Night" ]]; then
  text=""
elif [[ $class == "Daytime" ]]; then
  text=""
else text=""
fi

echo -e "{\"text\":\"" $text "\", \"class\":\""$class"\"}"

