<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

  <TABLE border="0" width="400" height="200" >
     <TR width="400" bgColor=#bb5a5a valigh="top">
      <TH height="20"><FONT color=#ffffff>番号</FONT></TH>
      <TH height="20"><FONT color=#ffffff>商品名</FONT></TH>
      <TH height="20"><FONT color=#ffffff>価格</FONT></TH>
     </TR>
      <TR bgColor=#fddddd>
       <TD height="20" width="40"><bean:write name="product" property="id" /></TD>
       <TD height="20" width="290" ><bean:write name="product" property="name" /></TD>
       <TD height="20" width="70" align="right"><bean:write name="product" property="price" /></TD>
      </TR>
      <TR width="400" height="160" >
       <bean:define id="url" >
        <bean:write name="product" property="pictureUrl" />
       </bean:define>      
       <TD colspan="3" ><html:img page="<%= url %>" /></TD>
      </TR>
   </TABLE>
   <html:form action="/members/AddCart">
    <bean:define id="pId" >
     <bean:write name="product" property="id" />
    </bean:define>
    <html:hidden property="id" value="<%= pId %>" />
    <html:image pageKey="addcart.image" />この商品をカートに入れる。
   </html:form>