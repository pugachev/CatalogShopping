<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Hello World</title>
</head>
<body>
<p>
module1トップ画面
</p>


<html:form action="/Module1Sample">
	<html:hidden property="val" value="nyannnyann"/>
	<html:submit value="送信!"/>
</html:form>

<%--
	module名を指定することができるらしい。
	とりあえず、空文字を指定すると、デフォルト（モジュール名がパス名にはいってない状態）の
	トップページへのリンクがこれで生成可能らしい。
--%>
<html:link module="" page="/index.jsp">TOPへ</html:link>
</body>
</html>