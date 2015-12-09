<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生个人健康管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />

<script type="text/javascript" language="javascript">
	function check()
	{
	  if(form1.path.value==0){
	    alert("请选择数据库文件");return false;
	  }
	  return true;
	}
	function browseFolder(path) {
    try {
        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
        var Shell = new ActiveXObject("Shell.Application");
        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
        //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
        if (Folder != null) {
            Folder = Folder.items(); // 返回 FolderItems 对象
            Folder = Folder.item(); // 返回 Folderitem 对象
            Folder = Folder.Path; // 返回路径
            if (Folder.charAt(Folder.length - 1) != "\\") {
                Folder = Folder + "\\";
            }
            document.getElementById(path).value = Folder;
            return Folder;
        }
    }
    catch (e) {
        alert(e.message);
    }
}
</script>

<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody" style="background-color: #E3EFFB">
  <form onsubmit="return check()" name="form1" method="post" action="recoverDataBase" >
<div class="MainDiv" style="position: relative;bottom: 8px;">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CContent" >	
  <tr>
      <th height="35" class="tablestyle_title" style="background-image: url('../images/data.jpg')" >数据库恢复</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;background-image: url('../images/renwu1.jpg')">		
				<tr>
			<td width="100%">
				<fieldset style="height:100%;">
				<legend style="font-weight: bold;font-size: 17px;color: #98109B">数据库恢复</legend>				
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">					 
					    <tr align="center">
						    <td style="font-weight: bold;color: #BFF36D">选择数据库恢复路径：<input type="file" name="path" size="50" value=""/></td>
						  </tr>						  
					  </table>
					  
			     <br/>
				</fieldset></td>
		     </tr>
		</table>
	 </td>
  </tr>
		<tr>
			<td colspan="2" align="center" height="50px" >
			<input type="submit" name="Submit" value="恢复" class="button" />			
			<input type="reset" name="Submit2" value="重置" class="button"/></td>
		</tr>
		</table>
</div>
</form>
	<s:if test="%{result==1}">
	    <script type="text/javascript">
	    	alert("恢复成功");
	    </script>
    </s:if>
</body>
</html>
