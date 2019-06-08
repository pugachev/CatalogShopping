<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<logic:notEqual name="cart" property="itemSize" value="0" >
  　購入予定のリストです。ご確認ください。

   <html:form action="/members/ChangeCount" >
   <TABLE border="0" >
    <TBODY>
     <TR width="400" bgColor=#bb5a5a valigh="top">
      <TH height="20"><FONT color=#ffffff>番号</FONT></TH>
      <TH height="20"><FONT color=#ffffff>商品名</FONT></TH>
      <TH height="20"><FONT color=#ffffff>価格</FONT></TH>
      <TH height="20"><FONT color=#ffffff>数量</FONT></TH>
      <TH height="20"><FONT color=#ffffff>小計</FONT></TH>
     </TR>
     <logic:iterate id="item" name="cart" property="items" type="model.CartItem">
      <TR bgColor=#fddddd>
       <TD width="30" ><bean:write name="item" property="product.id" /></TD>
       <TD width="210"><bean:write name="item" property="product.name" /></TD>
       <TD width="50" ><bean:write name="item" property="product.price" /></TD>
       
       <bean:define name="item" property="count" id="count" type="java.lang.Integer" toScope="request" />
       
       <!-- セッションの中のCartItemのCountとここの値を比較して変更する -->
       <TD width="50" ><html:text property="counts" value='<%= count.toString() %>' size="3" /></TD>
       <TD width="60" align="right" ><bean:write name="item" property="sumPrice" /></TD>
      </logic:iterate>
     </TR>
     <TR bgColor=#ff7711>
      <TD colspan="4" width="400" >合計</TD>
      <TD width="60" align="right"><bean:write name="cart" property="sumPrice" /></TD>
     </TR>
    </TBODY>
   </TABLE>
   <html:submit value="数量変更" />
   </html:form>
   <html:form action="/members/ConfirmCart" >
     数量変更は有効になりません。数量を変更してから購入ボタンを押してください。<BR>
    <html:submit value="購入する" />
   </html:form>
</logic:notEqual>
<logic:equal name="cart" property="itemSize" value="0" >
 <TABLE width="400" >
  <TR width="400" >
   <TD width="400">
    ショッピングカートには何も入っていません。カタログからほしい商品を選んでください。
   </TD>
  </TR>
 </TABLE>
</logic:equal>
