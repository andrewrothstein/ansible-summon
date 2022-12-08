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
    local archive_type=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file=summon-${platform}.${archive_type}
    local url=$MIRROR/v$ver/$file

    local shasum=$(grep $file $lshafile | awk '{print $1}')
    if [ ! -z $shasum ];
    then
        printf "    # %s\n" $url
        printf "    %s: sha256:%s\n" $platform $shasum
    fi
}

dl_ver() {
    local ver=$1
    local lshafile=$DIR/summon-${ver}-SHA256SUMS.txt

    if [ ! -e $lshafile ];
    then
        curl -sSLf -o $lshafile $MIRROR/v$ver/SHA256SUMS.txt
    fi

    printf "  '%s':\n" $ver
    dl $ver $lshafile darwin amd64
    dl $ver $lshafile darwin arm64
    dl $ver $lshafile linux amd64
    dl $ver $lshafile solaris amd64
    dl $ver $lshafile windows amd64 zip
}

dl_ver ${1:-0.9.5}
