README
====
###依赖
*Java版本1.8，<br>
*Tomcat7.0,<br>
*MySQL5.7.9<br>
*Struts2.3.24,<br>
*Spring4.0.2,<br>
*Hibernate5.0.1<br>
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
