<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="../css/admin.css" type="text/css" rel="stylesheet">
<title>提醒任务显示</title>
</head>
<body style="background-color: #E3EFFB">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" background="../images/header_bg.jpg" border=0>
 	 <TR height=56>
    	<TD width=260><IMG height=56 src="../images/header_left.jpg" 
    width=260></TD>
    
    <TD style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 15px;font-size: 20px" 
      align="center">任&nbsp;务&nbsp;提&nbsp;醒</TD>
   
    <TD align=right width=268><IMG height=56 
      src="../images/header_right.jpg" width=268></TD>
     </TR>
     </TABLE>
     
 <!-- 提醒任务显示 -->    
	<table width="80%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">                   
         <tr>
              <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
                  	<td width="10%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">任务类型</td>
				    <td width="15%" height="20" align="center" bgcolor="#EEEEEE" style="font-weight: bold">日期</td>
                    <td width="45%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">内容</td>
                    
                  </tr>
                  
                  <s:iterator value="rilis">
                  <tr bgcolor="#EEEEEE">
                  <td width="10%" align="center" bgcolor="#EEEEEE" style="font-weight: bold;color:#4876FF;">日程任务</td>
                  	<td width="15%" height="20" align="center"><s:property value="dtime"/></td>
                  	<td width="45%" align="center"><s:property value="represent"/></td>
                  </tr>
                  </s:iterator>
                  
                  
                  <s:iterator value="diarys">
                  	<tr bgcolor="#EEEEEE">
                  	<td width="10%" align="center" bgcolor="#EEEEEE" style="font-weight: bold;color:#9400D3;">日记任务</td>
                  	<td width="15%" height="20" align="center"><s:property value="dtime"/></td>
                  	<td width="50%" align="center"><s:property value="represent"/></td>
                  </tr>
                  </s:iterator>
                </table>
              </td>
         </tr>
     </table>
       </td>
       </tr>
      </table>
	
</body>
</html>