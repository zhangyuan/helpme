# Debian

## 安装 Docker

### Docker

https://docs.docker.com/engine/install/debian/

### Docker Compose

https://docs.docker.com/compose/install/

## 实用命令

### 获取当前发行版名称

```bash
lsb_release -cs
```

## 挂载分区

查看分区

```
fdisk -l
```

比如找到磁盘为`/dev/sdb`， 查看UUID

```
blkid
```

若没有列出 `/dev/sdb`，那可能还未分区和格式化

```
fdisk /dev/sdb
```

格式化

```
mkfs -t ext4 /dev/sdb
```

创建挂载点并添加组权限

```
mkdir /mnt/data
groupadd data
chgrp data /mnt/data/
chmod g+w /mnt/data
chmod g+x /mnt/data

usermod -aG data {username}
```

自动挂载 

```
vi /etc/fstab
```

添加

```
UUID=5a82e561-724c-4af7-9d89-7f7e4028353d /mnt/data    auto nosuid,nodev,nofail,x-gvfs-show 0 0
```

测试

```
mount -a
```

## Samba

```
apt-get install samba
```

配置 /etc/samba/smb.conf

```
[shared]
	path=/mnt/data/shared
	public=yes
	browseable=yes
	writable=yes
	create mask=0666
	directory mask=0777
        force group = data
```


