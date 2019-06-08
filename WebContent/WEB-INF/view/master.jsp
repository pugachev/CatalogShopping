<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:link action="/admin/EntryShow" >商品の追加</html:link>
<TABLE width="800" border="1" >
 <TR align="left" >
  <TH>商品名</TH>
  <TH>商品説明</TH>
  <TH>価格</TH>
  <TH>商品写真URL</TH>
 </TR>
  
 </TR> 
  <html:form action="/admin/MasterChange" >
   <logic:iterate id="product" name="CatalogMainForm" property="allData" type="model.Product" >
    <html:hidden name="product" property="id" indexed="true" />
   <TR>
    <TD><html:text name="product" property="name" indexed="true" size="25"/></TD>
    <TD><html:text name="product" property="detail" indexed="true" size="60"/></TD>
    <TD><html:text name="product" property="price" indexed="true" size="6" /></TD>
    <TD><html:text name="product" property="pictureUrl" indexed="true" size="35"/></TD>
   </TR>               
   </logic:iterate>
   <TR>
    <TD>
    <html:submit value="変更" />
    </TD>
   </TR>
  </html:form>
 </TABLE>