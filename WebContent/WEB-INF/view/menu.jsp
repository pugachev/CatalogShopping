<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<TABLE border="0" cellpadding="0">
  <TBODY>
    <TR>
      <TD rowspan="2" width="8">
        <html:img page="/image/bar.gif" border="0" width="8" height="107" />
      </TD>
      <TD valign="top" width="102" height="19">
        <html:img page="/img/menu.gif" border="0" width="120" height="17" />
      </TD>
    </TR>
    <TR>
      <TD valign="top" height="89">
      <TABLE border="0" cellpadding="0">
        <TBODY>
          <TR>
            <TD width="132"><html:link action="/Catalog" >カタログ</html:link></TD>
          </TR>
<logic:notPresent name="admin">           
    <TR>
     <TD width="132"><html:link action="/members/Cart" >購入予定一覧</html:link></TD>
    </TR>
</logic:notPresent>
        
 <logic:present name="login">         
        <TR>
            <TD width="132"><html:link action="/members/LogOut" >ログアウト</html:link></TD>
          </TR>             
</logic:present>
<logic:notPresent name="login">          
    <TR>
            <TD width="132"><html:link action="/members/Login" >ログイン</html:link></TD>
          </TR>
          <TR>
            <TD width="132"><html:link action="/MemberEntryShow" >会員登録</html:link></TD>
          </TR>
</logic:notPresent>
 <logic:present name="admin">         
        <TR>
            <TD width="132"><html:link action="/admin/MasterMain" >マスタ管理</html:link></TD>
          </TR>             
</logic:present>          
  </TBODY>
</TABLE>