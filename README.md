README
====
###依赖
java版本1.8，<br>
tomcat7.0,<br>
mySQL5.7.9<br>
struts2.3.24,<br>
spring4.0.2,<br>
hibernate5.0.1<br>
jar包可以再/webcontent/WEB-INF/lib里找到
###MySQL库结构
create table users (<br>
userid int(6) not null auto_increment,<br>
username varchar(8),<br>
password varchar(10),<br>
usex varchar(2),<br>
post varchar(12),<br>
primary key (userid)<br>
);
