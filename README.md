## k3s

我的小🐤上跑的k3s全部配置文件

### 安装

```shell
# latest channel
$ curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=latest sh -

# old channel 
$ curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.19.5+k3s2 sh -s - --disable=traefik
```

### 部署

```shell
# 1. 创建命名空间
kubectl apply -f Namespace/
# 2. 创建配置文件
kubectl apply -f ConfigMap/
# 3. 部署Pods
kubectl apply -f Deployment/
# 4. 部署Services
kubectl apply -f SvcRoute/svcs/
# 5. 部署traefik中间件
kubectl apply -f SvcRoute/mw/
# 6. 部署ingress
kubectl apply -f SvcRoute/ingress/
```