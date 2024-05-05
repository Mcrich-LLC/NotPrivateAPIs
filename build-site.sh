#! /bin/bash

if [ -d "./Build" ]; then
    rm -rf ./Build
fi

if [ -d "./DocBuild" ]; then
    rm -rf ./DocBuild
fi

mkdir ./Build

cp -r './Main Site Sources/' ./Build/ && swift package --allow-writing-to-directory ./ \
    generate-documentation --target NotPrivateAPIs \
    --disable-indexing \
    --transform-for-static-hosting \
    --experimental-enable-custom-templates \
    --hosting-base-path / \
    --output-path ./DocBuild \

cp -nr ./DocBuild/. ./Build/ || true

if [ -d "./DocBuild" ]; then
    rm -rf ./DocBuild
fi