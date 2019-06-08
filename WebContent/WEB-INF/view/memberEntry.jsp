<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

  <html:errors />
   <html:form action="/MemberEntry">
   <TABLE width="400">
    <TR width="400">
     <TD>氏名</TD>
     <TD><html:text property="name" /></TD>
    </TR>
    <TR>
     <TD >メールアドレス</TD>
     <TD><html:text property="mail" /></TD>
    </TR>
    <TR>
     <TD>パスワード(今回の例ではMD5で暗号化しています)</TD>
     <TD><html:password property="password" redisplay="false" /></TD>
    </TR>
    <TR>
     <TD>住所</TD>
     <TD><html:text property="address" /></TD>
    </TR>
    <TR>
     <TD>電話番号</TD>
     <TD><html:text property="tel" /></TD>
    </TR>
    <TR>
     <TD>生年月日（YYYY-MM-DDでお願いします。 1980-03-02)</TD>
     <TD><html:text property="birth" /></TD>
    </TR>
    <TR>
     <TD>
      <html:submit value="登録" />
     </TD>
    </TR>
   </TABLE>
  </html:form>
