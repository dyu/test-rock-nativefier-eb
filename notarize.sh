#!/bin/sh

[ ! -n "$1" ] && echo '1st arg (version) is required.' && exit 1

cat <<EOF > /tmp/notarize.json
{
  "notarize": [
    {
      "path": "dist/RockNEB-$1.dmg",
      "bundle_id": "com.github.dyu.rockneb",
      "staple": true
    },
    {
      "path": "dist/RockNEB-$1-arm64.dmg",
      "bundle_id": "com.github.dyu.rockneb",
      "staple": true
    }
  ],
  "apple_id": {
     "username": "@env:AC_USERNAME",
     "password": "@env:AC_PASSWORD"
  }
}
EOF

gon -log-level=debug -log-json /tmp/notarize.json