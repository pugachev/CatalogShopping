<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<TABLE width="250" bgColor="0xffffe0" border="0">
 <TR valign="top">
  <TH>
   品物の検索(module1)
   <html:form action="/KeywordSearch" >
    <html:text property="keyword" />
    <html:submit value="検索" />
   </html:form>
  </TH>
 </TR>
</TABLE>