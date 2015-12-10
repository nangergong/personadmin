<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>学生个人健康管理系统</title>
		<link href="css/admin.css" type="text/css" rel="stylesheet" media="all" />
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
			var xbFlag=false;
		//验证真实姓名
		$(function(){
			$('#zsxm').blur(function(){
				var name = $(this).val();
				var reg = /^[\u4E00-\u9FA5a-z0-9]{2,20}$/;
				if(strip(name).length==0){
				$('#name_in').html('您的真实姓名不能为空!');
				
				zsxmFlag=false;
				}else{
					if(reg.test(name)){
                   			 $('#name_in').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		zsxmFlag = true;
					}else{
						$('#name_in').html('请您输入正确的真实姓名!');
					}
				}
			});
			//验证邮箱
		
			$('#yx').blur(function(){
				var email = $(this).val();
				var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
				if(strip(email).length==0){
				$('#email_info').html('您的邮箱不能为空!');
				
				yxFlag=false;
				}else{
					if(reg.test(email)){
                   			 $('#email_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		yxFlag = true;
					}else{
						$('#email_info').html('请您输入正确的邮箱格式!');
					}
				}
			});
			//验证电话号码
		
			$('#dh').blur(function(){
				var call = $(this).val();
				var reg = /^\d{4}-\d{7}|\d{3}-\d{8}$/;
				if(strip(call).length==0){
				$('#dh_info').html('您的电话号码不能为空!');
				
				 dhFlag=false;
				}else{
					if(reg.test(call)){
                   			 $('#dh_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		 dhFlag = true;
					}else{
						$('#dh_info').html('请您输入正确的电话号码,如021-87888822!');
					}
				}
			});
			
			//验证手机
		
			$('#sj').blur(function(){
				var tel = $(this).val();
				var reg = /^13[0-9]{9}$/;
				if(strip(tel).length==0){
				$('#sj_info').html('您的电话号码不能为空!');
				
				 sjFlag=false;
				}else{
					if(reg.test(tel)){
                   			 $('#sj_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		sjFlag = true;
					}else{
						$('#sj_info').html('请您输入正确的手机号码!');
					}
				}
			});
			//验证昵称是否能使用
			$('#nc').blur(function(){
				var nickname = $(this).val();
				var reg = /^[\u4E00-\u9FA5a-z0-9]{2,20}$/;
				if(strip(nickname).length==0){
				$('#name_info').html('您的昵称不能为空!');
				
				ncFlag=false;
				}else{
					if(reg.test(nickname)){
                   			 $('#name_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		ncFlag = true;
					}else{
						$('#name_info').html('请您输入正确的nickname格式!');
					}
				}
			});
			//验证密码
			$('#mm').blur(function(){
				var password = $(this).val();
				//alert(password);
				var reg = /^[a-zA-Z0-9]{6,20}$/;
				if(strip(password)==0){
				$('#mm_info').html('您的密码不能为空!');
				$('#mm_info').addClass('s1');
				mmFlag = false;
				}else{
					if(reg.test(password)){
		                   	$('#mm_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		 mmFlag = true;
		                   
					}else{
						$('#mm_info').html('密码格式不正确!');
					}
				}
			});
			
			//验证家庭住址
			$('#jtzz').blur(function(){
				var address = $(this).val();
				
				if(strip(address).length==0){
				$('#jtzz_info').html('您的家庭住址不能为空!');
				
				jtzzFlag=false;
				}else{
					
                    $('#jtzz_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		
					jtzzFlag=true;
				}
			});
			//验证出生日期
			$('#csrq').blur(function(){
				var bir = $(this).val();
				
				if(strip(bir).length==0){
				$('#csrq_info').html('您的出生日期不能为空!');
				
				csrqFlag=false;
				}else{
					
                    $('#csrq_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		
					csrqFlag=true;
				}
			});
			//验证性别
			
			$('#xb').blur(function(){
				var se = $(this).val();
				
				if(strip(se).length==0){
				$('#se_info').html('您的性别不能为空!');
				
				xbFlag=false;
				}else{
					
                    $('#se_info').html("<img src='../images/label3.gif'width='15'height='15'/>");
                    		
					xbFlag=true;
				}
			});
			$('#f').submit(function(){
				
			var a=zsxmFlag&&ncFlag&&yxFalg&&sjFalg&&dhFalg&&jtzzFlag&&mmFlag&&csrqFlag&&xbFlag;
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
		<script type="text/javascript" src="../js/calend.js"></script>
	</head>

	<body >
  		<form action="chayh!addyonghu" method="post"  name="form" id="f" >
			<div class="MainDiv" style="height:100%;width:100%;" >
				<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  					<tr>
      					<th class="tablestyle_title" bgcolor=" #38B0DE" align="center">添加用户</th>
  					</tr>
  					<tr>
    					<td class="CPanel">		
							<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height:" style="color:#D9D919;" bgcolor="grenn" align="center">		
								<tr style="height:100%;width:100%">
									<td width="100%">
										<fieldset style="height:100%;" >
											<legend style="color:#0000FF">用户信息</legend>
					  						<table border="0" cellpadding="2" cellspacing="1" style="width:100%" align="center">
					 							<tr>
					    							<td nowrap="nowrap" align="right">真实姓名:</td>
					    							<td><input class="text" name='u.name'  id="zsxm" style="width:154px" />
					    								 <span id="name_in" style="color:red"></span>
					    							</td>
					    							</tr>
					    							<tr>
					    							<td align="right" >性别: </td>
					    							<td>
					    								<select name="u.sex" id="xb">
                            								<option selected="selected"></option>
								                            <option value="1">男</option>
								                            <option value="2">女</option>
								                            
                        								</select>
                        								<span id="se_info" style="color:red"></span>
                        							</td>
					  							</tr>
					  							<tr>
					  								<td align="right">昵称:</td>
												    <td><input class="text" name='u.nickname' style="width:154px"  id="nc" value=""/>
												    <span id="name_info" style="color:red"></span>
												    </td>
												    </tr>
												 <tr>
												    <td align="right">出生日期:</td>
												    <td><input class="text" name='u.birthday' style="width:154px" id="csrq" readonly="readonly" onclick="setDay(this);"/>
												    	<span id="csrq_info" style="color:red"></span>
												    </td>
												    
					  							</tr>
					  							<tr>
												    <td align="right">电子邮箱:</td>
												    <td><input class="text" name='u.email' style="width:154px" id="yx" value=""/>
												    	<span id="email_info" style="color:red"></span>
												    </td>
												   </tr>
												<tr>
												    <td align="right">电话号码:</td>
												    <td><input class="text" name='u.landline' style="width:154px" id="dh" value=""/>
												    	<span id="dh_info" style="color:red"></span>
												    </td>
					    
											   </tr>
											   <tr>
												    <td align="right">注册时间:</td>
												    <td><input class="text" name='u.registtime' style="width:154px" id="date" readonly="readonly" onclick="auto();" value=""/>
												    </td>
					    
											   </tr>
					  							<tr>					
					    							<td width="16%" align="right" nowrap="nowrap">密码:</td>
					    							<td width="34%"><input class="text" name='u.password' type="password" style="width:154px" id="mm" value=""/>
					    								<span id="mm_info" style="color:red"></span>
					    							</td>
					    						</tr>	
					    						<tr>
					    							<td align="right">手机:</td>
												    <td><input class="text" name='u.mobile' style="width:154px" id="sj" value=""/>
												    	<span id="sj_info" style="color:red"></span>
												    </td>
					  							</tr>			  
											  
												
												
												 <tr>
												    <td align="right">家庭住址:</td>
												    <td colspan="3"><input class="text" name="u.address" type="text" size="30" style=" width:450px;" id="jtzz"/>
												    	<span id="jtzz_info" style="color:red"></span>
												    </td>
					  							</tr>
					  						</table><br/>
										</fieldset>
									</td>
								</tr>
							</table>
	 					</td>
  					</tr>
					<tr>
						<td colspan="2" align="center"  >
							<input type="submit" name="Submit" value="添加" class="button" />　
							<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
