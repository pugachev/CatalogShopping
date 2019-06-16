<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Hello World</title>
<script>
	console.log('module1/index.jsp');
</script>
</head>
<body>
<p>
module1結果画面
</p>

<p>
	■自分で定義したActionクラスを介しページ遷移を行う場合
</p>
<html:form action="/Module1MoveTop">
	<html:submit value="module1へ"/>
</html:form>

<p>
	■ForwardActionを使用した画面遷移（違いはstruts-config-module1.xmlを見てください）。<br>
	(下でhtml:linkを使用しているのは特に理由はありません。html:linkでactionも指定できる・・・という例です)
</p>
<html:link action="/MoveTopPage" >トップへ</html:link>
</body>
</html>