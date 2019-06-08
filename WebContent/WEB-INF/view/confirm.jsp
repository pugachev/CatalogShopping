<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

購入内容、送付先をご確認ください。
<BR>

<TABLE border="0" >
     <TR width="400" bgColor=#bb5a5a valigh="top">
      <TH height="20"><FONT color=#ffffff>番号</FONT></TH>
      <TH height="20"><FONT color=#ffffff>商品名</FONT></TH>
      <TH height="20"><FONT color=#ffffff>価格</FONT></TH>
      <TH height="20"><FONT color=#ffffff>数量</FONT></TH>
      <TH height="20"><FONT color=#ffffff>小計</FONT></TH>
     </TR>
     <logic:iterate id="item" name="cart" property="items" type="model.CartItem">
      <TR bgColor=#fddddd>
       <TD><bean:write name="item" property="product.id" /></TD>
       <TD><bean:write name="item" property="product.name" /></TD>
       <TD><bean:write name="item" property="product.price" /></TD>
       <TD><bean:write name="item" property="count" /></TD>
       <TD align="right" ><bean:write name="item" property="sumPrice" /></TD>
     </logic:iterate>
     </TR>
     <TR bgColor=#ff7711>
      <TD colspan="4">合計</TD>
      <TD width="60" align="right"><bean:write name="cart" property="sumPrice" /></TD>
     </TR>
 </TABLE>
<BR>
 以下の送付先にお送りします。<BR>
 <TABLE>
  <TR valigh="top">
     <TH bgColor="#559955" width="30" height="20" >住所</TH>
     <TD width="370" height="20" ><bean:write name="login" property="address" /></TD>
  </TR>
  <TR width="400" valigh="top">
   <TH bgColor="#559955" width="30" height="20" >氏名</TH>
   <TD width="370" height="20" ><bean:write name="login" property="name" /> 様</TD>
  </TR>  
  </TABLE>
 このボタンを押すと本当に購入します。よろしいでしょうか。<BR>
    <html:form action="/members/CommitCart" >
    <html:submit value="購入する" />
   </html:form>