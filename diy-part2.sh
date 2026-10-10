#!/bin/bash
# OpenWrt DIY script part2 (After Update feeds)

### 1. 把本仓库根目录的内核覆盖配置复制进openwrt源码
cp ../kernel-overrides.config ./
cat kernel-overrides.config >> .config

### 2. 关闭iwinfo相关包
sed -i '/CONFIG_DEFAULT_iwinfo/d' .config
sed -i '/CONFIG_PACKAGE_libiwinfo/d' .config
sed -i '/CONFIG_PACKAGE_libiwinfo-data/d' .config
sed -i '/CONFIG_PACKAGE_rpcd-mod-iwinfo/d' .config

echo "# CONFIG_DEFAULT_iwinfo is not set" >> .config
echo "# CONFIG_PACKAGE_libiwinfo is not set" >> .config
echo "# CONFIG_PACKAGE_libiwinfo-data is not set" >> .config
echo "# CONFIG_PACKAGE_rpcd-mod-iwinfo is not set" >> .config

### 3. 删除wifi相关源码包
rm -rf package/firmware/ath11k-firmware
rm -rf package/network/utils/iw
rm -rf package/network/config/wireless-regdb

### 4. make defconfig，规整全部配置，内核选项会被合并处理
make defconfig
