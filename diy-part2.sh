#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#!/bin/bash
# OpenWrt DIY script part2 (After Update feeds)

### 修复MHI驱动编译报错：关闭内核Werror，警告不当错误处理
sed -i 's/-Werror//g' target/linux/generic/patches-5.4/999-warnings-disable.patch 2>/dev/null || true
sed -i '/KBUILD_CFLAGS += -Werror/d' ./Makefile
export KCFLAGS="-Wno-error"

### 删除wifi相关源码包，避免编译打包wifi固件文件
rm -rf package/firmware/ath11k-firmware
rm -rf package/network/utils/iw
rm -rf package/network/config/wireless-regdb

### 加载根目录的.config并自动处理依赖，非常关键！
make defconfig

