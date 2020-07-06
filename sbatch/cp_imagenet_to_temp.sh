#!/bin/bash

echo "Copying imagenet.tar to /tmp/"
cp /scratch/00946/zzhang/data/imagenet-1k.tar /scratch/03109/tg824074/data/
echo "Done copying. Extracting"
tar xf /scratch/03109/tg824074/data/imagenet-1k.tar -C /scratch/03109/tg824074/data/
echo "Done."
