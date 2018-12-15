#!/bin/bash
echo "Download blobs"
if [ $1 ]
then
  VERSION=$1
else
  VERSION=0.0.1
fi
if [ ! -d .downloads ]; then
  mkdir -p .downloads
fi
curl -L https://github.com/shreddedbacon/uaa-proxifier/releases/download/v$VERSION/uaaproxy > .downloads/uaaproxy
bosh add-blob .downloads/uaaproxy uaaproxy/uaaproxy
