<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030" %>
<%@ page import="com.bjsxt.shopping.*"%>

<%!
private String getSecondCategoryStr(List<Category> categories, Category topCategory) {
	StringBuffer buf = new StringBuffer();
	int childCount = 1;
	for (int i=0; i<categories.size(); i++) {
		Category c = categories.get(i);
		if (c.getPid() == topCategory.getId()) {
			buf.append("document.categoryform.category2.options[" + childCount + "].text = '" + c.getName() + "';\n");
			buf.append("document.categoryform.category2.options[" + childCount + "].value = '" + c.getId() + "';\n");
			childCount++;
		}
	}
	buf.insert(0, "document.categoryform.category2.options[0].value = '-1';\n");
	buf.insert(0, "document.categoryform.category2.options[0].text = '��ѯ����Ŀ¼';\n");
	buf.insert(0, "document.categoryform.category2.selectedIndex = 0;\n");
	
	buf.insert(0, "document.categoryform.category2.length = " + childCount + ";\n");
	buf.insert(0, "if (document.categoryform.category1.options[document.categoryform.category1.selectedIndex].value == " + topCategory.getId() + ") {\n");
	buf.append("}\n");
	
	return buf.toString();
}
%>


<%
List<Product> products = ProductMgr.getInstance().getLatestProducts(8);
List<Category> categories = Category.getCategories();
List<Category> topCategories = new ArrayList<Category>();
String str = "";
for (int i=0; i<categories.size(); i++) {
	Category c = categories.get(i);
	if (c.getGrade() == 1) {
		topCategories.add(c);
		str += getSecondCategoryStr(categories, c);
	}
}
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<me content="zh-cn"></me>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�̳� - ���Ͼ�Ʒ��Ա��</title>
<link href="images/new.css" rel="stylesheet" type="text/css">
<script language="javascript1.2">
function js_callpage(htmlurl)
{
	var newwin=window.open(htmlurl,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,top=2,width=360,height=470');
	return false;
}
function js_callpage1(htmlurl)
{
	var newwin=window.open(htmlurl,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,top=2,width=100,height=100');
	return false;
}
</script>
<script language="JavaScript">
function MM_swapImgRestore() { //v3.0
var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}






function MM_reloadPage(init) {//reloads the window if Nav4 resized
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function MM_showHideLayers() { //v6.0
var i,p,v,obj,args=MM_showHideLayers.arguments;
for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
obj.visibility=v; }
}
</script>
<script language="JavaScript">
var imgUrl=new Array();
var imgLink=new Array();
var imgTitle=new Array();
var imgPrice1=new Array();
var imgPrice2=new Array();
var adNum=0;imgUrl[1]='http://www.thinkshop.cn/pimages/br0465.gif';
	imgLink[1]='index_pi.php?productcode=BR0465';
	imgTitle[1]='��������ñʼǱ����Ա�Я������ɫ��ϥ���ͣ�';
	imgPrice1[1]='�۸񣺣�339.00';
	imgPrice2[1]='��Ա�۸񣺣�319.00';imgUrl[2]='http://www.thinkshop.cn/pimages/br0461.gif';
	imgLink[2]='index_pi.php?productcode=BR0461';
	imgTitle[2]='��������ñʼǱ����Я������ɫ�������ͣ�';
	imgPrice1[2]='�۸񣺣�339.00';
	imgPrice2[2]='��Ա�۸񣺣�319.00';imgUrl[3]='http://www.thinkshop.cn/pimages/gt1176.gif';
	imgLink[3]='index_pi.php?productcode=GT1176';
	imgTitle[3]='��������ñʼǱ���Я�ڴ�������';
	imgPrice1[3]='�۸񣺣�369.00';
	imgPrice2[3]='��Ա�۸񣺣�359.00';imgUrl[4]='http://www.thinkshop.cn/pimages/gt0873.gif';
	imgLink[4]='index_pi.php?productcode=GT0873';
	imgTitle[4]='3M 14.1 ���Է���Ƭ';
	imgPrice1[4]='�۸񣺣�459.00';
	imgPrice2[4]='��Ա�۸񣺣�449.00';var imgPre=new Array();
var j=0;
for (i=1;i<imgUrl.length;i++) {
if( (imgUrl[i]!="") && (imgLink[i]!="") ) {
j++;
} else {
break;
}
}

function playTran(){
	if (document.all)
	imgInit.filters.revealTrans.play();
}

var key=0;

function nextAd(){
	if(adNum<j)adNum++ ;
	else adNum=1;

	if( key==0 ){
		key=1;
	} else if (document.all){
		imgInit.filters.revealTrans.Transition=10;
		imgInit.filters.revealTrans.apply();
 		playTran();
	}
	document.images.imgInit.src=imgUrl[adNum];
	document.images.imgInit.title=imgTitle[adNum];
	img_title.innerHTML='<font color=#FFFFff>'+imgTitle[adNum]+'</font>';
	img_price1.innerHTML=imgPrice1[adNum];
	img_price2.innerHTML=imgPrice2[adNum];
	theTimer=setTimeout("nextAd()", 6000);
}

function goUrl(){
jumpUrl=imgLink[adNum];
jumpTarget='_blank';
if (jumpUrl != ''){
if (jumpTarget != '')
window.open(jumpUrl,jumpTarget);
else
location.href=jumpUrl;
}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/new.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="MM_preloadImages('images/00-2.gif','images/01-2.gif','images/02-2.gif','images/03-2.gif','images/04-2.gif','images/05-2.gif','images/06-2.gif','images/07-2.gif','images/08-2.gif','images/09-2.gif')">
<script src="images/piaochuang.js"></script>
<table align="left" border="0" cellpadding="0" cellspacing="0" width="980">
  <tbody>
    <tr>
      <td><!--��ʾͷ����Ϣ����-->
        <table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td width="10"></td>
              <td width="135"><a href="thinkshop.cn.htm"></a></td>
              <td width="50"></td>
              <td width="120"><a target="_blank" href="index_bat.php.htm"><img src="images/dazong.gif" border="0" height="47" width="90"></a></td>
              <td width="120"><a target="_blank" href="happybirthday.php.htm"><img src="images/shenri.gif" border="0" height="47" width="95"></a></td>
              <td width="120"><a target="_blank" href="brandshop.php.htm"><img src="images/pingpai.gif" border="0" height="47" width="96"></a></td>
              <td width="120"><a target="_blank" href="powered by Discuz!.htm"><img src="images/luntan.gif" border="0" height="47" width="95"></a></td>
              <td width="120"><a target="_blank" href="gc.htm"><img src="images/thinkcard.gif" border="0" height="47" width="90"></a></td>
              <td align="right" valign="bottom"><map name="FPMap_inctop">
                  <area href="point_exg.php.htm" shape="rect" coords="13,2,81,16" target="_blank">
                  <area href="my_thinkshop.php.htm" shape="rect" coords="92, 1, 158, 15" target="_blank">
                  <area href="extend.php.htm" shape="rect" coords="170, 0, 233, 16" target="_blank">
                </map>
                <img src="images/top_right.gif" usemap="#FPMap_inctop" border="0" height="22" width="238"></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td height="61"></td>
    </tr>
    <tr>
      <td bgcolor="#dadce8" height="1"><img src="images/line.gif" height="1" width="1"></td>
    </tr>
    <tr>
      <td><table border="0" cellpadding="0" cellspacing="0" width="980">
          <tbody>
            <tr>
              <td bgcolor="#ededed" width="1"><img src="images/line.gif" height="1" width="1"></td>
              <td background="images/topbg3.gif" height="31" width="123">��</td>
              <td align="center" background="images/topbg3.gif" width="28"></td>
              
			  
			  <script type="text/javascript">
			  <!-- 
			  	var req;	
			  	function changeCategory() {
			  		//]
			  		var id = document.categoryform.category1.options[document.categoryform.category1.selectedIndex];
					var url = "getchildcategory.jsp?id=" + escape(id.value);
					if (window.XMLHttpRequest) {
						req = new XMLHttpRequest();
					} else if (window.ActiveXObject) {
						req = new ActiveXObject("Microsoft.XMLHTTP");
					}
					req.open("GET", url, true);
					req.onreadystatechange = callback;
					req.send(null);
			  	}
			  	
			  	function callback() {
					if (req.readyState == 4) {
						if (req.status == 200) {							
							parseXML(req.responseXML);
						}
					}
				}
				
				function parse(msg) {
					msg = msg.replace(/(^\s*)|(\s*$)/g, "");
					alert(msg);
					eval(msg);
				}
				
				function parseXML(xml) {
					var categories = xml.getElementsByTagName("categories")[0];
					document.categoryform.category2.length = categories.childNodes.length + 1;
					document.categoryform.category2.selectedIndex = 0;
					document.categoryform.category2.options[0].text = "��ѯ����Ŀ¼";
					document.categoryform.category2.options[0].value = "-1";
					
					for (var i=0; i<categories.childNodes.length; i++) {
						var id = categories.childNodes[i].childNodes[0].childNodes[0].nodeValue;
						var name = categories.childNodes[i].childNodes[1].childNodes[0].nodeValue;
						document.categoryform.category2.options[i+1].text = name;
						document.categoryform.category2.options[i+1].value = id;							
					}
				}
				
			  -->
			  </script>
			                
              <td background="images/topbg3.gif" valign="middle" width="521"><input name="Bsearch" value="Y" type="hidden">
              <form method="post" name="categoryform" >
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td align="right" valign="middle" width="83%">
                      	<select name="category1" style="font-size: 9pt; color: rgb(85, 85, 85);" onchange="changeCategory()" >
                          <option value="-1">--��ѯ����һ�����--</option>
                          <%
                          	for (int i=0; i<topCategories.size(); i++) {
                          		Category c = topCategories.get(i);
                          %>
                          <option value="<%=c.getId()%>"><%=c.getName()%></option>	
                          <% 
                          	}
                          %>                          
                        </select>
                      </td>
                      <td align="left" valign="middle" width="83%">
                      	<select name="category2" style="font-size: 9pt; color: rgb(85, 85, 85);">                          
                        </select>
                      </td>
                      <td align="left" valign="middle" width="17%"></td>
                    </tr>
                  </tbody>
                </table>
               </form>
              </td>
              <td align="right" background="images/topbg3.gif" width="306">
              	<!--
              	<iframe name="buysta" src="images/buysta.htm" frameborder="0" height="14" scrolling="no" width="100%"></iframe>
              	-->
              	</td>
              <td bgcolor="#ededed" width="1"></td>
            </tr>
          </tbody>
        </table>
       </td>
    </tr>
    <tr>
      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td valign="top" width="190"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td onMouseOver="on_trview('0','')" align="center" height="40"><img src="images/login.gif" height="39" width="190"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td width="176"><img src="images/loginbg1.gif" height="19" width="188"></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td align="center" bgcolor="#e2e4f0">
                                  
                                  <form method="post" action="login.jsp">
									<input type="hidden" name="action" value="login"/>
									<table border="0" cellpadding="0" cellspacing="0" width="95%">
	                                    <tr>
	                                      <td align="left" height="25" width="73%">��Ա�ţ�
	                                        <input name="username" size="10" style="font-size: 12px;" type="text"></td>
	                                    </tr>
	                                    <tr>
	                                      <td align="left">�ܡ��룺
	                                        <input name="password" size="10" style="font-size: 11px;" type="password"></td>
	                                    </tr>
	                                    <tr>
	                                    	<td>
	                                    		<input type="submit" value="��¼">
	                                    	</td>
	                                    </tr>
	                                    <tr>
	                                      	<td colspan="2" height="30">[<a href="register.jsp">���û�ע��</a>] &nbsp;[<a href="passwdview.php.htm" onClick="js_callpage(href);return false">��������</a>]</td>
	                                    </tr>
	                                   </table>
                                  </form>
                                </td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td align="center" bgcolor="#e2e4f0"><table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="90%">
                                  
                                    <tr>
                                      <td align="left"> ��<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=86"><font color="#cc0000">�����ʰ칫Ϊ��,�����ɱ�<br>
                                        &nbsp;Я����(04.20-04.26)</font></a>&nbsp;<img src="images/hot_gif.gif"><br>
                                        ��<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=85">��Ʒ�ֳ�,���Բ���Ʒ�ʣ�</a><br>
                                        ��<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=84">������ʵ�ò���,��������..</a><br>
                                        ��<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=83">���޹ذ�3m���ӵƹذ�����..</a><br>
                                      </td>
                                    </tr>
                                    <tr>
                                      
                                    </tr>
                                  
                                </table></td>
                              
                            </tr>
                            <tr>
                              <td bgcolor="#e2e4f0" height="8"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              
                            </tr>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td align="center" bgcolor="#e2e4f0"><table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="90%">
                                  <tbody>
                                    <tr>
                                      <td class="twoji" align="left">��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=85" target="_blank">�������Ϊ2006�����ʦ��..</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=84" target="_blank">3M�ֻ�����Ĥ,�ر�İ�����..</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=83" target="_blank">���崺���α������й�����..</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=82" target="_blank">���300M 802.11n����·��</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=81" target="_blank">Pre-N 2���������·����</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=79" target="_blank">��ɽ����ɱ��U����װ����</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=78" target="_blank">������Ƶת�������˵��</a><br>
                                        ��<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=77" target="_blank">��������಩ʿϵ�н���</a><br></td>
                                    </tr>
                                    <tr>
                                      <td align="center" height="10" valign="top"></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#e2e4f0" height="8"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td bgcolor="#6874bf" valign="top"><input name="qid" value="7" type="hidden">
                        <input value="Y" name="Bsubmit" type="hidden">
                        </td>
                    </tr>
                  </tbody>
                </table></td>
              <td onMouseOver="on_trview('0','')" width="10"></td>
              <td valign="top" width="780">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              
                              <td valign="top" width="1360"><table bgcolor="#4352af" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                                  <tbody>
                                    <tr>
                                      <td align="left"><img src="images/newp_top.gif" height="38" width="257"></td>
                                    </tr>
                                    <tr>
                                      <td align="left" bgcolor="#4352af" height="98" valign="top" width="1360"><table border="0" cellpadding="0" cellspacing="0">
                                          <tbody>
                                            
                                              
                                              	<!-- ������Ʒstart here ���˴���ѭ����  -->
                                              	<%
                                              	for (int i=0; i<products.size(); i++) {
                                              		Product p = products.get(i);
                                              	%> 
                                              	<tr>
                                              		<td align="left" height="118" valign="left">
                                              		<span class="white">
                                              		<a href="productdetailshow.jsp?id=<%=p.getId()%>" class="white"><%=p.getName() %></a>
                                              		&nbsp;&nbsp;&nbsp;
                                              		��Ա�ۣ�<%=p.getMemberPrice() %>Ԫ
                                              		</span>
                                              </td>
                                              <td align="center" height="98" valign="middle" width="104">
                                              	<span style=""> 
                                              		<img src="admin/images/productIMG/3.jpg" id="imgInit" style="border-color: black; color: rgb(0, 0, 0);" name="imgInit" border="0" height="100" width="100">
                                              	</span>
                                              </td>
                                            </tr>
                                              	<%
                                              	} 
                                              	%>
                                                <!-- ������Ʒend here ���˴���ѭ����  -->
                                                
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td align="center" bgcolor="#4352af"></td>
                                    </tr>
                                    <tr>
                                      <td align="right"><img src="images/newp_up.gif" height="12" width="260"></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td width="584" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tbody>
                                    <tr>
                                      <td width="10"></td>
                                      <td width="553" valign="top">
									  
									  
									  
									  <table border="0" cellpadding="0" cellspacing="0" width="553">
                                          <tbody>
                                          
                                          
	                                            
                                          
                                          </tbody>
                                        </table>
                                      </td>
                                      <td width="20"></td>
                                    </tr>
                                  </tbody>
                              </table></td>
                              <td align="right" valign="top" width="196"><table border="0" cellpadding="0" cellspacing="0" width="196">
                                  <tbody>
                                    <tr>
                                      <td><img src="images/paihang_top.gif" height="88" width="196"></td>
                                    </tr>
                                    <tr>
                                      <td align="center" background="images/paihang_bg.gif"><table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="170">
                                          <tbody>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT1025" class="twoji" title="��������ʽ����">��������ʽ����</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_03.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT0855" class="twoji" title="3M ��Ļ�����������װ">3M ��Ļ�����������װ</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT0856" class="twoji" title="3M �ɵ��ڱʼǱ�����-��ʽ">3M �ɵ��ڱʼǱ�����-��ʽ</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0235" class="twoji" title="�������ص�Դ(���ؽ��������� 300W)">�������ص�Դ(���ؽ���..</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT0794" class="twoji" title="3M ˼������(������Ļ)IT��װ">3M ˼������(������Ļ)IT..</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0010" class="twoji" title="������ȫ��ͨ����������">������ȫ��ͨ����������</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0236" class="twoji" title="�������ص�Դ(���ؽ��������� 150W�¿�)">�������ص�Դ(���ؽ���..</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0402" class="twoji" title="3Mˬ�������+3M˼������(���)">3Mˬ�������+3M˼������..</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0013" class="twoji" title="������ʼǱ�USB2.0 2��PCMCIA ���俨">������ʼǱ�USB2.0 2��P..</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0357" class="twoji" title="������ʼǱ����Ա����ڵ���(14��)">������ʼǱ����Ա����ڵ�..</a></td>
                                            </tr>
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td><img src="images/paihang_up.gif" height="17" width="196"></td>
                                    </tr>
                                    <tr>
                                      <td height="5"></td>
                                    </tr>
                                    <tr>
                                      <td><a title="�̳���ļУ԰����𱬽����У�����ҵ�ļ��飡" target="_blank" href="http://www.thinkshop.cn/sales/campus"><img src="images/fcthink2.gif" border="0" height="66" width="194"></a></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="35" valign="center"><img src="images/pingpai_new.gif" usemap="#FPMap_brand" border="0" height="31" width="100%"></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td width="100%"><!--�ײ�INC-->
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td class="white" target="_blank" align="center" bgcolor="#383eb6" height="25"><a href="http://www.thinkshop.cn/extend.php#%C9%CC%B3%C7%B6%A8%CE%BB" class="white" target="_blank">�̳Ƕ�λ</a> | <a href="http://www.thinkshop.cn/extend.php#%BB%E1%D4%B1%D3%C5%BB%DD" class="white" target="_blank"><font color="#ffffff">��Ա�Ż�</font></a> | <a href="http://www.thinkshop.cn/extend.php#%B6%A9%B5%A5%B4%A6%C0%ED%B9%FD%B3%CC" class="white" target="_blank">��������</a> | <a href="http://www.thinkshop.cn/extend.php#%D3%D0%B9%D8%BB%FD%B7%D6%B6%D2%BB%BB" class="white" target="_blank">���ֶһ�</a> | <a href="http://www.thinkshop.cn/extend.php#%B3%A3%BC%FB%CE%CA%CC%E2" class="white" target="_blank">��������</a> | <a href="http://www.thinkshop.cn/extend.php#%D0%D1%BF%CD%C0%F1%C8%AF" class="white" target="_blank">��ȯ</a> | <a href="http://www.thinkshop.cn/extend.php#%B9%BA%C2%F2%B7%BD%CA%BD" class="white" target="_blank">����ʽ</a> | <a href="http://www.thinkshop.cn/extend.php#%BC%DB%B8%F1%CB%B5%C3%F7" class="white" target="_blank">�۸�˵��</a> | <a href="http://www.thinkshop.cn/extend.php#%B8%B6%BF%EE%B7%BD%CA%BD" class="white" target="_blank">���ʽ</a> | <a href="http://www.thinkshop.cn/extend.php#%C5%E4%CB%CD%B7%BD%CA%BD%D3%EB%B7%D1%D3%C3" class="white" target="_blank">���ͷ���</a> | <a href="http://www.thinkshop.cn/extend.php#%B1%A3%D0%DE%D3%EB%CD%CB%BB%BB" class="white" target="_blank">�����˻�</a> | <a href="http://www.allsmart.com.cn/ThinkPad/bbs/upload/forumdisplay.php?fid=40" class="white" target="_blank">�ͷ�ר��</a> | <a href="http://www.thinkshop.cn/searchlist.htm" class="white" target="_blank">�������</a> | <a href="http://www.allsmart.com/about_me/about_9.htm" class="white" target="_blank">������ʿ</a> <span class="white">| <a href="http://www.allsmart.com/about_me/about_10.htm" class="white" target="_blank">��������</a></span></td>
            </tr>
            <tr>
              <td align="center" height="5"><img src="images/line.gif" height="1" width="1"></td>
            </tr>
            <tr>
              <td align="center"><table style="border-collapse: collapse; font-size: 9pt;" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="50" height="38" align="left"><a href="http://www.ebworld.com.cn/html/2006-12-11/2006121183850.asp" target="_blank"><img src="images/2006-TOP100.gif" alt="�ڶ�����������ϲ������վTOP100" border="0" height="43" width="44"></a></td>
                      <td><p align="left"><a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202006053100022" target="_blank"><img src="images/biaoshi.gif" border="0" height="35" width="28"></a></p></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<script src="images/addnum.htm"></script>
</body>
</html>
