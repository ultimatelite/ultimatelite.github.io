#!/usr/bin/bash
# USED FOR DEBUGGING PURPOSE ONLY, HAS NO REAL IMPACT ON THE WEB.

i=1
for file in *; do
    if [ -f "$file" ]; then
        ext="${file##*.}"
        if [ "$ext" == "jpg" ] || [ "$ext" == "jpeg" ]; then
            newname="membrane${i}.${ext}"
            echo "Renaming '$file' to '$newname'"
            mv "$file" "$newname"
            i=$((i + 1))
            if [ $i -gt 23 ]; then
                break
            fi
        fi
    fi
done