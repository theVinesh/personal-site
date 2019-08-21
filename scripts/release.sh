#!/bin/bash
version_string=`git describe --abbrev=1 | sed 's/-/./g'`
# split version_string
IFS=. read -r major minor patch commit_hash<<<"${version_string:1}"

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
