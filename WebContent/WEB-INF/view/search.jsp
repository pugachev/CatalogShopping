<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<TABLE width="250" bgColor="0x7f55f1" >
 <TR valign="top" width="250">
  <TH>
   品物の検索はこちらからどうぞ
   <html:form action="/KeywordSearch" >
    <html:text property="keyword" />
    <html:submit value="検索" />
   </html:form>
  </TH>
 </TR>
</TABLE>