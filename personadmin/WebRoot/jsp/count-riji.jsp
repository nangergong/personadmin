<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>个人时间管理系统</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//输入页数，然后跳转页面
	function aa(){
		var a =document.getElementById("go").value;
		window.location.href='diaryAction!findRiJi?goPage='+a;
	
	}

	

	//日期
	var days = new Array(1,2,3,4,5,6,
						 7,8,9,10,11,
						 12,13,14,15,16,
						 17,18,19,20,21,
						 22,23,24,25,26,
						 27,28,29,30,31); 
	function createDay(){
		var y = document.getElementById('year');
		var year = y.options[y.selectedIndex].text;
		var m = document.getElementById('month');
		var month = m.options[m.selectedIndex].text;
		var day = document.getElementById('day');
		
		day.innerHTML='';
		if(year%4==0&year%100!=0||year%400==0){
			if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
				
				for(var i=0;i<days.length;i++){
					if(days[i]<10){
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode('0'+days[i]));
                		day.appendChild(op);
					}else{
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode(days[i]));
                		day.appendChild(op);
					}
					
				}
			}else if(month==2){
				for(var i=0;i<days.length-2;i++){
					if(days[i]<10){
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode('0'+days[i]));
                		day.appendChild(op);
					}else{
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode(days[i]));
                		day.appendChild(op);
					}			
				}
			}else{
				for(var i=0;i<days.length-1;i++){
					if(days[i]<10){
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode('0'+days[i]));
                		day.appendChild(op);
					}else{
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode(days[i]));
                		day.appendChild(op);
					}
					
				}
			}
		}else{
			if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
				for(var i=0;i<days.length;i++){
					if(days[i]<10){
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode('0'+days[i]));
                		day.appendChild(op);
					}else{
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode(days[i]));
                		day.appendChild(op);
					}
					
				}
			}else if(month==2){
				for(var i=0;i<days.length-3;i++){
					if(days[i]<10){
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode('0'+days[i]));
                		day.appendChild(op);
					}else{
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode(days[i]));
                		day.appendChild(op);
					}
					
				}
				
			}else{
				for(var i=0;i<days.length-1;i++){
					if(days[i]<10){
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode('0'+days[i]));
                		day.appendChild(op);
					}else{
						var op = document.createElement('option');           
                		op.appendChild(document.createTextNode(days[i]));
                		day.appendChild(op);
					}				
				}
			}
		}
	}
	
	//验证跳转按钮1
	function check1(){
		var go = document.getElementById('submit1').value;
		var countPage = document.getElementById('countPage').value;
		if(go > 0 && go <= countPage){
			return true;
		}else{
		alert('请输入正确的页数');
		return false;
		}
		return false;
	}
	
	//验证跳转按钮2
	function check2(){
		var go = document.getElementById('submit2').value;
		var countPage = document.getElementById('countPage').value;
		if(go > 0 && go <= countPage){
			return true;
		}else{
		alert('请输入正确的页数');
		return false;
		}
		return false;
	}
</script>
</head>
<body style="background-color: #E3EFFB">
<input type="hidden" value="${page.countPage}" id="countPage"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	
					<tr style="background-color: #80CE1A">
                     <td height="50" colspan="9" align="center"  style="color: #E406E5;font-size:30px;font-weight: bold;background-image: url('../images/renwu1.jpg')" class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;记&nbsp;列&nbsp;表 &nbsp;</td>
                    </tr>
             <tr>
              <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
				    <td width="10%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">序列</td>
                    <td width="25%" height="20" align="center" bgcolor="#EEEEEE" style="font-weight: bold">作者</td>
                    <td width="45%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">日记内容</td>
                    <td width="15%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">操作</td>
                  </tr>
                  
                  <s:iterator value="diarys">
                  <tr bgcolor="#EEEEEE">
                  	<td width="10%" align="center"><s:property value="id"/></td>
                  	<td width="25%" height="20" align="center"><s:property value="author"/></td>
                  	<td width="50%" align="center"><s:property value="represent"/></td>
                  	<td width="15%" align="center">
                  	<a href="${pageContext.request.contextPath}/find/diaryAction!toUpdate?diary.id=<s:property value="id"/>">修改|</a>
                  	<a href="${pageContext.request.contextPath}/find/diaryAction!deleteRiJi?id=<s:property value="id"/>">删除</a>
                  	</td>
                  </tr>
                  </s:iterator>
                  
                </table>
              </td>
         </tr>
     </table>
       </td>
       </tr>
      </table>
      
      
 <!-- 分页 -->
    
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
                
                <td width="49%" align="right">[<a href="diaryAction!findRiJi?page.currentPage=1" class="right-font08">首页</a> |
                <s:if test="page.currentPage>1">
                 <a href="diaryAction!findRiJi?page.currentPage=${page.currentPage-1}" class="right-font08">上一页</a> |
                 </s:if>
                 <s:else>上一页</s:else>
                 <s:if test="page.currentPage< page.countPage">
                  <a href="diaryAction!findRiJi?page.currentPage=${page.currentPage+1}" class="right-font08">下一页</a> | 
                  </s:if>
                  <s:else>下一页</s:else>
                  <a href="diaryAction!findRiJi?page.currentPage=${page.countPage}" class="right-font08">末页</a>] 转至：</td>
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
</body>
</html>
