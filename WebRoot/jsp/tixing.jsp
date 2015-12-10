<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务提醒</title>
<style type="text/css">
	#s{
		color: #436EEE;
		font-weight: bold;
		font-size: 12px;
	}
	
</style>
<script type="text/javascript">
 function doone()  
    {  
    	window.open("${pageContext.request.contextPath}/tx/tiXingAction!findTiRiLi");  
    }  
      
    function begin()  
    {  
        var num=form1.miao.value * 1000 ; 
        	setTimeout("doone()",num)
    }  
</script>
</head>
<body style="background-color: #E3EFFB">
	  <s:form name="form1">
	  	<div style="width: 80%;position: relative;left: 70px"> 
	  	<fieldset style="height:30%;">
	  	<legend style="font-weight: bold;color: red;font-size: 15px">提醒设置</legend>
	  	<div style="position: relative;left: 200px">
	  	<input type="text"  name="miao" style="width: 100px" id="sz">
	  	<input type="button" value="设置" onclick="begin()">
	  	<span id="s">(设置的提醒时间单位为s)</span> 
	  	</div>
	  	</fieldset>
	  	</div>
	  </s:form>	
	 
</body>
</html>