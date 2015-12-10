<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人时间管理系统</title>
		<link href="../css/wnl.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript">
			var debug = 2; // -1: disable; 0: all; N: show level N debug msg.

			//农历数据信息
			var lunarInfo = new Array(
			0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
			0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
			0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
			0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
			0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
			0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
			0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
			0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
			0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
			0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
			0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
			0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
			0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
			0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
			0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0)

			//太阳历每月天数
			var solarMonth = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
			//天干
			var Gan = new Array("甲","乙","丙","丁","戊","己","庚","辛","壬","癸");
			//地支
			var Zhi = new Array("子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥");
			//属相
			var Animals=new Array("鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪");
			//节气
			var solarTerm = new Array("小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至");
			//?????
			var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758);
			//
			var nStr1 = new Array('日','一','二','三','四','五','六','七','八','九','十');
			//
			var nStr2 = new Array('初','十','廿','卅','　');
			//英语月份简写
			var monthName = new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");

			//国历节日 *表示节假日
			var sFtv = new Array(
					"0101*元旦",
					"0214 情人节",
					"0308 妇女节",
					"0312 植树节",
					"0315 消费者权益日",
					"0321 世界森林日、世界儿歌日",
					"0322 世界水日",
					"0323 世界气象日",
					"0324 世界防治结核病日",
					
					"0401 愚人节",
					"0407 世界卫生日",
					"0422 世界地球日",
					
					"0501*劳动节",
					"0504 青年节",
					"0505 碘缺乏病防治日",
					"0508 世界红十字日",
					"0512 国际护士节",
					"0515 国际家庭日",
					"0517 世界电信日",
					"0518 国际博物馆日",
					"0520 全国学生营养日",
					"0523 国际牛奶日",
					"0531 世界无烟日",
					
					"0601 儿童节",
					"0605 世界环境日",
					"0606 全国爱眼日",
					"0616 防治荒漠化和干旱日",
					"0623 国际奥林匹克日",
					"0625 全国土地日",
					"0626 国际反毒品日",
					
					"0701 建党节 香港回归纪念 国际建筑日",
					"0707 中国人民抗日战争纪念日",
					"0711 世界人口日",
				
					"0801 建军节",
					"0808 父亲节",
					
					"0908 国际扫盲日",
					"0909 毛泽东逝世纪念",
					"0910 教师节",
					"0912 嘻嘻日",
					"0916 国际臭氧层保护日",
					"0920 国际爱牙日",
					"0927 世界旅游日",
					"0928 孔子诞辰",
					
					"1001*国庆节 国际音乐日",
					"1004 世界动物日",
					"1006 老人节",
					"1008 全国高血压日 世界视觉日",
					"1009 世界邮政日",
					"1015 国际盲人节",
					"1016 世界粮食日",
					"1017 世界消除贫困日",
					"1024 联合国日",
					
					"1108 中国记者日",
					"1109 消防宣传日",
					"1112 孙中山诞辰纪念",
					"1114 世界糖尿病日",
					"1117 国际大学生节",
			
					"1201 世界艾滋病日",
					"1203 世界残疾人日",
					"1209 世界足球日",
					"1220 澳门回归纪念",
					"1225 圣诞节",
					"1226 毛泽东诞辰纪念",
					"1229 国际生物多样性日"
					);

			//农历节日 *表示节假日
			var lFtv = new Array(
					"0101*春节",
					"0115 元宵节",
					"0505 端午节",
					"0707 七夕情人节",
					"0715 中元节",
					"0815 中秋节",
					"0909 重阳节",
					"1208 腊八节",
					"1223 小年",
					"0100*除夕"
					);

			//按周计算 月周日
			var wFtv = new Array(
					"0520 国际母亲节",
					"0530 全国助残日",
					"0630 国际父亲节",
					"0932 国际和平日",
					"0940 国际聋人节",
					"1013 国际减轻自然灾害日",
					"1011 国际住房日"
					);
			//这个方法不知道干什么的，先看后边
			function log(level,  msg) 
			{
			        if (debug == 0 || debug == level)
			        if(window.console) {
			                window.console.log("[DEBUG]" + msg);
			        }
			}

			function lYearDays(y) {
			   var i, sum = 348;
			   for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0;
			   return(sum+leapDays(y));
			}

			function leapDays(y) {
			   if(leapMonth(y))  return((lunarInfo[y-1900] & 0x10000)? 30: 29);
			   else return(0);
			}

			function leapMonth(y) {
			   return(lunarInfo[y-1900] & 0xf);
			}

			function monthDays(y,m) {
			   return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 );
			}

			function Lunar(objDate) {
			   var m = ""; // msg for log
			   var i, leap=0, temp=0;
			   var baseDate = new Date(1900,0,31);
			// changed by hmisty 2005/07/23
			//   var offset   = (objDate - baseDate)/86400000;
			   var offset   = Math.floor((objDate.getTime() + 2206425600000)/86400000);
			   m += "objDate="+objDate.getTime()+", new Date(1900,0,31)="+baseDate.getTime();
			   m += "offset="+offset;
			   
			   this.dayCyl = offset + 40;
			   this.monCyl = 14;
			
			   for(i=1900; i<2050 && offset>0; i++) {
			      temp = lYearDays(i);
			      offset -= temp;
			      this.monCyl += 12;
			   }
			   
			   if(offset<0) {
			      offset += temp;
			      i--;
			      this.monCyl -= 12;
			   }
			
			   this.year = i;
			   this.yearCyl = i-1864;
			
			   leap = leapMonth(i);
			   this.isLeap = false;
			
			   for(i=1; i<13 && offset>0; i++) {
			      if(leap>0 && i==(leap+1) && this.isLeap==false)
			         { --i; this.isLeap = true; temp = leapDays(this.year); }
			      else
			         { temp = monthDays(this.year, i); }
			
			      if(this.isLeap==true && i==(leap+1)) this.isLeap = false;
			
			      offset -= temp;
			      if(this.isLeap == false) this.monCyl ++;
			   }
			
			   if(offset==0 && leap>0 && i==leap+1)
			      if(this.isLeap)
			         { this.isLeap = false; }
			      else
			         { this.isLeap = true; --i; --this.monCyl;}
			
			   if(offset<0){ offset += temp; --i; --this.monCyl; }
			
			   this.month = i;
			   this.day = offset + 1;
			   
			   m += "\noffset="+offset+", year="+this.year+", yearCyl="+this.yearCyl+", month="+this.month+",\n monthCyl="+this.monthCyl+", day="+this.day+", dayCyl="+this.dayCyl;
			   log(2, m);
			}

			function solarDays(y,m) {
			   if(m==1)
			      return(((y%4 == 0) && (y%100 != 0) || (y%400 == 0))? 29: 28);
			   else
			      return(solarMonth[m]);
			}
			
			function cyclical(num) {
			   return(Gan[num%10]+Zhi[num%12]);
			}

			function calElement(sYear,sMonth,sDay,week,lYear,lMonth,lDay,isLeap,cYear,cMonth,cDay) {
			
			      this.isToday    = false;
			      this.sYear      = sYear;
			      this.sMonth     = sMonth;
			      this.sDay       = sDay;
			      this.week       = week;
			      this.lYear      = lYear;
			      this.lMonth     = lMonth;
			      this.lDay       = lDay;
			      this.isLeap     = isLeap;
			      this.cYear      = cYear;
			      this.cMonth     = cMonth;
			      this.cDay       = cDay;
			
			      this.color      = '';
			
			      this.lunarFestival = '';
			      this.solarFestival = '';
			      this.solarTerms    = '';
			
			}

			function sTerm(y,n) {
			   log(1,  "y="+y+" n="+n+" sTermInfo[n]="+sTermInfo[n]+" Date.UTC(1900,0,6,2,5)="+Date.UTC(1900,0,6,2,5)+" Date.UTC(1970,0,1,0,0)="+Date.UTC(1970,0,1,0,0) );
			// changed by hmisty 2005/07/23
			//   var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000  ) + Date.UTC(1900,0,6,2,5) );
			   var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000  ) -2208549300000 );
			   // Negative epoch (time_t) values are not officially supported by the
			   // POSIX standards.  On some systems, they are known not to work.
			   // -- perldoc Time::Local
			
			   return(offDate.getUTCDate());
			}

			function calendar(y,m) {
			        log(1,  "i am in calendar() now");
				var sDObj, lDObj, lY, lM, lD=1, lL, lX=0, tmp1, tmp2;
				var lDPOS = new Array(3);
				var n = 0;
				var firstLM = 0;
			     
				sDObj = new Date(y,m,1);
				     
				this.length    = solarDays(y,m);
			     	this.firstWeek = sDObj.getDay();
			
			        log(1,  "this.length: "+this.length);
			        log(1,  "begin loop for(var i=0;i<this.length;i++)");
				for(var i=0;i<this.length;i++) {
				  
					if(lD>lX) {
						sDObj = new Date(y,m,i+1);
						lDObj = new Lunar(sDObj);
						lY    = lDObj.year;
						lM    = lDObj.month;
						lD    = lDObj.day;
						lL    = lDObj.isLeap;
						lX    = lL? leapDays(lY): monthDays(lY,lM);
				       
						if(n==0) firstLM = lM;
						lDPOS[n++] = i-lD+1;
				  	}
				  
				       //log(1,  "lDObj.dayCyl: "+lDObj.dayCyl);
					this[i] = new calElement(y, m+1, i+1, nStr1[(i+this.firstWeek)%7],
			                               lY, lM, lD++, lL,
			                               cyclical(lDObj.yearCyl) ,cyclical(lDObj.monCyl), cyclical(lDObj.dayCyl++) );
			
				  
					if((i+this.firstWeek)%7==0)   this[i].color = '#ff5f07';
					if((i+this.firstWeek)%14==13) this[i].color = '#ff5f07';
			     	}
			        log(1,  "end loop for(var i=0;i<this.length;i++)");
			
				tmp1=sTerm(y,m*2  )-1;
				tmp2=sTerm(y,m*2+1)-1;
				log(1,  "m: "+m+" tmp1: "+tmp1+" "+solarTerm[m*2]+" tmp2: "+tmp2+" "+solarTerm[m*2+1]);
				this[tmp1].solarTerms = solarTerm[m*2];
			     	this[tmp2].solarTerms = solarTerm[m*2+1];
				if(m==3) this[tmp1].color = '#ff5f07';
			        
			        log(1,  "begin loop for(i in sFtv)");
				for(i in sFtv)
					if(sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/))
						if(Number(RegExp.$1)==(m+1)) {
							this[Number(RegExp.$2)-1].solarFestival += RegExp.$4 + ' ';
							if(RegExp.$3=='*') this[Number(RegExp.$2)-1].color = '#ff5f07';
				       		}
			     
			        log(1,  "begin loop for(i in wFtv)");
				for(i in wFtv)
					if(wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
						if(Number(RegExp.$1)==(m+1)) {
							tmp1=Number(RegExp.$2);
							tmp2=Number(RegExp.$3);
							this[((this.firstWeek>tmp2)?7:0) + 7*(tmp1-1) + tmp2 - this.firstWeek].solarFestival += RegExp.$5 + ' ';
				       		}
			     
			        log(1,  "begin loop for(i in lFtv)");
				for(i in lFtv)  
					if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
			                        log(1,  lFtv[i]);
						tmp1=Number(RegExp.$1)-firstLM;
						if(tmp1==-11) tmp1=1;
						if(tmp1 >=0 && tmp1<n) {
							tmp2 = lDPOS[tmp1] + Number(RegExp.$2) -1;
							if( tmp2 >= 0 && tmp2<this.length) {
			                                        log(1,  "tmp2 >= 0 && tmp2("+tmp2+")<this.length("+this.length+")");
			                                        log(1,  RegExp.$4);
			                                        log(1,  this[tmp2].lunarFestival);
								this[tmp2].lunarFestival += RegExp.$4 + ' ';
			                                        log(1,  RegExp.$3);
								if(RegExp.$3=='*') this[tmp2].color = '#ff5f07';
							}
						}
				  	}
			     
			        log(1,  "begin 黑色星期五");
				if((this.firstWeek+12)%7==5)
					this[12].solarFestival += '黑色星期五 ';
			     
				if(y==tY && m==tM) {
					this[tD-1].isToday = true;
				}
			}

			function cDay(d){
				var s;
				switch (d) {
					case 10:
						s = '初十'; 
						break;
					case 20:
						s = '二十'; 
						break;
					case 30:
						s = '三十';
						break;
					default :
						s = nStr2[Math.floor(d/10)];
						s += nStr1[d%10];
				}
				return(s);
			}

			var cld;

			function drawCld(SY,SM) {
			        log(1,  "i am in drawCld() now");
			        
				var i,sD,s,size;
				log(1,  "begin to create calendar cld");
				cld = new calendar(SY,SM);
			        log(1,  "calendar cld creation finished");
				/*
				   if(SY>1874 && SY<1909) yDisplay = '光绪' + (((SY-1874)==1)?'元':SY-1874)
				   if(SY>1908 && SY<1912) yDisplay = '宣统' + (((SY-1908)==1)?'元':SY-1908)
				   if(SY>1911 && SY<1950) yDisplay = '民国' + (((SY-1911)==1)?'元':SY-1911)
				   if(SY>1949) yDisplay = '共和国' + (((SY-1949)==1)?'元':SY-1949)
				 */
			     
				document.getElementById("gz").innerHTML = '&nbsp;&nbsp;农历' 
					+ cyclical(SY-1900+36) + '年 &nbsp;&nbsp;【'+Animals[(SY-4)%12]+'】';
			        log(1,  "innerHTML of gz is "+document.getElementById("gz").innerHTML);
			   //YMBG.innerHTML = "&nbsp;" + SY + "<BR>&nbsp;" + monthName[SM];
			        
				for(i=0;i<42;i++) {
				  
					sObj = document.getElementById('sd'+ i);
					lObj = document.getElementById('ld'+ i);
				  
					sObj.style.background = '';
				  	lObj.style.background = '';
				  
					sD = i - cld.firstWeek;
				  
					if(sD>-1 && sD<cld.length) {	       
						sObj.innerHTML = sD+1;
						if(cld[sD].isToday){
							//设置今天的背景色
							sObj.style.background = 'red';
							//lObj.style.background = 'red';
						}
				       
						sObj.style.color = cld[sD].color;
				       
						if(cld[sD].lDay==1)
							lObj.innerHTML = '<b>'+(cld[sD].isLeap?'闰':'') 
								+ cld[sD].lMonth + '月' 
								+ (monthDays(cld[sD].lYear,cld[sD].lMonth)==29?'小':'大')+'</b>';
						else
					    		lObj.innerHTML = cDay(cld[sD].lDay);
				       
						s=cld[sD].lunarFestival;
						if(s.length>0) {
							//农历节日名称大于5个字截去
							//if(s.length>5) s = s.substr(0, 3)+'…';
							if(s.length>7) s = s.substr(0, 5)+'…';
							s = s.fontcolor('#ff5f07');
						}
						else {
							s=cld[sD].solarFestival;
							if(s.length>0) {
								//阳历节日名称截去
								//size = (s.charCodeAt(0)>0 && s.charCodeAt(0)<128)?8:4;			
								size = (s.charCodeAt(0)>0 && s.charCodeAt(0)<128)?9:5;
						 		if(s.length>size+1) s = s.substr(0, size-1)+'…';
								s = s.fontcolor('#0168ea');
							}
							else {
								s=cld[sD].solarTerms;
								if(s.length>0) s = s.fontcolor('#44d7cf');
							}
						}
						if(s.length>0) lObj.innerHTML = s;
				  
					}
					else {
						sObj.innerHTML = ' ';
						lObj.innerHTML = ' ';
					}
			     	}
			}


			function changeCld() {
				var y,m;
				y = document.getElementById("sy").selectedIndex + 1900;
				m = document.getElementById("sm").selectedIndex;
			     	drawCld(y,m);
			}

			function pushBtm(K) {
				switch (K){
					case 'YU' :
						if(document.getElementById("sy").selectedIndex > 0)
						       	document.getElementById("sy").selectedIndex--;
						break;
					case 'YD' :
						if(document.getElementById("sy").selectedIndex < 149) 
							document.getElementById("sy").selectedIndex++;
				       		break;
					case 'MU' :
						if(document.getElementById("sm").selectedIndex > 0) {      
							document.getElementById("sm").selectedIndex--;
						}
						else {
							document.getElementById("sm").selectedIndex = 11;
							if(document.getElementById("sy").selectedIndex > 0) 
								document.getElementById("sy").selectedIndex--;
						}
						break;
					case 'MD' :
						if(document.getElementById("sm").selectedIndex < 11) {
							document.getElementById("sm").selectedIndex++;
						}
						else {
							document.getElementById("sm").selectedIndex = 0;
							if(document.getElementById("sy").selectedIndex < 149) 
								document.getElementById("sy").selectedIndex++;
						}
						break;
					default :
						document.getElementById("sy").selectedIndex = tY - 1900;
						document.getElementById("sm").selectedIndex = tM;
				}
				changeCld();
			}

			var Today = new Date();
			var tY = Today.getFullYear();
			var tM = Today.getMonth();
			var tD = Today.getDate();
			
			var width = "130"; //detail层宽度
			var offsetx = 2;
			var offsety = 16;
			
			var x = 0;
			var y = 0;
			var show = 0;
			var sw = 0;
			var cnt = 0;
			
			var dStyle;
			document.onmousemove = mEvn;
			
			//获取鼠标坐标
			function mEvn(e) {
				if (!show) return;
				if(window.event){
					x = event.x ;
					y = event.y ;
					if (document.body.scrollLeft){
						x += document.body.scrollLeft; 
						y += document.body.scrollTop;
					} 
					// changed by hmisty 2005/07/23
			      		dStyle.left = (x + offsetx-(width/2)) + "px";
			      		dStyle.top = (y + offsety) + "px";
				}
				else {
			     		dStyle.left = (e.pageX + offsetx-(width/2)) + "px";
			      		dStyle.top = (e.pageY + offsety) + "px";
				 }
			}

			function changeTZ() {
			   document.getElementById("city").innerHTML = document.getElementById("tz").value.substr(6);
			   setCookie("TZ",document.getElementById("tz").selectedIndex);
			}
			
			function tick() {
				var today;
				today = new Date();
				document.getElementById("clock").innerHTML = today.getFullYear() + "年"
					+ today.getMonth() + "月" + today.getDay() + "日" + today.getTime();
			     	window.setTimeout("tick()", 1000);
			}
			
			function setCookie(name, value) {
				var today = new Date()
				var expires = new Date()
				expires.setTime(today.getTime() + 1000*60*60*24*365)
				document.cookie = name + "=" + escape(value)	+ "; expires=" + expires.toGMTString()
			}

			function getCookie(Name) {
			   var search = Name + "=";
			   if(document.cookie.length > 0) {
			      offset = document.cookie.indexOf(search);
			      if(offset != -1) {
			         offset += search.length;
			         end = document.cookie.indexOf(";", offset);
			         if(end == -1) end = document.cookie.length;
			         return unescape(document.cookie.substring(offset, end));
			      }
			      else return "";
			   }
			}
			
			function fillSelect() {
				syd = document.getElementById("sy");
				syd.innerHTML = "";
				for(i=1900;i<2050;i++)
				{
					ins = document.createElement("OPTION");
					ins.innerHTML = i;
					syd.appendChild(ins);
				}
				smd = document.getElementById("sm");
				smd.innerHTML = "";
				for(i=1;i<13;i++)
				{
					ins = document.createElement("OPTION");
					ins.innerHTML = i;
					smd.appendChild(ins);
				}
			}

			function fillCalendar() {
				var gNum;
				var tablex = document.createElement("table");
				tablex.setAttribute("id","week");
				for(i=0;i<6;i++) {
					var trx1 = document.createElement("tr");
					var trx2 = document.createElement("tr");
					trx1.setAttribute("class","tr1");
					trx2.setAttribute("class","tr2");
					for(j=0;j<7;j++) {
						gNum = i*7+j;
						var tdx = document.createElement("td");
						tdx.setAttribute("id","sd"+gNum);
						tdx.setAttribute("onMouseOver",'mOvr('+gNum+')');
						tdx.setAttribute("onMouseOut","mOut()");
						if(j == 0){
							tdx.setAttribute("class","aorange");
						}
						else if(j == 6){
							if(i%2==1) tdx.setAttribute("class","aorange");
							else tdx.setAttribute("class","agreen");
						}
						else{
							tdx.setAttribute("class","one");
						}
						trx1.appendChild(tdx);
					
						tdx = document.createElement("td");
						tdx.setAttribute("id","ld"+gNum);
						tdx.setAttribute("onMouseOver",'mOvr('+gNum+')');
						tdx.setAttribute("onMouseOut","mOut()");
						trx2.appendChild(tdx);
					}
					tablex.appendChild(trx1);
					tablex.appendChild(trx2);
				}
				document.getElementById("calendar").appendChild(tablex);
			}
			//界面初始化
			function initial() {
				//select
				
				dStyle = document.getElementById("detail").style;
				//fillSelect();
				//fillCalendar();
			
				document.getElementById("sy").selectedIndex=tY-1900;
				document.getElementById("sm").selectedIndex=tM;
				log(1,  "initial call drawCld() now");
				drawCld(tY,tM);
			     
			    now();
			    hidden();
			}
			
			function TimeAdd(UTC,T)
			{
				var PlusMinus, DST, y;
				alert(UTC);
				if (T.substr(0,1) == "-"){
					PlusMinus = -1;
				}
				else{
					PlusMinus = 1;
				}
			}
			
		</script>
		
		<script language="javascript">
  			function addFavorite(url,title){
    			var fav_url = url;
				var fav_title = title;
				if (document.all && window.external){
   					window.external.AddFavorite(fav_url,fav_title);
				}else if (window.sidebar){
   					window.sidebar.addPanel(fav_title,fav_url,"");
				}else{
   					alert("浏览器不支持，请手动加入收藏夹");
				}
  			}
		</script>

		<script language="javascript">
			function  addFav(title,url) {   //  加入收藏夹
				if(document.all)
				{
					window.external.addFavorite(url,title);
				}else if(window.sidebar)
				{
					window.sidebar.addPanel(title,url,  "" );
				}
			}
			
			function addTask(num){
				var day = document.getElementById('sd'+num).innerHTML;
				var m = document.getElementById('sm');
				var month = m.options[m.selectedIndex].text;
				var y = document.getElementById('sy');
				var year = y.options[y.selectedIndex].text;
				if(day < 10){
					day = "0"+day;
				}
				if(month < 10){
					month = "0"+month;
				}
				var time = year+"-"+month+"-"+day;
				document.getElementById("time1").value=time;
				document.getElementById("addTask").style.visibility="visible";
				
			}
			
			function now(){
				var date = new Date();
				var hours = date.getHours(); 
				var minutes = date.getMinutes();
				var seconds = date.getSeconds();
				if(hours < 10){
					hours = '0'+hours;
				}
				if(minutes < 10){
					minutes = '0'+minutes;
				}
				if(seconds < 10){
					seconds = '0'+seconds;
				}
				document.getElementById('time').innerHTML=hours+'时'+minutes+'分'+seconds+'秒';
				setTimeout('now()',1000);
				return date.getYear()+"-"+date.getMonth()+"-"+date.getDay();
			}
			function hidden(){
				var addTask = document.getElementById("addTask");
				addTask.style.visibility="hidden";
			}
			
		</script>	
	</head>
	<body onload="initial()">
		<div >
		<table width="700" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFFFFF;">
  			<tr>
    			<td>
					<table width="500"  border="1" cellspacing="0" cellpadding="0" style="margin:auto;">
  						<tr align="center" style="background-color: #375AD0;">
    						<td style="color:white;font-size:30px"><strong>万年历：</strong></td>
  						</tr>
  						<tr>
    						<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
  									<tr>   									
    									<td style="text-align:center;">
											<table width="600" cellpadding="0" cellspacing="0" style="border:1px solid #666;">
  												<tr>
    												<td colspan="2" valign="top">
														<div id="date" style="text-align:center;">
      														<p>公历
        													<select name="select" id="sy" onchange="changeCld()">
          														<option>1900</option>
            													<option>1901</option>
													            <option>1902</option>
													            <option>1903</option>
													            <option>1904</option>
													            <option>1905</option>
													            <option>1906</option>
													            <option>1907</option>
													            <option>1908</option>
													            <option>1909</option>
													            <option>1910</option>
													            <option>1911</option>
													            <option>1912</option>
													            <option>1913</option>
													            <option>1914</option>
													            <option>1915</option>
													            <option>1916</option>
													            <option>1917</option>
													            <option>1918</option>
													            <option>1919</option>
													            <option>1920</option>
													            <option>1921</option>
													            <option>1922</option>
													            <option>1923</option>
													            <option>1924</option>
													            <option>1925</option>
													            <option>1926</option>
													            <option>1927</option>
													            <option>1928</option>
													            <option>1929</option>
													            <option>1930</option>
													            <option>1931</option>
													            <option>1932</option>
													            <option>1933</option>
													            <option>1934</option>
													            <option>1935</option>
													            <option>1936</option>
													            <option>1937</option>
													            <option>1938</option>
													            <option>1939</option>
													            <option>1940</option>
													            <option>1941</option>
													            <option>1942</option>
													            <option>1943</option>
													            <option>1944</option>
													            <option>1945</option>
													            <option>1946</option>
													            <option>1947</option>
													            <option>1948</option>
													            <option>1949</option>
													            <option>1950</option>
													            <option>1951</option>
													            <option>1952</option>
													            <option>1953</option>
													            <option>1954</option>
													            <option>1955</option>
													            <option>1956</option>
													            <option>1957</option>
													            <option>1958</option>
													            <option>1959</option>
													            <option>1960</option>
													            <option>1961</option>
													            <option>1962</option>
													            <option>1963</option>
													            <option>1964</option>
													            <option>1965</option>
													            <option>1966</option>
													            <option>1967</option>
													            <option>1968</option>
													            <option>1969</option>
													            <option>1970</option>
													            <option>1971</option>
													            <option>1972</option>
													            <option>1973</option>
													            <option>1974</option>
													            <option>1975</option>
													            <option>1976</option>
													            <option>1977</option>
													            <option>1978</option>
													            <option>1979</option>
													            <option>1980</option>
													            <option>1981</option>
													            <option>1982</option>
													            <option>1983</option>
													            <option>1984</option>
													            <option>1985</option>
													            <option>1986</option>
													            <option>1987</option>
													            <option>1988</option>
													            <option>1989</option>
													            <option>1990</option>
													            <option>1991</option>
													            <option>1992</option>
													            <option>1993</option>
													            <option>1994</option>
													            <option>1995</option>
													            <option>1996</option>
													            <option>1997</option>
													            <option>1998</option>
													            <option>1999</option>
													            <option>2000</option>
													            <option>2001</option>
													            <option>2002</option>
													            <option>2003</option>
													            <option>2004</option>
													            <option>2005</option>
													            <option>2006</option>
													            <option>2007</option>
													            <option>2008</option>
													            <option>2009</option>
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
													            <option>2031</option>
													            <option>2032</option>
													            <option>2033</option>
													            <option>2034</option>
													            <option>2035</option>
													            <option>2036</option>
													            <option>2037</option>
													            <option>2038</option>
													            <option>2039</option>
													            <option>2040</option>
													            <option>2041</option>
													            <option>2042</option>
													            <option>2043</option>
													            <option>2044</option>
													            <option>2045</option>
													            <option>2046</option>
													            <option>2047</option>
													            <option>2048</option>
													            <option>2049</option>
													        </select>
       														 年
        													<select name="select2" id="sm" onchange="changeCld()">
														          <option>1</option>
														          <option>2</option>
														          <option>3</option>
														          <option>4</option>
														          <option>5</option>
														          <option>6</option>
														          <option>7</option>
														          <option>8</option>
														          <option>9</option>
														          <option>10</option>
														          <option>11</option>
														          <option>12</option>
        													</select>
        													月 <span id="gz">&nbsp;</span> 
        													<span id="time" style="color:red;font-size:20px;"></span>
        												</p>
    												</div>
    											</td>
    										</tr>
  											<tr>
    											<td align="center" valign="top">
													<div id="calendar">
      													<div id="detail">
        													<div id="datedetail"></div>
        													<div id="festival"></div>
      													</div>
      													<table id="calendarhead">
													        <tr>
													          <td>日</td>
													          <td>一</td>
													          <td>二</td>
													          <td>三</td>
													          <td>四</td>
													          <td>五</td>
													          <td>六</td>
													        </tr>
      													</table>
      													<table id="week">
        													<tr class="tr1">
													          <td class="aorange" id="sd0" onclick="addTask(0)"></td>
													          <td class="one" id="sd1" onclick="addTask(1)"></td>
													          <td class="one" id="sd2" onclick="addTask(2)"></td>
													          <td class="one" id="sd3" onclick="addTask(3)"></td>
													          <td class="one" id="sd4" onclick="addTask(4)"></td>
													          <td class="one" id="sd5" onclick="addTask(5)"></td>
													          <td class="agreen" id="sd6" onclick="addTask(6)"></td>
        													</tr>
													        <tr class="tr2">
													          <td id="ld0" onclick="addTask(0)"></td>
													          <td id="ld1" onclick="addTask(1)"></td>
													          <td id="ld2" onclick="addTask(2)"></td>
													          <td id="ld3" onclick="addTask(3)"></td>
													          <td id="ld4" onclick="addTask(4)"></td>
													          <td id="ld5" onclick="addTask(5)"></td>
													          <td id="ld6" onclick="addTask(6)"></td>
													        </tr>
													        <tr class="tr1">
													          <td class="aorange" id="sd7" onclick="addTask(7)"></td>
													          <td class="one" id="sd8" onclick="addTask(8)"></td>
													          <td class="one" id="sd9" onclick="addTask(9)"></td>
													          <td class="one" id="sd10" onclick="addTask(10)"></td>
													          <td class="one" id="sd11" onclick="addTask(11)"></td>
													          <td class="one" id="sd12" onclick="addTask(12)"></td>
													          <td class="aorange" id="sd13" onclick="addTask(13)"></td>
													        </tr>
													        <tr class="tr2">
													          <td id="ld7" onclick="addTask(7)"></td>
													          <td id="ld8" onclick="addTask(8)"></td>
													          <td id="ld9" onclick="addTask(9)"></td>
													          <td id="ld10" onclick="addTask(10)"></td>
													          <td id="ld11" onclick="addTask(11)"></td>
													          <td id="ld12" onclick="addTask(12)"></td>
													          <td id="ld13" onclick="addTask(13)"></td>
													        </tr>
													        <tr class="tr1">
													          <td class="aorange" id="sd14" onclick="addTask(14)"></td>
													          <td class="one" id="sd15" onclick="addTask(15)"></td>
													          <td class="one" id="sd16" onclick="addTask(16)"></td>
													          <td class="one" id="sd17" onclick="addTask(17)"></td>
													          <td class="one" id="sd18" onclick="addTask(18)"></td>
													          <td class="one" id="sd19" onclick="addTask(19)"></td>
													          <td class="agreen" id="sd20" onclick="addTask(20)"></td>
													        </tr>
													        <tr class="tr2">
													          <td id="ld14" onclick="addTask(14)"></td>
													          <td id="ld15" onclick="addTask(15)"></td>
													          <td id="ld16" onclick="addTask(16)"></td>
													          <td id="ld17" onclick="addTask(17)"></td>
													          <td id="ld18" onclick="addTask(18)"></td>
													          <td id="ld19" onclick="addTask(19)"></td>
													          <td id="ld20" onclick="addTask(20)"></td>
													        </tr>
													        <tr class="tr1">
													          <td class="aorange" id="sd21" onclick="addTask(21)"></td>
													          <td class="one" id="sd22" onclick="addTask(22)"></td>
													          <td class="one" id="sd23" onclick="addTask(23)"></td>
													          <td class="one" id="sd24" onclick="addTask(24)"></td>
													          <td class="one" id="sd25" onclick="addTask(25)"></td>
													          <td class="one" id="sd26" onclick="addTask(26)"></td>
													          <td class="aorange" id="sd27" onclick="addTask(27)"></td>
													        </tr>
													        <tr class="tr2">
													          <td id="ld21" onclick="addTask(21)"></td>
													          <td id="ld22" onclick="addTask(22)"></td>
													          <td id="ld23" onclick="addTask(23)"></td>
													          <td id="ld24" onclick="addTask(24)"></td>
													          <td id="ld25" onclick="addTask(25)"></td>
													          <td id="ld26" onclick="addTask(26)"></td>
													          <td id="ld27" onclick="addTask(27)"></td>
													        </tr>
													        <tr class="tr1">
													          <td class="aorange" id="sd28" onclick="addTask(28)"></td>
													          <td class="one" id="sd29" onclick="addTask(29)"></td>
													          <td class="one" id="sd30" onclick="addTask(30)"></td>
													          <td class="one" id="sd31" onclick="addTask(31)"></td>
													          <td class="one" id="sd32" onclick="addTask(32)"></td>
													          <td class="one" id="sd33" onclick="addTask(33)"></td>
													          <td class="agreen" id="sd34" onclick="addTask(34)"></td>
													        </tr>
													        <tr class="tr2">
													          <td id="ld28" onclick="addTask(28)"></td>
													          <td id="ld29" onclick="addTask(29)"></td>
													          <td id="ld30" onclick="addTask(30)"></td>
													          <td id="ld31" onclick="addTask(31)"></td>
													          <td id="ld32" onclick="addTask(32)"></td>
													          <td id="ld33" onclick="addTask(33)"></td>
													          <td id="ld34" onclick="addTask(34)"></td>
													        </tr>
													        <tr class="tr1">
													          <td class="aorange" id="sd35" onclick="addTask(35)"></td>
													          <td class="one" id="sd36" onclick="addTask(36)"></td>
													          <td class="one" id="sd37" onclick="addTask(37)"></td>
													          <td class="one" id="sd38" onclick="addTask(38)"></td>
													          <td class="one" id="sd39" onclick="addTask(39)"></td>
													          <td class="one" id="sd40" onclick="addTask(40)"></td>
													          <td class="aorange" id="sd41" onclick="addTask(41)"></td>
													        </tr>
													        <tr class="tr2">
													          <td id="ld35" onclick="addTask(35)"></td>
													          <td id="ld36" onclick="addTask(36)"></td>
													          <td id="ld37" onclick="addTask(37)"></td>
													          <td id="ld38" onclick="addTask(38)"></td>
													          <td id="ld39" onclick="addTask(39)"></td>
													          <td id="ld40" onclick="addTask(40)"></td>
													          <td id="ld41" onclick="addTask(41)"></td>
													        </tr>
      													</table>
    												</div>
    											</td>
    											<td valign="top">
													<div id="panel" style="text-align:center">
												      <div onclick="pushBtm('YU')">上一年↑</div>
												      <div onclick="pushBtm('YD')">下一年↓</div>
												      <div onclick="pushBtm('MU')">上一月↑</div>
												      <div onclick="pushBtm('MD')">下一月↓</div>
												      <div onclick="pushBtm('')">当前月</div>
    												</div>
    											</td>
  											</tr>
										</table>
									</td>
  								</tr>
							</table>
						</td>
  					</tr>
				</table>	
			</td>
			<td valign="top" id="addTask">
				<form action="${pageContext.request.contextPath}/rili/riliAction!addTaskByRili" method="post">
					<table width="550" border="1" cellspacing="0" cellpadding="0" style="margin:auto;">
					<thead style="width:100%;background-image: url('../images/hh.jpg')">
						<tr>
							<td colspan="2" align="center" style="color:white;font-size:30px;font-weight: bold">重要任务添加</td>
						</tr>
					</thead>
					<tbody style="width:100%;background-image: url('../images/wnl.jpg')">
						<tr>
							<td align="center" style="font-weight: bold;color: green;">
								时间：
							</td>
							<td>
								<input id="time1" type="text" name="sdiary.dtime"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="font-weight: bold;color: green;">
								用户：
							</td>
							<td>
								<input type="text" name="sdiary.person" value="<s:property value="#session.session_user.nickname" />"/>

							</td>
						</tr>
						<tr>
							<td align="center" style="font-weight: bold;color: green;">
								标题：
							</td>
							<td>
								<textarea rows="1" cols="30" name="sdiary.shortname"></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" style="font-weight: bold;color: green;">
								内容：
							</td>
							<td>
								<textarea id="tip" rows="11" cols="55" name="sdiary.represent"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" name="submit" value="保存"/>
							</td>
						</tr>
					</tbody>				
				</table>	
				</form>
				
			</td>
  		</tr>
	</table>
	</div>
	</body>
</html>
