<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<style>
	.tbl-r05{
       margin: 0;
       padding: 0;
	}
	.tbl-r05 p {
	  font-size: 16px;
	  font-weight: bold;
	  text-align: center;
	  margin: 60px auto 40px;
	}
	.tbl-r05 th {
	  background: #e9727e;
	  border: solid 1px #ccc;
	  color: #fff;
	  padding: 10px;
	}
	.tbl-r05 td {
	  border: solid 1px #ccc;
	  padding: 10px;
	}
	//PCのデフォルトスタイルは割愛します
	.tbl-r05 td:first-child {
	  background: #fbf5f5;
	}
	@media screen and (max-width: 640px) {
	  .tbl-r05 {
	    width: 80%;
	  }
	  .tbl-r05 .thead {
	    display: none;
	  }
	  .tbl-r05 tr {
	    width: 100%;
	  }
	  .tbl-r05 td {
	    display: block;
	    text-align: right;
	    width: 100%;
	  }
	  .tbl-r05 td:first-child {
	    background: #e9727e;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	  }
	  .tbl-r05 td:before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    margin-right: 10px;
	  }
	}
</style>
<logic:notEqual name="cart" property="itemSize" value="0" >
   購入予定のリストです。ご確認ください。

   <html:form action="/members/ChangeCount" >
   <TABLE border="0" class="tbl-r05" width="100%">
   <thead>
     <TR class="thead" >
      <TH height="20"><FONT color=#ffffff>番号</FONT></TH>
      <TH height="20"><FONT color=#ffffff>商品名</FONT></TH>
      <TH height="20"><FONT color=#ffffff>価格</FONT></TH>
      <TH height="20"><FONT color=#ffffff>数量</FONT></TH>
      <TH height="20"><FONT color=#ffffff>小計</FONT></TH>
     </TR>
     </thead>
     <logic:iterate id="item" name="cart" property="items" type="model.CartItem">
     <tbody>
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
     <TR bgColor=#ff7711 width="100%" >
      <TD colspan="4" >合計</TD>
      <TD align="right"><bean:write name="cart" property="sumPrice" /></TD>
     </TR>
    <tbody>
   </TABLE>
   <html:submit value="数量変更" />
   </html:form>
   <html:form action="/members/ConfirmCart" >
     数量変更は有効になりません。数量を変更してから購入ボタンを押してください。<BR>
    <html:submit value="購入する" />
   </html:form>
</logic:notEqual>
<logic:equal name="cart" property="itemSize" value="0" >
 <TABLE width="100%" >
  <TR >
   <TD>
    ショッピングカートには何も入っていません。カタログからほしい商品を選んでください。
   </TD>
  </TR>
 </TABLE>
</logic:equal>
