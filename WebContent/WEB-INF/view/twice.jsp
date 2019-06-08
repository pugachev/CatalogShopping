<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<TABLE width="400" border="0" >
 <TR align="left" >
  <TD>
<bean:write name="login" property="name" />さん<BR>
2度続けてボタンがおされたようなので、1回だけお買い上げいただくように処理しました。<BR>
もう一度同じ内容でお買い物される際はお手数ですが、商品をカートに入れていただいて
処理してください。<BR>

お買いあげありがとうございました。
  </TD>
 </TR>
</TABLE>
