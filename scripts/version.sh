#!/bin/bash
version_string=`git describe --tags \`git rev-list --tags --max-count=1\` | sed 's/-/./g'`
# split version_string
IFS=. read -r major minor patch<<<"${version_string:1}"
# increment version
patch=$((patch+1))
if (( $patch > 9 )); then 
    patch=0
    minor=$((minor+1))
fi

if (( $minor > 9 )); then 
    minor=0
    $((major+=1))
fi

export VERSION="v$major.$minor.$patch"
echo "version: $VERSION"