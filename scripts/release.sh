#!/bin/bash
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
'
