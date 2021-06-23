## k3s

我的小🐤上跑的k3s全部配置文件

### 安装

```shell
# latest channel
$ curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=latest INSTALL_K3S_EXEC="--tls-san SERVER_IP" sh -

# old channel 
$ curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.19.5+k3s2 sh -s - --disable=traefik
```

### 部署

略略略
