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
        .img {
            width: 30px;
            height: 30px;
            margin: 10px 0 0 20px;
        }

        .img1 {
            width: 20px;
            height: 20px;
        }

        .head {
            width:100%;
            height: 50px;
            background-color: #56abff;
        }
    </style>
</head>

<body>
<div class="head">
    <img class="img" data-toggle="modal" data-target="#add" src="image/add.png" >
</div>
<table class="table table-hover" id="list" >
    <tr>
        <td width="100px">供应商名称</td>
        <td width="100px">联系人</td>
        <td width="100px">联系电话</td>
        <td width="100px">地址</td>
        <td width="100px">开户银行</td>
        <td width="100px">银行账户 </td>
        <td width="100px">备注</td>
        <td width="100px">操作</td>
    </tr>
    
    
</table>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增</h4>
            </div>
            <form action="siA" method="post">
            <div class="modal-body">
                
                    <div class="form-group">
                        <label>供应商名称:</label>
                        <input type="text" class="form-control" name="supplier_name" required>
                    </div>
                    <div class="form-group">
                        <label>联系人:</label>
                        <input type="text" class="form-control" name="contact" required>
                    </div>
                    <div class="form-group">
                        <label>联系电话:</label>
                        <input type="text" class="form-control" name="contact_tel" required>
                    </div>
                    <div class="form-group">
                        <label>	联系地址:</label>
                        <input type="text" class="form-control" name="contact_addr" required>
                    </div>
                    <div class="form-group">
                        <label>开户银行:</label>
                        <input type="text" class="form-control" name="account_bank" required>
                    </div>
                    <div class="form-group">
                        <label>银行账号:</label>
                        <input type="text" class="form-control" name="account_num" required>
                    </div>
                    <div class="form-group">
                        <label>备注:</label>
                        <textarea class="form-control" name="remark"></textarea>
                    </div>

               

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary" id="addaction" >新增</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑</h4>
            </div>
             <form action="seA" method="post" >
            <div class="modal-body" id="ed" >
               
                    <input type="hidden" name="supplier_id">
                    <div class="form-group">
                        <label>供应商名称:</label>
                        <input type="text" class="form-control" name="supplier_name" required>
                    </div>
                    <div class="form-group">
                        <label>联系人:</label>
                        <input type="text" class="form-control" name="contact" required>
                    </div>
                    <div class="form-group">
                        <label>联系电话:</label>
                        <input type="text" class="form-control" name="contact_tel" required>
                    </div>
                    <div class="form-group">
                        <label>	联系地址:</label>
                        <input type="text" class="form-control" name="contact_addr" required>
                    </div>
                    <div class="form-group">
                        <label>开户银行:</label>
                        <input type="text" class="form-control" name="account_bank" required>
                    </div>
                    <div class="form-group">
                        <label>银行账号:</label>
                        <input type="text" class="form-control" name="account_num" required>
                    </div>
                    <div class="form-group">
                        <label>备注:</label>
                        <textarea class="form-control" name="remark"></textarea>
                    </div>

                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary">保存</button>
            </div>
            </form>
        </div>
    </div>
</div>


<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>

	 $(function(){
	 	$('#add').modal({
	 		show: false,
	 		backdrop: 'static', 
	 		keyboard: false
	 	});
	 	$('#edit').modal({
	 		show: false,
	 		backdrop: 'static', 
	 		keyboard: false
	 	});
	 	$.ajax ({
 			type : 'post',
 			url : 'ssA.action',
   			dataType:'json', 
   			success:function(data){ 
   		 	var json = eval(data);
   			 $.each(json, function (i) {  
             	$.each(json[i], function (j) {  
             		var supplier_id = json[i][j].supplier_id;  
             		var supplier_name = json[i][j].supplier_name;  
             		var contact = json[i][j].contact; 
             		var contact_tel = json[i][j].contact_tel; 
             		var contact_addr = json[i][j].contact_addr; 
             		var account_bank = json[i][j].account_bank; 
             		var account_num = json[i][j].account_num; 
             		var remark = json[i][j].remark; 
             		$("#list").append("<tr>"+'<input type="hidden" name="supplier_id" value="'+supplier_id+'">'+"<td>"+supplier_name+"</td><td>"+contact+"</td><td>"+contact_tel+"</td><td>"+contact_addr+"</td><td>"+account_bank+"</td><td>"+account_num+"</td><td>"+remark+"</td><td>"+
            		'<img class="img1" data-toggle="modal" onclick="edit(this)" data-target="#edit" src="image/edit.png">&nbsp;'+
                    '<a href="sdA?supplier_id='+supplier_id+'" ><img class="img1" src="image/delete.png"></a></td><tr>'); 
                 
         });
   			 });
      		},
      		error :function(data){
      		alert("error");
      		}  
 		});
	 	 
	 	
	 	
	 });
	 function edit(obj){
		 	var $me = $(obj);
	 		$("#ed").find("input[type=hidden]").val($me.parent().parent().find("input[type=hidden]").val());
	 		var $data = $me.parents('tr').children('td');
	 		$("#ed").find("input[name=supplier_name]").val($data.eq(0).text());
	 		$("#ed").find("input[name=contact]").val($data.eq(1).text());
	 		$("#ed").find("input[name=contact_tel]").val($data.eq(2).text());
	 		$("#ed").find("input[name=contact_addr]").val($data.eq(3).text());
	 		$("#ed").find("input[name=account_bank]").val($data.eq(4).text());
	 		$("#ed").find("input[name=account_num]").val($data.eq(5).text());
	 		$("#ed").find("textarea[name=remark]").val($data.eq(6).text());
	 	 }

	 		
	 	
	 	
</script>
</body>
</html>