<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #E3EFFB">
	<form action="${pageContext.request.contextPath}/rili/riliAction!doUpdateRiLi?page.currentPage=${page.currentPage}" method="post">
	<div class="MainDiv" style="position: relative;bottom: 8px;left:120px;width: 80%;">
	<input type="hidden" name="sdiary.id" value="${sdiary.id}"/>
	<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  	<tr>
      <th height="30" align="center" class="tablestyle_title" bgcolor="#375AD0" style="font-weight:bold;color: highlight;font-size: 25px;background-image: url('../images/hh.jpg')">重要任务修改页面</th>
  	</tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
			<td width="100%">
				<fieldset style="height:100%;background-color: #2ACFFF"">
				<legend style="font-weight: bold;font-size: 17px;color: #98109B">重要任务修改</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%;background-image: url('../images/wnl.jpg')">
					 
					  <tr>
					    <td align="right" width="19%" style="font-weight: bold;color: #BFF36D">日期:</td>
					    <td width="27%"><input name="sdiary.dtime" id="Input22" class="text" style="width:154px" readonly="readonly" value="${sdiary.dtime}"/></td>
					  </tr>
					  
					  <tr>
					    <td nowrap="nowrap" align="right" width="13%" style="font-weight: bold;color: #BFF36D">标题:</td>
					    <td width="41%"><input name="sdiary.shortname" class="text" style="width:250px" type="text" size="40" readonly="readonly" value="${sdiary.shortname}"/>
				        </td>
				        </tr>
					  
					  <tr>
					    <td nowrap="nowrap" align="right" height="120px" style="font-weight: bold;color: #BFF36D">内容:</td>
					    <td colspan="3"><textarea id="textarea" name="sdiary.represent" rows="5" cols="80">${sdiary.represent}</textarea></td>
					    </tr>
					  </table>
			 <br />
				</fieldset>			</td>
		</tr>
		</table>
	 </td>
  </tr>
		<tr>
			<td colspan="2" align="center" height="50px">
			<input type="submit" name="Submit" value="修改" class="button"/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></td>
		</tr>
		</table>
			</div>	
				</form>
</body>
</html>