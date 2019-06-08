<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<title>カート情報</title>
</head>
<body>
  <tiles:insert page="no_search_template.jsp" flush="true">
     <tiles:put name="header" value="header.jsp"/>
     <tiles:put name="main" value="cart.jsp"/>
  </tiles:insert>
</body>
</html>