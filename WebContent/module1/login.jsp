<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<div style="text-align: center;">
<logic:present name="login">
	<bean:write name="login" property="name" />さん、ようこそ。買い物を楽しんでください
	<img id="rankimg" src='' alt='' style="width:24px;height:24px;vertical-align:middle;"><span style="vertical-align:middle;" id="totalfee"></span>
</logic:present>

<logic:notPresent name="login">
    ゲストさん、ようこそ。<html:link action="/members/Login" >ここから</html:link>ログインしてください。
</logic:notPresent>
</div>