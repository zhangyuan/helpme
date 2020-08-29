# OpenWrt

## 软件源镜像地址

### 原始镜像

配置位于 `/etc/opkg/distfeeds.conf`，注意不同架构的地址不同

```
src/gz openwrt_core http://downloads.openwrt.org/releases/19.07.3/targets/ramips/mt76x8/packages
src/gz openwrt_kmods http://downloads.openwrt.org/releases/19.07.3/targets/ramips/mt76x8/kmods/4.14.180-1-d92769dc5268e102503ae83fe968a56c
src/gz openwrt_base http://downloads.openwrt.org/releases/19.07.3/packages/mipsel_24kc/base
src/gz openwrt_luci http://downloads.openwrt.org/releases/19.07.3/packages/mipsel_24kc/luci
src/gz openwrt_packages http://downloads.openwrt.org/releases/19.07.3/packages/mipsel_24kc/packages
src/gz openwrt_routing http://downloads.openwrt.org/releases/19.07.3/packages/mipsel_24kc/routing
src/gz openwrt_telephony http://downloads.openwrt.org/releases/19.07.3/packages/mipsel_24kc/telephony
```

### 国内镜像

（注意架构，下面是 x86_64 架构）

#### HTTP

```
src/gz openwrt_core http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/targets/ramips/mt76x8/packages
src/gz openwrt_kmods http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/targets/ramips/mt76x8/kmods/4.14.180-1-d92769dc5268e102503ae83fe968a56c
src/gz openwrt_base http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/base
src/gz openwrt_luci http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/luci
src/gz openwrt_packages http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/packages
src/gz openwrt_routing http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/routing
src/gz openwrt_telephony http://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/telephony
```

#### HTTPS

下载 HTTPS 相关的 软件包

```
opkg install wget ca-certificates libustream-openssl
```

更新软件源 

```
src/gz openwrt_core https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/targets/ramips/mt76x8/packages
src/gz openwrt_kmods https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/targets/ramips/mt76x8/kmods/4.14.180-1-d92769dc5268e102503ae83fe968a56c
src/gz openwrt_base https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/base
src/gz openwrt_luci https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/luci
src/gz openwrt_packages https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/packages
src/gz openwrt_routing https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/routing
src/gz openwrt_telephony https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/19.07.3/packages/mipsel_24kc/telephony
```

## 常用软件


### shadowsocks

```
opkg install luci-app-shadowsocks-libev
```

https://github.com/shadowsocks/luci-app-shadowsocks

To fix DNS, add DHCP-Options `6,8.8.8.8,8.8.4.4` for the network interface.

### kcptun

https://github.com/kuoruan/luci-app-kcptun

`luci-lib-ipkg` may be required.

### v2ray

https://github.com/kuoruan/luci-app-v2ray

## 查看日志

```
logread
```

https://openwrt.org/docs/guide-user/base-system/log.essentials

