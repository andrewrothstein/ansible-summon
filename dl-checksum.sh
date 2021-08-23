#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/cyberark/summon/releases/download

dl()
{
    local ver=$1
    local lshafile=$2
    local os=$3
    local arch=$4
    local archive_type=$5
    local platform="${os}-${arch}"
    local file=summon-${platform}.${archive_type}
    local url=$MIRROR/$ver/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `grep $file $lshafile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    local lshafile=$DIR/summon-${ver}-SHA256SUMS.txt

    if [ ! -e $lshafile ];
    then
        wget -q -O $lshafile $MIRROR/$ver/SHA256SUMS.txt
    fi

    printf "  %s:\n" $ver
    dl $ver $lshafile darwin amd64 tar.gz
    dl $ver $lshafile linux amd64 tar.gz
    dl $ver $lshafile windows amd64 zip
}

dl_ver ${1:-v0.9.0}
