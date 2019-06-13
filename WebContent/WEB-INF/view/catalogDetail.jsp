<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<script>
	$(window).load(function() {
		$('#inline_content img').attr('src',$('a.inline_box.cboxElement img')[0].currentSrc);
	});
	$(function() {
		$(".inline_box").colorbox({
			inline: true,
			opacity:0.8
		});
	});
</script>
<style>
	.tbl-r04{
       margin: 0;
       padding: 0;
	}
	.tbl-r04 p {
	  font-size: 16px;
	  font-weight: bold;
	  text-align: center;
	  margin: 60px auto 40px;
	}
	.tbl-r04 th {
	  background: #e9727e;
	  border: solid 1px #ccc;
	  color: #fff;
	  padding: 10px;
	}
	.tbl-r04 td {
	  border: solid 1px #ccc;
	  padding: 10px;
	}
	//PCのデフォルトスタイルは割愛します
	.tbl-r04 td:first-child {
	  background: #fbf5f5;
	}
	@media screen and (max-width: 640px) {
	  .tbl-r04 {
	    width: 80%;
	  }
	  .tbl-r04 .thead {
	    display: none;
	  }
	  .tbl-r04 tr {
	    width: 100%;
	  }
	  .tbl-r04 td {
	    display: block;
	    text-align: right;
	    width: 100%;
	  }
	  .tbl-r04 td:first-child {
	    background: #e9727e;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	  }
	  .tbl-r04 td:before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    margin-right: 10px;
	  }
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
  <TABLE class="tbl-r04" border="0" width="100%" height="200" align="center">
     <TR class="thead" valigh="top">
      <TH height="20"><FONT color=#ffffff>番号</FONT></TH>
      <TH height="20"><FONT color=#ffffff>商品名</FONT></TH>
      <TH height="20"><FONT color=#ffffff>価格</FONT></TH>
     </TR>
      <TR>
       <TD height="20" width="40"><bean:write name="product" property="id" /></TD>
       <TD height="20" width="290" ><bean:write name="product" property="name" /></TD>
       <TD height="20" width="70" align="right"><bean:write name="product" property="price" /></TD>
      </TR>
      <TR width="400" height="160" >
       <bean:define id="url" >
        <bean:write name="product" property="pictureUrl" />
       </bean:define>
       <TD colspan="3" >
	       <a href="#inline_content" class="inline_box">
	       	<html:img width="100%" page="<%= url %>" />
	       </a>
       </TD>
      </TR>
   </TABLE>
   <html:form action="/members/AddCart">
    <bean:define id="pId" >
     <bean:write name="product" property="id" />
    </bean:define>
    <html:hidden property="id" value="<%= pId %>" />
    <html:image pageKey="addcart.image" />この商品をカートに入れる。
   </html:form>

<div style="display:none">
    <div id="inline_content">
        <p><img id="cbimg" src="" width="100%"></p>
    </div>
</div>