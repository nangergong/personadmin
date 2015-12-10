<!-- saved from url=(0022)http://internet.e-mail -->
<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style>
body,table{font-size:13px;line-height:22px;}

</style>

<title>输入记事</title>






</head>

<body  bgcolor="#bed742" topmargin=10 leftmargin=15 >


<form name=theform action="www.baidu.com" method="post">

<table cellspacing=0 cellpadding=0 align=left style="border:dashed green 0px;">
<tr>
<td>
<s:property value="#parameters.year"/>年<s:property value="#parameters.month"/>月<s:property value="#parameters.day"/>日
</td>
</tr>
<tr>
<td valign=top>
<b><span id=dangri></span></b>

<span id=result style="color:#f00000"></span>
<br>
<textarea rows="4" name="hint1" style="overflow-x:hidden;width: 430px;font-size: 14px;line-height: 18px;"></textarea>

</td>
</tr>



<tr>
<td valign=top>

<span id=yangli></span>
   阳历每年<s:property value="#parameters.month"/>月<s:property value="#parameters.day"/>日<input size=40 name=hint2>

</td>
</tr>
<tr>

<td align=center >
<input type=submit value=" 确 定 " >
<input type=button value="取 消" >
</td>
</tr>

</table>
</form>


</body>
</html>
