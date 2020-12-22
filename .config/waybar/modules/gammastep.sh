#!/usr/bin/env sh

class=$(gammastep -p 2>&1 | grep -e 'Notice: Period:' | awk '{print $3}' | tr '[:upper:]' '[:lower:]')

printf '{"text":"%s", "class":"%s", "alt":"%s", "tooltip":"%s"}' "$class" "$class" "$class" "$class"
