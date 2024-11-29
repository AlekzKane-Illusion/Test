# 下载节点配置文件，根据实际的订阅地址填写
wget -O /volume1/docker/clash/config.yaml 'https://api.wd-turbo.com/sub?target=clash&emoji=true&udp=true&scv=true&new_name=true&filename=WD_Trojan.yaml&url=https%3A%2F%2Fwd-turbo.com%2Fsubscribe%2Fayjax-ouzprxpm'
# external-controller地址为0.0.0.0:9090，方便UI访问（可选）
sed -i 's/192.168.3.29:9090/0.0.0.0:9090/g' /volume1/docker/clash/config.yaml
# 增加安全性，配置使用代理的用户名和密码（可选）
sed -i 's/allow-lan: true/allow-lan: true\r\nauthentication:\r\n - "tuohai910:zhyZHY67597013"\r\n - "ZhousGuest:67597013"/g' /volume1/docker/clash/config.yaml
# 去掉重启Docker，调用API刷新：
curl --location --request PUT 'http://localhost:9090/configs' \
--header 'Content-Type: application/json' \
--data-raw '{"path": "/root/.config/clash/config.yaml"}'