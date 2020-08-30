# Shadowsocks

## 安装 luci-app-shadowsocks

```
opkg install luci-app-shadowsocks-libev
```

## 安装 luci-app-kcptun

见 <https://github.com/kuoruan/luci-app-kcptun>.

如果安装后，打开kcptun配置遇到如下错误：

```
/usr/lib/lua/luci/template.lua:97: Failed to execute template 'cbi/map'.
A runtime error occurred: /usr/lib/lua/luci/template.lua:97: Failed to execute template 'kcptun/status'.
A runtime error occurred: /usr/lib/lua/luci/model/kcptun.lua:49: module 'luci.model.ipkg' not found:
	no field package.preload['luci.model.ipkg']
	no file './luci/model/ipkg.lua'
	no file '/usr/share/lua/luci/model/ipkg.lua'
	no file '/usr/share/lua/luci/model/ipkg/init.lua'
	no file '/usr/lib/lua/luci/model/ipkg.lua'
	no file '/usr/lib/lua/luci/model/ipkg/init.lua'
	no file './luci/model/ipkg.so'
	no file '/usr/lib/lua/luci/model/ipkg.so'
	no file '/usr/lib/lua/loadall.so'
	no file './luci.so'
	no file '/usr/lib/lua/luci.so'
	no file '/usr/lib/lua/loadall.so'
stack traceback:
	[C]: in function 'require'
	/usr/lib/lua/luci/model/kcptun.lua:49: in function 'get_luci_version'
	[string "/usr/lib/lua/luci/view/kcptun/status.htm"]:7: in main chunk
stack traceback:
	[C]: in function 'error'
	/usr/lib/lua/luci/template.lua:97: in function 
	(tail call): ?
	/usr/lib/lua/luci/cbi.lua:282: in function 'render'
	/usr/lib/lua/luci/cbi.lua:266: in function 'render_children'
	[string "/usr/lib/lua/luci/view/cbi/map.htm"]:6: in main chunk
stack traceback:
	[C]: in function 'error'
	/usr/lib/lua/luci/template.lua:97: in function 
	(tail call): ?
	/usr/lib/lua/luci/cbi.lua:257: in function 'render'
	/usr/lib/lua/luci/cbi.lua:440: in function 'render'
	/usr/lib/lua/luci/dispatcher.lua:1433: in function '_cbi'
	/usr/lib/lua/luci/dispatcher.lua:1018: in function 'dispatch'
	/usr/lib/lua/luci/dispatcher.lua:478: in function 
```

那么安装 luci-lib-ipkg 

```
opkg install luci-lib-ipkg
```

## 配置

基本配置

1. 创建 Kcptun 客户端，记下本地监听端口 （比如 12000）。
2. 创建指向 Shadowsocks 服务器的远程服务器（Remote Server），用于 UDP 连接。假定名字为 `tcp_and_udp_server`。
3. 创建指向本地 Kcptun 服务器的远程服务器（Remote Server），即 127.0.0.1 的 12000 端口，用于 TCP 连接。假定名字为 `tcp_server`。
4. 创建本地实例 ss_redir，模式为 `tcp_and_udp`，远程服务器为 `tcp_and_udp_server`。
5. 创建本地实例 ss_redir，模式为 `tcp_only`，远程服务器为 `tcp_server`。
6. 配置 Redir Rules。将 `ss-redir for TCP`配置为 `tcp_server`，ss-redir for UDP` 配置为 `tcp_and_udp_server`。其它按需配置

配置DNS，使所有的DNS请求都转发到Google的DNS服务器。

1. 创建本地实例 ss_tunnel，模式为 `tcp_and_udp`，远程服务器为 `tcp_and_udp_server`。本地端口为 `53`，隧道地址为 `8.8.8.8:53`。
2. 修改 Dnsmasq 的端口为其它端口。在 `NetWork` - `DHCP and DNS` - `Server Settings` 中，修改 `DNS server port` 为其它端口。
` 






