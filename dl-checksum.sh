#!/usr/bin/env sh
VER=v0.7.0
DIR=~/Downloads
MIRROR=https://github.com/cyberark/summon/releases/download/${VER}

RSHAFILE=SHA256SUMS.txt
LSHAFILE=$DIR/summon-${VER}-SHA256SUMS.txt

if [ ! -e $LSHAFILE ];
then
    wget -q -O $LSHAFILE $MIRROR/$RSHAFILE
fi

dl()
{
    OS=$1
    ARCH=$2
    ARCHIVETYPE=$3
    PLATFORM=${OS}-${ARCH}
    FILE=summon-${PLATFORM}.${ARCHIVETYPE}
    URL=$MIRROR/$FILE

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `grep $FILE $LSHAFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl darwin amd64 tar.gz
dl linux amd64 tar.gz
dl windows amd64 zip


