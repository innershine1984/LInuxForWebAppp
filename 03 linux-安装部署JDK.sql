--1.ͨ��rpm����jdk��java�İ�װ��Ϣ
rpm -qa | grep jdk

--2.����rpm -e --nodepsж��ϵͳ�Դ�jdk
rpm -e --nodeps java-1.8.0-openjdk-1.8.0.102-4.b14.el7.x86_64

--3.�ϴ���װ�ļ�������ִ��Ȩ�ޣ���ȡjdk��װ�ļ���ָ��Ŀ¼
chmod 755 jdk-8u66-linux-x64.tar.gz
tar -zvxf jdk-8u66-linux-x64.tar.gz

--4.����jdk��������
vi /etc/profile

#Java Env
export JAVA_HOME=/opt/mht/java/jdk1.8.0_66
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

--5.���沢ˢ�»�������
source /etc/profile

--6.����JDK�Ƿ�װ�ɹ�
java -version