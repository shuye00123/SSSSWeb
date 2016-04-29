README
====
##依赖
java版本1.8，
tomcat7.0,
mySQL5.7.9
struts2.3.24,
spring4.0.2,
hibernate5.0.1
jar包可以再/webcontent/WEB-INF/lib里找到
##MySQL库结构
create table users (
userid int(6) not null auto_increment,
username varchar(8),
password varchar(10),
usex varchar(2),
post varchar(12),
primary key (userid)
);
