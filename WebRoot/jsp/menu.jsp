<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="../css/admin.css" type="text/css" rel="stylesheet">
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
</HEAD>
<BODY>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 background=../images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align="center">
   	  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        
        <TR>
          <TD height=10></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg><A 
            class=menuParent onclick=expand(1) 
            href="javascript:void(0);">用户管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0  width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="chayh!yhxx"  target=main>用户信息</A></TD>
        </TR>
       </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg>
          <A class=menuParent onclick=expand(2) href="javascript:void(0);">任务安排</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9  src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="addrenwu.jsp" target=main>日程安排</A></TD>
        </TR>
        <TR height=20>
          <TD align="center" width=30><IMG height=9  src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="addriji.jsp" target=main>电子日记</A></TD>
        </TR>
        <TR height=4>
          <TD colSpan=2></TD>
        </TR>
       </TABLE>
       
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg>
          <A class=menuParent onclick=expand(3) href="javascript:void(0);">任务管理</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD>
        </TR>
       </TABLE>
       
      <TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="wnl.jsp"target=main>日历管理</A></TD>
        </TR>
        
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="${pageContext.request.contextPath}/rili/riliAction!findRili"target=main>任务显示</A></TD>
        </TR>
        
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="${pageContext.request.contextPath}/find/timeAction!findTask" target=main>日程管理</A></TD>
        </TR>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="${pageContext.request.contextPath}/find/diaryAction!findRiJi" target=main>日记管理</A></TD>
        </TR>
     </TABLE>
     
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg>
          <A class=menuParent onclick=expand(4) href="javascript:void(0);">搜索管理</A></TD>
        </TR>
        <TR height=4>
          <TD></TD>
         </TR>
       </TABLE>
      <TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="${pageContext.request.contextPath}/find/timeAction!doFind" target=main>任务查询</A></TD>
        </TR>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="${pageContext.request.contextPath}/find/diaryAction!toChaxun2" target=main>日记查询</A></TD>
        </TR>
       </TABLE>
       <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg>
          <A class=menuParent onclick=expand(5) href="javascript:void(0);">数据管理</A></TD>
        </TR>
        <TR height=4>
          <TD></TD>
         </TR>
       </TABLE>
        <TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="databaseBackup.jsp" target=main>数据备份</A></TD>
        </TR>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="databaseRecover.jsp" target=main>数据恢复</A></TD>
        </TR>
        
       </TABLE>
       
       <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg>
          <A class=menuParent onclick=expand(6) href="javascript:void(0);">系统帮助</A></TD>
        </TR>
        <TR height=4>
          <TD></TD>
         </TR>
       </TABLE>
        <TABLE id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="xitongjieshao.jsp" target=main>系统介绍</A></TD>
        </TR>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="mianfeishengm.jsp" target=main>免费声明</A></TD>
        </TR>
        
       </TABLE>
       
         <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=../images/menu_bt.jpg>
          <A class=menuParent onclick=expand(7) href="javascript:void(0);">定时提醒</A></TD>
        </TR>
        <TR height=4>
          <TD></TD>
         </TR>
       </TABLE>
        <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align="center" width=30><IMG height=9 src="../images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="tixing.jsp" target=main>提醒设置</A></TD>
        </TR>
       </TABLE>
       
     </TD>
    <TD width=1 bgColor=#d1e6f7></TD></TR>
    </TABLE>
    </BODY>
    </HTML>
