idev -N 2 -n 8 -p development
module load conda
conda activate pytorch-test
scontrol show hostname > hostfile
mpiexec -hostfile ./hostfile -N 1 cp_imagenet_to_temp.sh
mpiexec -hostfile hostfile -N 4 killall -9 python
mpiexec -hostfile hostfile -N 4 python examples/pytorch_imagenet_resnet.py --model resnet50 --kfac-update-freq 0 --epochs 90 --base-lr 0.0125 --warmup-epochs 5 --batch-size 32 --train-dir=/tmp/ILSVRC2012img_train/ --val-dir=/tmp/ILSVRC2012_img_val/
#mpiexec -hostfile hostfile -N 4 python examples/pytorch_imagenet_resnet.py --model resnet50 --kfac-update-freq 2000 --kfac-cov-update-freq 200 --epochs 5 --base-lr 0.0125 --lr-decay 25 35 40 45 50 --warmup-epochs 5 --damping 0.001 --train-dir=/scratch/03109/tg824074/data/tiny/imagenet/ILSVRC2012_img_train/ --val-dir=/scratch/03109/tg824074/data/tiny/imagenet/ILSVRC2012_img_val
