<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>个人时间管理系统</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

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
<table align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" bgcolor="#296FC4"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
           <form name="time" action="${pageContext.request.contextPath}/find/timeAction!findTaskByTime?page.currentPage=1" method="post">
            <td width="450" style="position: relative;left: 50px" >
                <select id="year" name="year">
                  <option>年</option>
                  <option>2010</option>
                  <option>2011</option>
                  <option>2012</option>
                  <option>2013</option>
                  <option>2014</option>
                  <option>2015</option>
                  <option>2016</option>
                  <option>2017</option>
                  <option>2018</option>
                  <option>2019</option>
                  <option>2020</option>
                  <option>2021</option>
                  <option>2022</option>
                  <option>2023</option>
                  <option>2024</option>
                  <option>2025</option>
                  <option>2026</option>
                  <option>2027</option>
                  <option>2028</option>
                  <option>2029</option>
                  <option>2030</option>
                </select>
            
              月:
              <select id="month" name="month" onchange="createDay();">
              			<option>月</option>
                        <option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                      </select>
            日：
               		  <select id="day" name="day">
                        <option>日</option>
                      </select>            
                      <input name="Submit" type="submit" class="right-button02" value="查 询" /></td>
          </form> 
          
          <form action="${pageContext.request.contextPath}/find/timeAction!findTaskByShortname?page.currentPage=1" method="post">
          	  <td style="font-weight: bold;color: yellow;">根据任务名称查询：<input name="represent.shortname" type="text" class="chaxun" value="请输入关键字"/>
              <input name="Submit" type="submit" class="right-button02" value="查 询" /></td>
          </form>
                
          </tr>        
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	
					<tr>
                    <td height="35" colspan="9" align="center"  style="color: white;font-weight: bold;font-size: 25px;background-image: url('../images/renwu1.jpg')" class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;程&nbsp;列&nbsp;表 &nbsp;</td>
                    </tr>
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr>
				    <td width="10%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">序列</td>
                    <td width="25%" height="20" align="center" bgcolor="#EEEEEE" style="font-weight: bold">任务名称</td>
                    <td width="45%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">任务内容</td>
                    <!-- <td width="15%" align="center" bgcolor="#EEEEEE" style="font-weight: bold">操作</td> -->
                  </tr>
                  <s:iterator value="reps"> 
                  		<s:if test="year != null">
                  			<tr>
							    <td width="10%" align="center" bgcolor="#EEEEEE"><s:property value="id"/></td>
			                    <td width="25%" height="20" align="center" bgcolor="#EEEEEE"><s:property value="shortname"/></td>
			                    <td width="50%" align="center" bgcolor="#EEEEEE"><s:property value="represent"/></td>
			                    <!--  <td width="15%" align="center" bgcolor="#EEEEEE"><a href="${pageContext.request.contextPath}/find/timeAction!toUpdateTask?represent.id=${id}&page.currentPage=${page.currentPage}&year=${year}&month=${month}&day=${day}">修改|</a><a href="${pageContext.request.contextPath}/find/timeAction!deleteTask?represent.id=${id}&page.currentPage=1&year=${year}&month=${month}&day=${day}">删除</a></td>-->
                  		   </tr>    
                  		</s:if>
                  		<s:else>
                  			<tr>
							    <td width="10%" align="center" bgcolor="#EEEEEE"><s:property value="id"/></td>
			                    <td width="25%" height="20" align="center" bgcolor="#EEEEEE"><s:property value="shortname"/></td>
			                    <td width="50%" align="center" bgcolor="#EEEEEE"><s:property value="represent"/></td>
			                    <!--<td width="15%" align="center" bgcolor="#EEEEEE">无</td>-->
                  		   </tr>    
                  		</s:else>  
               	  	   		        	  	             	  	   
                  </s:iterator>
                </table>
                </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
      <s:if test="year!=null">
      		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
		        <tr>
		          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
		        </tr>
        		<tr>
          			<td height="33">
          				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              				<tr>
				                <td width="50%">
				                	共 <span class="right-text09">
				                		<s:if test="page.countPage==0">0</s:if><s:else>${page.countPage}</s:else>
				                	  </span> 
				                                         页 | 第 <span class="right-text09">
				                          <s:if test="page.currentPage==0">0</s:if><s:else>${page.currentPage}</s:else>
				                      </span>
				                                     页</td>
				                <td width="49%" align="right">
				                	[<s:if test="page.currentPage >  page.pageNo"><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByTime?page.currentPage=1&year=${year}&month=${month}&day=${day}" class="right-font08">首页</a></s:if><<s:else>首页</s:else> 
				                	| <s:if test="page.currentPage > page.pageNo"><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByTime?page.currentPage=${page.currentPage-1}&year=${year}&month=${month}&day=${day}" class="right-font08">上一页</a></s:if><s:else>上一页</s:else> 
				                	| <s:if test="page.currentPage==page.countPage">下一页</s:if><s:else><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByTime?page.currentPage=${page.currentPage+1}&year=${year}&month=${month}&day=${day}" class="right-font08">下一页</a></s:else>
				                    | <s:if test="page.currentPage==page.countPage">末页</s:if><s:else><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByTime?page.currentPage=${page.countPage}&year=${year}&month=${month}&day=${day}" class="right-font08">末页</a></s:else>
				                    ] 转至：
				                </td>
                				<td width="1%">
                   					<form action="${pageContext.request.contextPath}/find/timeAction!findTaskByTime?year=${year}&month=${month}&day=${day}" method="post">
	                   					<table width="20" border="0" cellspacing="0" cellpadding="0">
		                    				<tr>
		                    					<s:if test="page.countPage==0">
		                    						<td width="1%"><input name="goPage" type="text" class="right-textfield03" size="1" readonly="readonly"/></td>
		                      						<td width="87%"><input name="Submit23222" type="button" class="right-button06" value="go" readonly="readonly"/></td>
		                    					</s:if>
		                    					<s:else>
		                    						<td width="1%"><input name="goPage" type="text" class="right-textfield03" size="1" id="submit1"/></td>
		                      						<td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="go" onclick="return check1();"/></td>
		                    					</s:else>
		                      					
		                    				</tr>
	                					</table>
                   					</form>
                				</td>
              				</tr>
          				</table>
          			</td>
        		</tr>
      		</table>
		</s:if>
		<s:else>
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
		        <tr>
		          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
		        </tr>
        		<tr>
          			<td height="33">
          				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              				<tr>
				                <td width="50%">
				                	共 <span class="right-text09">
				                		<s:if test="page.countPage==0">0</s:if><s:else>${page.countPage}</s:else>
				                	  </span> 
				                                         页 | 第 <span class="right-text09">
				                          <s:if test="page.currentPage==0">0</s:if><s:else>${page.currentPage}</s:else>
				                      </span>
				                                     页</td>
				                <td width="49%" align="right">
				                	[<s:if test="page.currentPage >  page.pageNo"><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByShortname?page.currentPage=1&represent.shortname=${represent.shortname}" class="right-font08">首页</a></s:if><<s:else>首页</s:else> 
				                	| <s:if test="page.currentPage > page.pageNo"><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByShortname?page.currentPage=${page.currentPage-1}&represent.shortname=${represent.shortname}" class="right-font08">上一页</a></s:if><s:else>上一页</s:else> 
				                	| <s:if test="page.currentPage==page.countPage">下一页</s:if><s:else><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByShortname?page.currentPage=${page.currentPage+1}&represent.shortname=${represent.shortname}" class="right-font08">下一页</a></s:else>
				                    | <s:if test="page.currentPage==page.countPage">末页</s:if><s:else><a href="${pageContext.request.contextPath}/find/timeAction!findTaskByShortname?page.currentPage=${page.countPage}&represent.shortname=${represent.shortname}" class="right-font08">末页</a></s:else>
				                    ] 转至：
				                </td>
                				<td width="1%">
                   					<form action="${pageContext.request.contextPath}/find/timeAction!findTaskByShortname?represent.shortname=${represent.shortname}" method="post">
	                   					<table width="20" border="0" cellspacing="0" cellpadding="0">
		                    				<tr>
		                      					<s:if test="page.countPage==0">
		                    						<td width="1%"><input name="goPage" type="text" class="right-textfield03" size="1" readonly="readonly"/></td>
		                      						<td width="87%"><input name="Submit23222" type="button" class="right-button06" value="go" readonly="readonly"/></td>
		                    					</s:if>
		                    					<s:else>
		                    						<td width="1%"><input name="goPage" type="text" class="right-textfield03" size="1" id="submit2"/></td>
		                      						<td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="go" onclick="return check2();"/></td>
		                    					</s:else>
		                    				</tr>
	                					</table>
                   					</form>
                				</td>
              				</tr>
          				</table>
          			</td>
        		</tr>
      		</table>
		</s:else>
		</td>
  	</tr>
</table>
</body>
</html>
