<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<TABLE border="1" width="400">
 <html:form action="/admin/EntryProduct" enctype="multipart/form-data">
 <TR align="left" >
  <TH>商品名</TH>
  <TD><html:text property="name" size="25"/></TD> 
 </TR>
 <TR align="left" >
  <TH>商品説明</TH>
  <TD><html:text property="detail" size="60"/></TD>  
 </TR>
   <TR>
    <TH>価格</TH>
    <TD><html:text property="price" size="6" /></TD>
   </TR>
   <TR> 
    <TH>商品写真URL(サーバにある写真を利用する場合)</TH> 
    <TD><html:text property="pictureUrl" size="35"/></TD>
   </TR>
   <TR>
    <TH>商品写真</TH>
    <!-- 1)商品写真をアップロードする --> 
    <TD><html:file property="upload" /></TD>
   </TR> 
                  
   <TR>
    <TD>
    <html:submit value="登録" />
    </TD>
   </TR>
  </html:form>
 </TABLE>
 


  