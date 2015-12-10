<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>学生个人健康管理系统</title>
		<link href="../css/admin.css" type="text/css" rel="stylesheet" media="all" />
		<style type="text/css">
			<!--
			.atten {font-size:12px;font-weight:normal;color:#F00;}
			-->
		</style>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.js"></script>
		<script type="text/javascript">
		function strip(str){
			//将字符串两端的空格去掉
			var reg = /(^\s*)|(\s*$)/g;//g表示搜索全局
			return str.replace(reg,'');//将正则表达式转换为空字符串
			}
			var ypwdFalg=false;
			var pwdFlag=false;
			var repeatPassFlag=false;
			
		$(function(){
		
			$('#ym').blur(function(){
			//alert("2222");
				var ym = $(this).val();
				var reg = /^[a-zA-Z0-9]{6,20}$/;
				if(strip(ym).length==0){
				alert('您的密码不能为空!');
				ypwdFlag=false;
				}else{
					if(reg.test(ym)){
                   			$.ajax({
						   'url':'xtsz!ymm',
		                   'type':'post',
		                   'data':'user.password='+ym,
		                   'dataType':'text',
		                   'success':function(data){
		                // alert(data);
		                   	if(data=='error'){
		                   
                    		ypwdFlag = true;
		                   	}else{
                   			 alert('密码填写错误！');
                    		 ypwdFlag = false;
                		    }
		                   },
		                   'error':function(xml,d1,d2){
                  		    alert('系统验证出错，稍后重试');
                 		   },
                 		   'async':false
					});
					}else{
						alert('密码必须由大小写英文字母、数字组成，长度6－20位!');
					}
					
				}
			});
			
			
			
			$('#p').blur(function(){
				var password = $(this).val();
				
				var reg = /^[a-zA-Z0-9]{6,20}$/;
				if(strip(password)==0){
				alert('您的新密码不能为空!');
				
				pwdFlag = false;
				}else{
					if(reg.test(password)){
		                   	alert('ok');
                    		 pwdFlag = true;
		                   
					}else{
						alert('新密码必须由大小写英文字母、数字组成，长度6－20位!');
					}
				}
			});
			$('#p1').blur(function(){
				var password = $('#p').val();
				//alert(password);
				var password1= $(this).val();
				
				if(password1==""){
				alert('您的密码不能为空!');
				
				repeatPassFlag = false;
				
				}else{
					//alert(password); 
					if(password==password1){
							alert('ok');
							repeatPassFlag=true;
					}else{
						alert('两次输入密码不一致');
					}
				}
			});//再次验证结束
			
			$('#f').submit(function(){
			//alert(pwdFlag+":"+repeatPassFlag);
				var a=pwdFlag&&repeatPassFlag;
				
			if(a==true){
				alert('修改成功');
				return a;
				
			}else{
				alert('修改失败,请重新修改');
				return a;
			}
			});
			
		});
			
			
	</script>		
	</head>

	<body class="ContentBody">
  		<form action="xtsz!modifyPwd" method="post" id="f" name="form"  >
			<div class="MainDiv">
				<table width="100%" style="height: 100%;" border="0" cellpadding="0" cellspacing="0" class="CContent">
  					<tr>
      					<th height="35" class="tablestyle_title" bgcolor="#375AD0" style="color: white;font-weight: bold;font-size: 20px;">密&nbsp;码&nbsp;修&nbsp;改</th>
  					</tr>
  						<tr>
  							<td>
							<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%;background-image: url('../images/renwu1.jpg')" >		
								<tr>
									<td width="100%">
										<fieldset style="height:100%;" >
											
					  						<table border="0" cellpadding="2" cellspacing="1" style="width:100%">
												<tr>
													<td align="center" style="font-weight: bold;color: #BFF36D;font-size: 17px">原 &nbsp;&nbsp;密&nbsp;&nbsp;码:<input class="text" name='user.password' type="text" id="ym" value=""/></td>
					     							
													
												</tr>
												<tr>
													<td align="center" style="font-weight: bold;color: #BFF36D;font-size: 17px">新  &nbsp;&nbsp;密&nbsp;&nbsp;码:<input  name='newpwd' type="password" id="p" value=""/></td>
					     							
													
												</tr>
												 <tr>
												    <td align="center" style="font-weight: bold;color: #BFF36D;font-size: 17px">确认新密码: <input  name='newpwd1' type="password" id="p1"value=""/></td>
												  
					  							</tr>
					  						</table><br/>
										</fieldset>
									</td>
								</tr>
							</table>
							</td>
	 					</tr>	
					<tr >
						<td colspan="2" align="center" >
							<input  type="submit" name="Submit" value="确定" class="button" />
							<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
