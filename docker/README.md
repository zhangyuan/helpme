# Docker

## 国内镜像设置

说明 https://mirrors.ustc.edu.cn/help/dockerhub.html

## 修改配置

### Ubuntu（使用Snap安装）

如果docker是通过snap安装的，那么修改 `/var/snap/docker/current/config/daemon.json` 文件，添加 registry，例如：

```
{
    "log-level":        "error",
    "storage-driver":   "overlay2",
    "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn/"]
}
```

重启

```
sudo snap restart docker.dockerd
```

### MacOS 配置 (Docker Desktop)

```
{
  "debug" : true,
  "registry-mirrors" : [
    "https://docker.mirrors.ustc.edu.cn",
    "https://hub-mirror.c.163.com"
  ],
  "experimental" : true
}
```
