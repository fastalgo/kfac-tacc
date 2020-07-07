#!/bin/bash

echo "Copying imagenet.tar to /tmp/"
cp /scratch/00946/zzhang/data/imagenet-1k.tar /tmp/
echo "Done copying. Extracting"
tar xf /tmp/imagenet-1k.tar -C /tmp/
echo "Done."
