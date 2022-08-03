#!/bin/sh
cur_dir=$(cd `dirname $0`;pwd)
out_dir=$cur_dir/../out
zimage_dir=$cur_dir/arch/arm/boot/zImage
dtb_dir=$cur_dir/arch/arm/boot/dts/imx6ull-alientek-emmc.dtb

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_alientek_emmc_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- all -j16

if [ ! -d $out_dir ]; then
    mkdir $out_dir
fi

if [ -f $zimage_dir -a -f $dtb_dir ]; then
    cp $zimage_dir $out_dir/zImage
    echo "out --> $out_dir/zImage"

    cp $dtb_dir $out_dir/imx6ull-alientek-emmc.dtb
    echo "out --> $out_dir/imx6ull-alientek-emmc.dtb"
fi