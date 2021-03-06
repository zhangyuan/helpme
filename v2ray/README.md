# v2ray

## Install Dependencies

### Install Docker Engine (Debian)

The following script is from docker's [Official Document](https://docs.docker.com/engine/install/)

```bash
curl -fsSL https://raw.githubusercontent.com/zhangyuan/helpme/master/docker/install-docker-on-debian.sh | bash

```
## 生成配置文件

```bash
./config.sh
```

## Start the services

```bash
docker-compose up -d
```
## Check if the services are running

```bash
docker ps
```
