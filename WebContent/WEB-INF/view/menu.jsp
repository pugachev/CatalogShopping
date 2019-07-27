<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<style>
@charset "utf-8";

#cboxMiddleLeft cboxContent content{
  background: #fff;
  border-color: #bbb;
}
/* @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700); */
.login {
  width: 400px;
  margin: 16px auto;
  font-size: 16px;
}

/* Reset top and bottom margins from certain elements */
.login-header,
.login p {
  margin-top: 0;
  margin-bottom: 0;
}
.login-header {
  background: #28d;
  padding: 20px;
  font-size: 1.0em;
  font-weight: normal;
  text-align: center;
  text-transform: uppercase;
  color: #fff;
}

.login-container {
  background: #ffffffff;
  padding: 12px;
}

/* Every row inside .login-container is defined with p tags */
.login p {
  padding: 12px;
}

.login input {
  box-sizing: border-box;
  display: block;
  width: 100%;
  border-width: 1px;
  border-style: solid;
  padding: 16px;
  outline: 0;
  font-family: inherit;
  font-size: 0.95em;
}

.login input[type="id"],
.login input[type="password"] {
  background: #fff;
  border-color: #bbb;
  color: #555;
}

/* Text fields' focus effect */
.login input[type="id"]:focus,
.login input[type="password"]:focus {
  border-color: #888;
}

.login input[type="submit"] {
  background: #28d;
  border-color: transparent;
  color: #fff;
  cursor: pointer;
}

.login input[type="submit"]:hover {
  background: #17c;
}

/* Buttons' focus effect */
.login input[type="submit"]:focus {
  border-color: #05a;
}
</style>
<script>
$(window).load(function() {
	$('.login').colorbox({
		inline: true
	});
});
$(function() {

});
</script>
<TABLE id="searchtable" bgColor="0x7f55f1" border="0" width="250" >
  <TBODY>
          <TR>
            <TD ><html:link action="/Catalog" >カタログ</html:link></TD>
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
			         <%-- <TD ><html:link action="/members/Login" >ログイン</html:link></TD> --%>
			         <td><a href="#content" class="login">ログイン</a></td>
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

<!--モーダルで表示させる要素-->
<div style="display:none">
<div id="content" class="login">
  <h2 class="login-header">パスワード入力</h2>
  <form class="login-container">
    <p><input type="id" placeholder="ID"></p>
    <p><input type="password" placeholder="Password"></p>
    <p><input type="submit" value="Log in"></p>
  </form>
</div>
</div>