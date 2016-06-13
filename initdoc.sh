#!/bin/sh
#

if [ $0 = "$1" ];then
    # CMD
    shift
fi

CMD=$1

case $CMD in
    init)
    shift
    TITLE=${1-"Doc Title Here"}
    AUTHOR=${2:-"Doc Author Here"}
    rm -rf /mnt/mydocs
    mkdir -p /mnt/mydocs
    tar xvpf /tmp/template.tar -C /mnt/mydocs
    grep -Rl XXXAUTHORXXX /mnt/mydocs/ | xargs sed -i "s/XXXAUTHORXXX/${AUTHOR}/g"
    grep -Rl XXXTITLEXXX /mnt/mydocs/ | xargs sed -i "s/XXXTITLEXXX/${TITLE}/g"
    cd /mnt/mydocs && make html
    ;;

    *)
    echo "[$CMD] nothing to do"
    ;;
esac
