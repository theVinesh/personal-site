#!/bin/sh
version_string=`git describe --abbrev=1 | sed 's/-/./g'`
# split version_string
IFS='.' read -ra major_minor_patch <<< "${version_string:1}"

major=${major_minor_patch[0]}
minor=${major_minor_patch[1]}
patch=${major_minor_patch[2]}
commit_hash=${major_minor_patch[3]}

if (( $patch > 9 )); then 
    patch=0
    minor=$((minor+1))
fi

if (( $minor > 9 )); then 
    minor=0
    major=$((major+1))
fi

export VERSION="v$major.$minor.$patch"
echo "$VERSION"

curl -X POST \
  https://api.github.com/repos/theVinesh/personal-site/releases \
  -H 'Accept: application/vnd.github.v3+json' \
  -H 'Authorization: token '$GITHUB_TOKEN'' \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
  "tag_name": "'$VERSION'",
  "target_commitish": "master",
  "name": "'$VERSION'",
  "draft": true
}
' > /dev/null
