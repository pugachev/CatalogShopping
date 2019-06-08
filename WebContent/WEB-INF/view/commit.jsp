<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<TABLE width="400" >
 <TR width="400" >
  <TD width="400">
   <bean:write name="login" property="name" />さんご購入ありがとうございました。
  </TD>
 </TR>
</TABLE>