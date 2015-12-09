<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人时间管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
</head>

<body class="ContentBody" style="background-color: #E3EFFB">
  <form action="${pageContext.request.contextPath}/find/timeAction!doUpdateTask?page.currentPage=${page.currentPage}" method="post">
<div class="MainDiv" style="position: relative;bottom: 8px">
<input type="hidden" name="represent.id" value="${represent.id}"/>
<input type="hidden" name="represent.tid" value="${represent.tid}"/>
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th height="30" class="tablestyle_title" bgcolor="#375AD0" style="font-weight:bold;color: white;font-size: 25px;">日程修改页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		
		<tr>
			<td width="100%">
				<fieldset style="height:100%;background-color: #A1CAF6"">
				<legend style="font-weight: bold;font-size: 17px;color: #98109B">任务修改</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%;background-image: url('../images/renwu.jpg')">
					  <tr>
					    <td nowrap="nowrap" align="right" width="23%" style="font-weight: bold;color: #BFF36D">标题:</td>
					    <td width="41%"><input name="represent.shortname" class="text" style="width:250px" type="text" size="40" value="${represent.shortname}"/>
				        <span class="red"> </span></td>
					    <!--  <td align="right" width="19%" style="font-weight: bold;color: #BFF36D">时间:</td>
					    <td width="27%"><input name="str" id="Input22" class="text" style="width:154px" readonly="readonly" value="${str}"/></td>-->
					    </tr>
					  
					  
					  <tr>
					    <td nowrap="nowrap" align="right" height="120px" style="font-weight: bold;color: #BFF36D">内容:</td>
					    <td colspan="3"><textarea id="textarea" name="represent.represent" rows="5" cols="80" >${represent.represent}</textarea></td>
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
