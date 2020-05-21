# armbian

## 软件源镜像

镜像地址 https://mirrors.tuna.tsinghua.edu.cn/armbian 。

比如对于`buster`，修改 `/etc/apt/sources.list` 为：

```
deb https://mirrors.tuna.tsinghua.edu.cn/debian buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian buster-backports main contrib non-free
deb http://security.debian.org/ buster/updates main contrib non-free
```

修改 `/etc/apt/sources.list.d/armbian.list` 为：

```
deb https://mirrors.tuna.tsinghua.edu.cn/armbian buster main buster-utils buster-desktop
```

