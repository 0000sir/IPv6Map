# IPv6Map

一个显示已经接通IPv6并且网站能打开的大学的应用

## 结果演示

[普通样式](http://ipv6.nacta.edu.cn)

[聚合样式](http://ipv6.nacta.edu.cn/map/index/cluster)

[没有IPv6的学校](http://ipv6.nacta.edu.cn/map/no_ipv6)


![IPv6Map](./IPv6Map.png)

## Docker和docker-compose ipv6设置
### docker设置
在 /etc/docker/daemon.json 中添加以下内容

各种文档都说v6地址前缀应该不小于80，不过好像没有明确的依据
```
{
	"ipv6": true,
	"fixed-cidr-v6": "2001:19F0:7001:52DF:1::/80"
}
```

安装 ndppd 并在 /etc/ndppd.conf 中加入以下内容（可能只是在vultr的网络环境里需要？）

```
proxy ens3{
	router yes
	rule 2001:19F0:7001:52DF::/64 {
		static
	}
}
```

docker-compose.yml 文件中增加网络配置，注意版本不能低于2.1，似乎也不能是3
```
version: "2.2"
services:
  www:
    build: .
    environment:
      - BAIDU_MAP_KEY=yqNBwoxylESGMyXzCZBWkVr6TpVdd5lW
      - BAIDU_MAP_JS_KEY=A5GMnAGtc3KcP4Eq5fhaUfB7H6ocuwaI
    volumes:
      - ./:/opt/www
    ports:
      - 3000:3000
    networks:
            innernet:
                    ipv4_address: 172.16.233.10
                    ipv6_address: 2001:19F0:7001:52DF::0110

networks:
   innernet:
       driver: bridge
       enable_ipv6: true
       ipam:
           driver: default
           config:
               - subnet: 172.16.233.0/24
                 gateway: 172.16.233.1
               - subnet: 2001:19F0:7001:52DF::0100/120
                 gateway: 2001:19F0:7001:52DF::0101
```