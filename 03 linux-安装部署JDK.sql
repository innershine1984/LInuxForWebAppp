--1.通过rpm查找jdk和java的安装信息
rpm -qa | grep jdk

--2.调用rpm -e --nodeps卸载系统自带jdk
rpm -e --nodeps java-1.8.0-openjdk-1.8.0.102-4.b14.el7.x86_64

--3.上传安装文件，赋予执行权限，提取jdk安装文件到指定目录
chmod 755 jdk-8u66-linux-x64.tar.gz
tar -zvxf jdk-8u66-linux-x64.tar.gz

--4.配置jdk环境变量
vi /etc/profile

#Java Env
export JAVA_HOME=/opt/mht/java/jdk1.8.0_66
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

--5.保存并刷新环境变量
source /etc/profile

--6.测试JDK是否安装成功
java -version