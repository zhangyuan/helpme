# v2ray


## Install Dependencies

### Install Docker Engine (Debian)

The following script is from docker's [Official Document](https://docs.docker.com/engine/install/)

```bash
curl -fsSL https://raw.githubusercontent.com/zhangyuan/helpme/master/docker/install-docker-on-debian.sh | bash

```
## 生成配置文件

生成UID

```bash
python -c 'import uuid; print(str(uuid.uuid1()))'
```

Let's say UID is `6a11cd68-7e42-11eb-9ef3-acde48001122`, run

```bash
cp config/v2ray.example.json config/v2ray.json && sed -i 's/00000000000000000000/6a11cd68-7e42-11eb-9ef3-acde48001122/g' config/v2ray.json

cp config/mkcp.example.json config/mkcp.json && sed -i 's/00000000000000000000/6a11cd68-7e42-11eb-9ef3-acde48001122/g' config/mkcp.json
```

## 运行

```bash
docker-compose up -d
```

确保docker容器已经运行

```bash
docker ps
```
