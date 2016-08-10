FROM debian:sid
MAINTAINER HuiHui <0w0@loli.pet>

# 添加商业软件源
#deb http://archive.ubuntu.com/ubuntu xenial multiverse
#deb http://archive.ubuntu.com/ubuntu xenial-updates multiverse

#RUN echo "deb http://archive.ubuntu.com/ubuntu xenial multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://archive.ubuntu.com/ubuntu xenial-updates multiverse" >> /etc/apt/sources.list

#RUN sed -i 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list
RUN sed -i 's/main/main non-free/g' /etc/apt/sources.list
# 先更新系统
RUN apt-get update && apt-get dist-upgrade -y

# 安装unrar
RUN apt-get install unrar p7zip-full p7zip-rar -y

# 安装PHP和Apache
RUN apt-get install apache2-bin apache2-data apache2 php libapache2-mod-php php-mcrypt php-cli php-curl php-gd php-mbstring php-apcu -y

RUN apt-get clean

# 安装WebApp
RUN rm -Rf /var/www/html

RUN apt-get install git -y
RUN git clone https://github.com/huihuimoe/KODExplorer.git  /var/www/html


# 安装aria2
RUN apt-get install aria2 -y 

#RUN mkdir cldata
ADD aria2.conf /cldata/aria2.conf
COPY init.sh /cldata/init.sh
COPY init.php /cldata/init.php
RUN chmod +x /cldata/init.sh

WORKDIR /var/www/html/comic
VOLUME /var/www/html/comic


EXPOSE 80 6800 443

CMD /cldata/init.sh
