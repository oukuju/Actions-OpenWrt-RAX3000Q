#!/bin/bash
# OpenWrt DIY script part2 (After Update feeds)

### 1. 修改ipq50xx平台内核配置，关闭MHI总线驱动【核心修复，跳过出错内核代码】
sed -i '/CONFIG_MHI_BUS/d' target/linux/ipq50xx/config-5.4
echo "# CONFIG_MHI_BUS is not set" >> target/linux/ipq50xx/config-5.4

### 2. 根目录.config同步关闭MHI，双重保险
sed -i '/CONFIG_KERNEL_MHI_BUS/d' .config
echo "# CONFIG_KERNEL_MHI_BUS is not set" >> .config

### 3. 关闭iwinfo相关包，解决镜像自动打包libiwinfo问题
# 删除旧配置行
sed -i '/CONFIG_DEFAULT_iwinfo/d' .config
sed -i '/CONFIG_PACKAGE_libiwinfo/d' .config
sed -i '/CONFIG_PACKAGE_libiwinfo-data/d' .config
sed -i '/CONFIG_PACKAGE_rpcd-mod-iwinfo/d' .config
# 写入禁用标记
echo "# CONFIG_DEFAULT_iwinfo is not set" >> .config
echo "# CONFIG_PACKAGE_libiwinfo is not set" >> .config
echo "# CONFIG_PACKAGE_libiwinfo-data is not set" >> .config
echo "# CONFIG_PACKAGE_rpcd-mod-iwinfo is not set" >> .config

### 4. 删除wifi相关源码包，避免编译打包wifi固件文件
rm -rf package/firmware/ath11k-firmware
rm -rf package/network/utils/iw
rm -rf package/network/config/wireless-regdb

### 5. 规整所有配置，处理依赖关系（必须放最后）
make defconfig

