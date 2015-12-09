<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>时间管理中心登陆 V1.0</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="${pageContext.request.contextPath}/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function check(){
		if(form.yhm.value==0){
	    alert("请输入用户名");form.yhm.focus();return false;
	  }
	  if(form.kl.value==0){
	    alert("请输入密码");form.kl.focus();return false;
	  }
		return true;
	}
			
			

</script>

</HEAD>
	<BODY >
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor=#002779 border=0>
  			<TR>
    			<TD align="center">
      				<TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
       				 <TR>
         				 <TD>
         				 <IMG height=23 src="${pageContext.request.contextPath}/images/login_1.jpg" width=468>
         				 </TD>
          			</TR>
        			<TR>
         				 <TD>
         				 <IMG height=147 src="${pageContext.request.contextPath}/images/login_2.jpg" width=468>
         				 </TD>
           			</TR>
           			</TABLE>
      				<TABLE cellSpacing=0 cellPadding=0 width=468 bgColor=#ffffff border=0>
      				  <TR>
          <TD width=16><IMG height=122 src="${pageContext.request.contextPath}/images/login_3.jpg" 
            width=16></TD>
          <TD align="center">
           <FORM name="form" onsubmit="return check()" action="${pageContext.request.contextPath}/loginAction!doLogin" method="post">
            <TABLE cellSpacing=0 cellPadding=0 width=230 border=0>
             
              <TR height=5>
                <TD width=5></TD>
                <TD width=56></TD>
                <TD></TD>
                </TR>
              <TR height=36>
                <TD></TD>
                <TD>用户名</TD>
                <TD>
                <INPUT  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  maxLength=30 size=24 id="yhm" name="nickname">
                  </TD>
               </TR>
              <TR height=36>
                <TD>&nbsp; </TD>
                <TD>口　令</TD>
                <TD>
                <INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  type="password" maxLength=30 size=24 id="kl" name="password"></TD></TR>
              <TR height=5>
                <TD colSpan=3><br><br></TD>
              </TR>
              <TR>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <INPUT type="submit" height=18 width=70 name="submit1" value="登陆"/>&nbsp;&nbsp;&nbsp;&nbsp;
              
                <input type="reset" height=18 width=70 name="reset1" value="取消"/>&nbsp;&nbsp;&nbsp;&nbsp;
               	<s:if test="%{b != 0}">
                	<a href="registyonghu.jsp" >注册</a>
                </s:if>
                <s:else>
                	<a href="jsp/registyonghu.jsp" >注册</a>
                </s:else>            
                </TD>
               </TR>
                  </TABLE>
                   </FORM>
                  
                  </TD>
                
          <TD width=16><IMG height=122 src="${pageContext.request.contextPath}/images/login_4.jpg" width=16></TD></TR>
            </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD>
          <IMG height=16 src="${pageContext.request.contextPath}/images/login_5.jpg" width=468>
          </TD>
         </TR>
        </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD align=right><A href="http://www.mycodes.net/" target=_blank>
          <IMG height=26 src="${pageContext.request.contextPath}/images/login_6.gif" width=165  border=0></A>
          </TD>
         </TR>
       </TABLE>
            	</TD>
            </TR>
		</TABLE>

		
	<s:if test="%{result==9}">
	<script type="text/javascript">
		alert("用户名或密码错误");
	</script>
 </s:if>	
	</BODY>
</HTML>
