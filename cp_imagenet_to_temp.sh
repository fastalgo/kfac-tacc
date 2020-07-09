#!/bin/bash

echo "Copying imagenet.tar to /tmp/test/"
rm -rf /tmp/test/
mkdir /tmp/test/
cp /scratch/00946/zzhang/data/imagenet-1k.tar /tmp/test/
echo "Done copying. Extracting"
tar xf /tmp/test/imagenet-1k.tar -C /tmp/test/
echo "Done."
