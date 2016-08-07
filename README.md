# MoDocker

modo动漫私有云（modo.moe）的Docker构建用文件。

您可以基于modo动漫私有云的镜像进行修改和重新分发，但请注明based on modo.moe，thanks。

# 修改
* 使用php7.0，性能更好
* 尽可能删除带有http协议的js/css/xhr资源
* 使用token验证
* token密码不再储存在yaaw.js中，储存于downlaod.html，运行后请及时更改download.html的文件名

# 构建
```bash
git clone https://github.com/huihuimoe/MoDocker
docker build -t modo MoDocker
```

# 运行
```bash
docker run -d -p 6801:80 -p 6800:6800 -v /data/comic:/var/www/html/comic modo
```

然后需要再本机运行nginx，nginx的安装也不再多说……

在nginx中加入如下配置，请按自身条件修改