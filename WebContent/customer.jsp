<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <style>
        .head {
            width:100%;
            height: 50px;
            background-color: #56abff;
        }
        .text {
        	font-size : 20px;
            padding-top: 10px;
        }
    </style>
</head>

<body>
<div class="head">
   	<p class="text">所有用户</p>
</div>
<table class="table table-hover" id="list" >
    <tr>
        <td width="100px">用户编号</td>
        <td width="100px">用户名</td>
        <td width="100px">性别</td>
        <td width="100px">工作</td>
        <td width="100px">联系电话</td>
        <td width="100px">联系地址</td>
        <td width="100px">身份证 </td>
        <td width="100px">备注</td>
    </tr>
    
    
</table>






<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>

	 $(function(){
	 	$.ajax ({
 			type : 'post',
 			url : 'sACoustomerA.action',
   			dataType:'json', 
   			success:function(data){ 
   		 	var json = eval(data);
   			 $.each(json, function (i) {  
             	$.each(json[i], function (j) {  
             		var customer_no = json[i][j].customer_no;  
             		var customer_name = json[i][j].customer_name;  
             		var sex = json[i][j].sex; 
             		var job = json[i][j].job; 
             		var tel = json[i][j].tel; 
             		var addr = json[i][j].addr; 
             		var idcard = json[i][j].idcard; 
             		var remark = json[i][j].remark; 
             		$("#list").append("<tr><td>"+customer_no+"</td><td>"+customer_name+"</td><td>"+sex+"</td><td>"+job+"</td><td>"+tel+"</td><td>"+addr+"</td><td>"+idcard+"</td><td>"+remark+"</td><td>"); 
                 
         });
   			 });
      		},
      		error :function(data){
      		alert("error");
      		}  
 		});
	 	 
	 	
	 	
	 });
	 

	 		
	 	
	 	
</script>
</body>
</html>