<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人时间管理系统</title>
		<link href="css/admin.css" type="text/css" rel="stylesheet" media="all" />
		<script language="JavaScript" type="text/javascript">
			

		</script>
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
			var zsxmFlag=false;
			var ncFlag=false;
			var yxFlag=false;
			var dhFlag=false;
			var sjFlag=false;
			var jtzzFlag=false;
			var  mmFlag=false;
			var csrqFlag=false;
			
		//验证真实姓名
		$(function(){
			$('#zsxm').blur(function(){
				var name = $(this).val();
				var reg = /^[\u4E00-\u9FA5a-z0-9]{2,20}$/;
				if(strip(name).length==0){
				alert('您的真实姓名不能为空!');
				
				zsxmFlag=false;
				}else{
					if(reg.test(name)){
                    		zsxmFlag = true;
					}else{
						alert('必须为2-20位');
					}
				}
			});
			//验证邮箱
		
			$('#yx').blur(function(){
				var email = $(this).val();
				var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
				if(strip(email).length==0){
				alert('您的邮箱不能为空!');
				
				yxFlag=false;
				}else{
					if(reg.test(email)){
                    		yxFlag = true;
					}else{
						alert('例如：123456789@qq.com!');
					}
				}
			});
			//验证电话号码
		
			$('#dh').blur(function(){
				var call = $(this).val();
				var reg = /^\d{4}-\d{7}|\d{3}-\d{8}$/;
				if(strip(call).length==0){
				alert('您的电话号码不能为空!');
				
				 dhFlag=false;
				}else{
					if(reg.test(call)){
                    		 dhFlag = true;
					}else{
						alert('请您输入正确的电话号码,如021-87888822!');
					}
				}
			});
			
			//验证手机
		
			$('#sj').blur(function(){
				var tel = $(this).val();
				var reg = /^13[0-9]{9}$/;
				if(strip(tel).length==0){
				alert('您的电话号码不能为空!');
				
				 sjFlag=false;
				}else{
					if(reg.test(tel)){
                    		sjFlag = true;
					}else{
						alert('例如：13718571234');
					}
				}
			});
			//验证昵称是否能使用
			$('#nc').blur(function(){
				var nickname = $(this).val();
				var reg = /^[\u4E00-\u9FA5a-z0-9]{2,20}$/;
				if(strip(nickname).length==0){
				alert('您的昵称不能为空!');
				
				ncFlag=false;
				}else{
					if(reg.test(nickname)){
                    		ncFlag = true;
					}else{
						alert('请您输入2-20位!');
					}
				}
			});
			
			
			//验证家庭住址
			$('#jtzz').blur(function(){
				var address = $(this).val();
				
				if(strip(address).length==0){
				alert('您的家庭住址不能为空!');
				
				jtzzFlag=false;
				}else{
					
                   
                    		
					jtzzFlag=true;
				}
			});
			//验证出生日期
			$('#csrq').blur(function(){
				var bir = $(this).val();
				
				if(strip(bir).length==0){
				alert('您的出生日期不能为空!');
				
				csrqFlag=false;
				}else{
					
                   
                    		
					csrqFlag=true;
				}
			});
			
			$('#f').submit(function(){
				
			var a=zsxmFlag&&ncFlag&&yxFalg&&sjFalg&&dhFalg&&jtzzFlag&&csrqFlag;
			if(a==true){
				alert('注册成功');
				return a;
				
			}else{
				alert('注册失败,请重新注册');
				return a;
			}
			
					
			});
			});
		function auto(){
			
			var nowDate = new Date();
			form.date.value=nowDate.toLocaleString();
		};
		</script>
	</head>

	<body class="ContentBody" style="background-color: #E3EFFB">
  		<form action="chayh!updateUser" method="post" name="form"  >
  		<input type="hidden" name="u.id" value="${u.id}"/>
			<div class="MainDiv" style="position: relative;bottom: 8px;">
				<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent" >
  					<tr >
      					<th height="40" align="center" class="tablestyle_title" style="font-size:20px;font-weight: bold;color: white;" bgcolor="#375AD0">用&nbsp;&nbsp;户&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;修&nbsp;&nbsp;改</th>
  					</tr>
  					<tr>
    					<td class="CPanel">		
							<table border="0" cellpadding="0" cellspacing="0" style="width:100%" >		
								<tr>
									<td width="100%">
										<fieldset style="height:100%;width: 80%;position:relative;left: 110px;background-image: url('../images/yonghu.jpg')"  > 
											<legend style="color:#741478;font-weight: bold;font-size: 20px">用户信息</legend>
					  						<table border="0" cellpadding="2" cellspacing="1" style="width:100%;">
					 							<tr>
					    							<td nowrap="nowrap" align="right" style="font-weight: bold">真实姓名:</td>
					    							<td><input class="text" name='u.name' id="zsxm" style="width:154px" value="${u.name}"/></td>
					    							<td align="right" style="font-weight: bold">性别:</td>
					    							<td >
					    								<s:if test="#session.u.sex=='男'">
					    									<input type="radio" disabled="disabled" name="u.sex" checked="checked" value="1" />男 
                        									<input type="radio" disabled="disabled" name="u.sex" value="女"/>女
					    								</s:if>
					    								<s:else>
					    									<input type="radio" disabled="disabled" name="u.sex" value="男" />男
                        									<input type="radio" disabled="disabled" name="u.sex"  checked="checked" value="2"/>女
					    								</s:else>
                        							
                        							</td>
					  							</tr>
					  							<tr>
					  								<td align="right" style="font-weight: bold">电子邮箱:</td>
												    <td><input class="text" name='u.email' id="yx" style="width:154px" value="${u.email}"/></td>
					  								<td align="right" style="font-weight: bold">昵称:</td>
												    <td><input class="text" id="nc" name='u.nickname' style="width:154px" value="${u.nickname}"/></td>
												    
					  							</tr>
					  							<tr>
												    
												    <td align="right" style="font-weight: bold">电话号码:</td>
												    <td><input class="text" name='u.landline' id="dh" style="width:154px" value="${u.landline}"/></td>
					    							<td align="right" style="font-weight: bold">手机:</td>
												    <td><input class="text" name='u.mobile' id="sj" style="width:154px" value="${u.mobile}"/></td>
											   </tr>		  
												
												 <tr>
												    <td align="right" style="font-weight: bold">家庭住址:</td>
												    <td colspan="3"><input class="text" id="jtzz" name="u.address" type="text" size="30" style=" width:600px;" value="${u.address}"/></td>
					  							</tr>
					  						</table><br/>
										</fieldset>
									</td>
								</tr>
							</table>
	 					</td>
  					</tr>
					<tr>
						<td colspan="2" align="center" height="50px">
							<input type="submit" name="Submit" value="修改" class="button" />　
							<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
