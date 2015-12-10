<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD>
<script type="text/javascript">
	
</script>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="../css/admin.css" type="text/css" rel="stylesheet">
<SCRIPT type="text/javascript">
	function day(){
		var date = new Date();
		var year = date.getYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var hours = date.getHours();
		var minites = date.getMinutes();
		var seconds = date.getSeconds();
		document.getElementById('time').innerHTML='当前时间：'+year+'年'+month+'月'+day+'日'+hours+'时'+minites+'分'+seconds+'秒';
		setTimeout('day()',1000);	 
	}
</SCRIPT>
</HEAD>
<BODY onload="day();">

<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=../images/title_bg1.jpg>当前位置: </TD></TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=../images/shadow_bg.jpg></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <TR height=100>
    <TD align="center" width=100><IMG height=100 src="../images/admin_p.gif" 
      width=90></TD>
    <TD width=60>&nbsp;</TD>
    <TD>
      <TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
        
        <TR>
          <TD id="time"></TD></TR>
        <TR>
          <TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px;color:red;">
          <s:property value="#session.session_user.nickname" />
          </TD></TR>
        <TR>
          <TD>欢迎进入个人时间管理中心！</TD></TR></TABLE></TD></TR>
  <TR>
    <TD colSpan=3 height=10></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align="center" background=../images/title_bg2.jpg>您的相关信息</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=2 width="95%" align=center border=0>
  <TR>
    <TD align=right width=100>登陆帐号：</TD>
    <TD style="COLOR: #880000"> <s:property value="#session.session_user.nickname" /></TD></TR>
  <TR>
    <TD align=right>真实姓名：</TD>
    <TD style="COLOR: #880000"> <s:property value="#session.session_user.name" /></TD></TR>
    <TR>
    <TD align=right>电子邮件：</TD>
    <TD style="COLOR: #880000"> <s:property value="#session.session_user.email" /></TD></TR>
  <TR>
    <TD align=right>注册时间：</TD>
    <TD style="COLOR: #880000"> <s:property value="#session.session_user.registtime" /></TD></TR>
  
   
 
  
  
  </TABLE>
 
  </BODY></HTML>