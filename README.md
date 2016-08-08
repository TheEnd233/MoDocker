# MoDocker

modo动漫私有云（modo.moe）的Docker构建用文件。

您可以基于modo动漫私有云的镜像进行修改和重新分发，但请注明based on modo.moe，thanks。

目前官网已经不可访问。

原帖： [v2ex](https://www.v2ex.com/t/225714?p=2)

视频说明： [土豆](http://www.tudou.com/programs/view/9gS3imQGw6g/)
# 功能说明：

* 免配置，一行代码即可安装完成。
* 使用 Aria2+Yaaw 作为离线工具，支持 BT 、 U 链、 HTTP 、百度云下载。
* 使用 KODExplorer 作为桌面工具，提供 WebOS 级别的文件管理体验，自带的播放器可以在线播放动画，没事你还可以换桌面玩。
* 和文件管理器深度整合的 Modo 漫画浏览器，能对图片进行压缩，方便支持通过浏览器和手机进行浏览。

# 修改
* 使用php7.0，性能更好
* 尽可能删除带有http协议的js/css/xhr资源
* 使用token验证
* token密码不再储存在yaaw.js中，储存于downlaod.html，运行后请及时更改download.html的文件名

# 构建
```bash
git clone https://github.com/huihuimoe/MoDocker
sudo docker build -t modo MoDocker
```

# 运行
```bash
sudo docker run -d -p 6801:80 -p 6800:6800 -v /data/comic:/var/www/html/comic modo
```

或者你也可以使用灰灰构建的image

```bash
sudo docker run -d -p 6801:80 -p 6800:6800 -v /data/comic:/var/www/html/comic huihuimoe/modo
```

然后需要再本机运行nginx，nginx的安装也不再多说……

在nginx中加入如下配置，请按自身条件修改