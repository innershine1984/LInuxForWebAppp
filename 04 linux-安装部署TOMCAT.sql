--1.�ϴ���װ�ļ�������ִ��Ȩ�ޣ���ȡtomcat��װ�ļ���ָ��Ŀ¼
chmod 755 apache-tomcat-8.0.50.tar.gz
tar -zvxf apache-tomcat-8.0.50.tar.gz


--2.����tomcat������ʶ˿�
vi /usr/local/tomcat/apache-tomcat-8.0.50/conf/server.xml

<Connector port="8060" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="84
/>


--3.��tomcat����˿���ӵ�����ǽ�����У�ֻ������centos7���°汾ϵͳ��
vi /etc/sysconfig/iptables

-A INPUT -m state --state NEW -m tcp -p tcp --dport 8060 -j ACCEPT

--4.��������ǽ����
service iptables restart


--5.��tomcatע��Ϊϵͳ���񣬲����ÿ�����������ѡ���裩
cp -p /usr/local/tomcat/apache-tomcat-8.0.50/bin/catalina.sh /etc/init.d/tomcat

--�ٱ༭tomcat�ļ�

vi /etc/init.d/tomcat

--����Ӷ�Ӧ���ݵ�tomcat�ļ��ĵڶ��У�������

# chkconfig: 112 63 37
# description: tomcat server init script
# Source Function Library
. /etc/init.d/functions
JAVA_HOME=/opt/mht/java/jdk1.8.0_66
CATALINA_HOME=/usr/local/tomcat/apache-tomcat-8.0.50

--��Ϊtomcat�ļ���Ȩ

chmod 755 /etc/init.d/tomcat

--�����tomcat��ϵͳ����

chkconfig --add tomcat

--�����ÿ�������

chkconfig tomcat on


--6.������ֹͣtomcat����

--��δע��ϵͳ�����������ֹͣ��ʽ�������tomcat��װ·���µ�binĿ¼�£�

cd /usr/local/tomcat/apache-tomcat-8.0.50/bin

./startup.sh
./shutdown.sh

--����ע��ϵͳ�����������ֹͣ��ʽ
service tomcat start
service tomcat stop


--7.�鿴tomcat�����Ƿ�ɹ�������ֹͣ
ps -ef|grep java
ps -ef|grep tomcat











