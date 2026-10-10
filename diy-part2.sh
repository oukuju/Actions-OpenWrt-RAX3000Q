#!/bin/bash
# OpenWrt DIY script part2 (After Update feeds)

### 1. 修改ipq50xx平台内核配置，关闭MHI总线驱动【核心修复】
sed -i '/CONFIG_MHI_BUS/d' target/linux/ipq50xx/config-5.4
echo "# CONFIG_MHI_BUS is not set" >> target/linux/ipq50xx/config-5.4

### 2. 根目录.config同步关闭，双重保险
sed -i '/CONFIG_KERNEL_MHI_BUS/d' .config
echo "# CONFIG_KERNEL_MHI_BUS is not set" >> .config

### 删除wifi相关源码包，避免编译打包wifi固件文件
rm -rf package/firmware/ath11k-firmware
rm -rf package/network/utils/iw
rm -rf package/network/config/wireless-regdb

### 规整配置
make defconfig
