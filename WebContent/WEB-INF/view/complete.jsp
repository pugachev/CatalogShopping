<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<TABLE width="400" border="0" >
 <TR align="left" >
  <TD>
  <bean:write name="MemberEntryForm" property="name" />さん<BR>
  ご登録ありがとうございました。
  </TD>
 </TR>
</TABLE>