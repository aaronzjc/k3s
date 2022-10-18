# 自动更新域名证书

export DP_ID="xxx"
export DP_SECRET="xxx"

/root/.acme.sh/acme.sh --issue --dns dnspod -d \*.memosa.cn

TLSCRT=$(cat /root/.acme.sh/\*.memosa.cn/\*.memosa.cn.cer | base64 -w 10000)
TLSKEY=$(cat /root/.acme.sh/\*.memosa.cn/\*.memosa.cn.key | base64 -w 10000)

K3S_FILE="/data/k3s/Secret/memosa-cn-tls.yml"

cat << EOF | tee ${K3S_FILE}
apiVersion: v1
kind: Secret
metadata:
  name: tls-memosa-cn
  namespace: k3s-apps
type: Opaque
data:
  tls.crt: ${TLSCRT}
  tls.key: ${TLSKEY}
EOF

k3s kubectl apply -f ${K3S_FILE}