<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<style>
	.tbl-r06{
       margin: 0;
       padding: 0;
	}
	.tbl-r06 p {
	  font-size: 16px;
	  font-weight: bold;
	  text-align: center;
	  margin: 60px auto 40px;
	}
	.tbl-r06 th {
	  background: #e9727e;
	  border: solid 1px #ccc;
	  color: #fff;
	  padding: 10px;
	}
	.tbl-r06 td {
	  border: solid 1px #ccc;
	  padding: 10px;
	}
	//PCのデフォルトスタイルは割愛します
	.tbl-r06 td:first-child {
	  background: #fbf5f5;
	}
	@media screen and (max-width: 640px) {
	  .tbl-r06 {
	    width: 80%;
	  }
	  .tbl-r06 .thead {
	    display: none;
	  }
	  .tbl-r06 tr {
	    width: 100%;
	  }
	  .tbl-r06 td {
	    display: block;
	    text-align: right;
	    width: 100%;
	  }
	  .tbl-r06 td:first-child {
	    background: #e9727e;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	  }
	  .tbl-r06 td:before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    margin-right: 10px;
	  }
	}
</style>
購入内容、送付先をご確認ください。
<BR>

<TABLE border="0" class="tbl-r06" width="100%">
	<thead>
     <TR  class="thead" bgColor=#bb5a5a valigh="top">
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
       <TD><bean:write name="item" property="product.id" /></TD>
       <TD><bean:write name="item" property="product.name" /></TD>
       <TD><bean:write name="item" property="product.price" /></TD>
       <TD><bean:write name="item" property="count" /></TD>
       <TD align="right" ><bean:write name="item" property="sumPrice" /></TD>
     </logic:iterate>
     </TR>
     </tbody>
     <tbody>
     <TR bgColor=#ff7711>
      <TD colspan="4">合計</TD>
      <TD width="60" align="right"><bean:write name="cart" property="sumPrice" /></TD>
     </TR>
     </tbody>
 </TABLE>
<BR>
 以下の送付先にお送りします。<BR>
 <TABLE class="tbl-r06" width="100%">
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