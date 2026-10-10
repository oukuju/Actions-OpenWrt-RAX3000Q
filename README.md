## 当前全部裁剪进度汇总

1. ✅WiFi 整套驱动 / 固件 / 工具全部禁用
2. ✅LuCI 多余插件、第三方主题、翻译包清理，保留基础网页管理
3. ✅独立后台常驻程序全部清理
4. ✅调试工具、perl 整套全部清理；保留 mtd/uboot‑envtools/opkg/uclient‑fetch
5. ⏭️**跳过第四部分：IPv6 全部保留不做任何修改**
6. ✅第五部分内核模块：删除 sit/gre/pptp 隧道 VPN；保留 tun、macvlan、gpio‑button‑hotplug、全套 NSS
7. ✅第六部分内核调试选项：关闭 DEBUG_FS、KALLSYMS、DEBUG_INFO、MAGIC_SYSRQ、KEXEC、CRASH_DUMP、COREDUMP；保留 cgroups/zram‑swap
8. ✅第七部分：校验全部核心必保项，NSS、PPP、dnsmasq、dropbear、uhttpd、flash 工具完整保留
Build Immortalwrt for CMCC RAX3000Q/QY using GitHub Actions

Kernel Version : 5.4-QSDK

- Support IPV6
- Support Wi-Fi NSS
- Support NAT NSS

Base from [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

Get SSH: [GetSSH](https://hugo.utermux.dev/default/rax3000q-latest/)

UBoot: [UBoot](https://github.com/hzyitc/openwrt-redmi-ax3000/issues/73#issuecomment-2259591683) Set computer ip to:192.168.1.8, use LAN1 port.

## Acknowledgments

- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [ImmortalWrt](https://github.com/kkstone/immortalwrt-ipq50xx)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © P3TERX 
