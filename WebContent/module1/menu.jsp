<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<TABLE id="searchtable" bgColor="0x7f55f1" border="0" width="250" >
  <TBODY>
          <TR>
            <TD ><html:link action="/Catalog2" >カタログ</html:link></TD>
          </TR>
			<logic:notPresent name="admin">
			    <TR>
			     <TD ><html:link action="/members/Cart" >購入予定一覧</html:link></TD>
			    </TR>
			</logic:notPresent>
			 <logic:present name="login">
			    <TR>
			        <TD><html:link action="/members/LogOut" >ログアウト</html:link></TD>
			    </TR>
			</logic:present>
			<logic:notPresent name="login">
			    <TR>
			         <TD ><html:link action="/members/Login" >ログイン</html:link></TD>
			    </TR>
			    <TR>
			         <TD ><html:link action="/MemberEntryShow" >会員登録</html:link></TD>
			    </TR>
			</logic:notPresent>
			<logic:present name="admin">
			    <TR>
			        <TD><html:link action="/admin/MasterMain" >マスタ管理</html:link></TD>
			     </TR>
			</logic:present>
  </TBODY>
</TABLE>