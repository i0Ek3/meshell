#!/bin/bash
## 
## iso2img.sh
## @i0Ek3(kno30826@gmail.com)
## 2018-08-24 17:26:59
## 
 
#!/bin/bash

# Usage info
usage() {
    cat << EOF
    Usage: ./iso2img.sh \$1 \$2
    example: ./iso2img.sh ~/target.img ~/source.iso
EOF
}

# $1 is target img, $2 is you iso file
if [ -e $1 && $2 ]
then
    hdiutil convert -format UDRW -o $1 $2
    echo "Convert is done, please rename target.img.dmg to target.img."
else
    usage
fi
