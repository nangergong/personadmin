<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人时间管理平台用户信息</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function aa(){
		var a =document.getElementById("go").value;
		window.location.href='chayh!yhxx?b='+a;
	
	}

</script>

</head>

<body style="background-color: #E3EFFB">

  <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CD7F32 " >
          	 
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#375AD0" class="newfont03">
				 <tr class="CTitle">
                    	<td height="22" colspan="7" align="center" style="font-size:16px;font-weight: bold;color: white;" >用户信息</td>
                  </tr>
                  <tr bgcolor="#EEEEEE" align="center">
				    
                    <td width="7%">用户编号</td>
					<td width="7%">姓名</td>
                    <td width="8%">昵称</td>
					<td width="10%">生日</td>
					<!-- <td width="5%">性别</td> -->
					<td width="10%">手机</td>
					 <td width="15%">电子邮件</td>
					  <td width="23%">家庭住址</td>
					  <td width="5%">操作</td>
                  </tr>
                  
                  
              <s:iterator value="us">
                  <tr bgcolor="#FFFFFF" align="center">
                  <td><s:property value="id"/></td>
                  <td ><s:property value="name"/></td>
                  <td><s:property value="nickname"/></td>
                  <td><s:property value="birthday"/></td>
                  <!-- <td><s:property value="sex"/></td> -->
                  <td><s:property value="mobile"/></td>
                  <td><s:property value="email"/></td>
                  <td><s:property value="address"/></td>
                    <td>
                    	<a href="chayh!modifyyhxx?id=<s:property value="id"/>">修改</a>
                    	<!-- <a href="chayh!deleteyh?id=<s:property value="id"/>">删除|</a> -->
                    	<!-- <a href="${pageContext.request.contextPath}/jsp/addyonghu.jsp">增加</a> -->
                    </td>
                  </tr>
				 </s:iterator>
                 
            </table></td>
        </tr>
      </table>
      
      <!-- 分页 -->
      <!--  
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">
				                	共 <span class="right-text09">
				                		${page.countPage}
				                	  </span> 
				                                         页 | 第 <span class="right-text09">
				                          ${page.currentPage}
				                      </span>
				                                     页</td>
                
                <td width="49%" align="right">[<a href="chayh!yhxx?page.currentPage=1" class="right-font08">首页</a> |
                <s:if test="page.currentPage>1">
                 <a href="chayh!yhxx?page.currentPage=${page.currentPage-1}" class="right-font08">上一页</a> |
                 </s:if>
                 <s:else>上一页</s:else>
                 <s:if test="page.currentPage< page.countPage">
                  <a href="chayh!yhxx?page.currentPage=${page.currentPage+1}" class="right-font08">下一页</a> | 
                  </s:if>
                  <s:else>下一页</s:else>
                  <a href="chayh!yhxx?page.currentPage=${page.countPage}" class="right-font08">末页</a>] 转至：</td>
                <td width="1%">
                <table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input name="textfield3" id="go"type="text" class="right-textfield03" size="1" /></td>
                      <td width="87%"><input name="Submit23222" type="button" class="right-button06" value="go" onclick="aa();"/>
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table>
          
          </td>
        </tr>
      </table>
      -->
</body>
</html>
