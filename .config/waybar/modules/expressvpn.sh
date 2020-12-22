#!/usr/bin/env sh

text=$(expressvpn status | sed -f ~/.config/sed/normalize |  tr '\n' ' -- ')

if [[ $text = *"not connected"* ]]; then
  class="not-connected"
elif [[ $text = *connecting* ]]; then
  class="connecting"
elif [[ $text = *"connected to"* ]]; then 
  class="connected"
else
  class="unknown"
fi

printf '{"text":"%s", "class":"%s", "alt":"%s", "tooltip":"%s"}\n' "$text" "$class" "$class" "$text"
