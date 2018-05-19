--1.上传安装文件，赋予执行权限，提取tomcat安装文件到指定目录
chmod 755 apache-tomcat-8.0.50.tar.gz
tar -zvxf apache-tomcat-8.0.50.tar.gz


--2.配置tomcat服务访问端口
vi /usr/local/tomcat/apache-tomcat-8.0.50/conf/server.xml

<Connector port="8060" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="84
/>


--3.将tomcat服务端口添加到防火墙策略中（只适用于centos7以下版本系统）
vi /etc/sysconfig/iptables

-A INPUT -m state --state NEW -m tcp -p tcp --dport 8060 -j ACCEPT

--4.重启防火墙服务
service iptables restart


--5.将tomcat注册为系统服务，并设置开机启动（可选步骤）
cp -p /usr/local/tomcat/apache-tomcat-8.0.50/bin/catalina.sh /etc/init.d/tomcat

--①编辑tomcat文件

vi /etc/init.d/tomcat

--②添加对应内容到tomcat文件的第二行，并保存

# chkconfig: 112 63 37
# description: tomcat server init script
# Source Function Library
. /etc/init.d/functions
JAVA_HOME=/opt/mht/java/jdk1.8.0_66
CATALINA_HOME=/usr/local/tomcat/apache-tomcat-8.0.50

--③为tomcat文件授权

chmod 755 /etc/init.d/tomcat

--④添加tomcat到系统服务

chkconfig --add tomcat

--⑤设置开机启动

chkconfig tomcat on


--6.启动、停止tomcat服务

--①未注册系统服务的启动、停止方式（需进入tomcat安装路径下的bin目录下）

cd /usr/local/tomcat/apache-tomcat-8.0.50/bin

./startup.sh
./shutdown.sh

--②已注册系统服务的启动、停止方式
service tomcat start
service tomcat stop


--7.查看tomcat服务是否成功启动、停止
ps -ef|grep java
ps -ef|grep tomcat











