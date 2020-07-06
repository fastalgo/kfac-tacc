#!/bin/bash

echo "Copying imagenet-tiny.tar to local dir"
cp /scratch/00946/zzhang/data/imagenet-tiny.tar /scratch/03109/tg824074/data/tiny/
echo "Done copying. Extracting"
tar xf /scratch/03109/tg824074/data/tiny/imagenet-tiny.tar -C /scratch/03109/tg824074/data/tiny/
echo "Done."
