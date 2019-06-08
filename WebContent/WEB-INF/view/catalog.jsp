<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

   詳細を見たい商品の商品番号をクリックしてください。

   <TABLE width="400">
     <TR bgColor=#bb5a5a width="400">
      <TH><FONT color=#ffffff>番号</FONT></TH>
      <TH><FONT color=#ffffff>商品名</FONT></TH>
      <TH><FONT color=#ffffff>価格</FONT></TH>
     </TR>
     <logic:iterate id="product" name="products" type="model.Product" offset="<%=(String)request.getAttribute(\"offset\") %>" length="10" indexId="count" >
      <!-- カタログらしく、色を変える -->
      <TR bgColor=#fddddd width="400" >
       <TD align="center" width="40" ><html:link action="/CatalogDetail" paramId="id" paramName="product" paramProperty="id" ><bean:write name="product" property="id" /></html:link></TD>
       <TD width="290" ><bean:write name="product" property="name" /></TD>
       <TD align="right" width="70" ><bean:write name="product" property="price" />円</TD>
      </TR>
     </logic:iterate>
   <TR width="400">
   <TD colspan="3" >
   <html:form action="/CatalogPage" >
     <logic:greaterThan name="offset" value="0">
      <html:submit property="action" >
       <bean:message key="back" />
      </html:submit>
     </logic:greaterThan>
     <logic:lessThan name="offset" value="<%=Integer.toString(((java.util.List)session.getAttribute(\"products\")).size() -10) %>" >
     <html:submit property="action" >
      <bean:message key="next" />
     </html:submit>
    </logic:lessThan>
    <html:hidden property="offset" value="<%=(String)request.getAttribute(\"offset\") %>" />
   </html:form>
   </TD>
   </TR>
   </TABLE>

