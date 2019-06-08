<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<HTML>
	<head>
		<script src="${pageContext.request.contextPath}/js/jquery-2.2.4.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.colorbox-min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
	</head>
  <BODY>
    <TABLE width="800" border="0">
      <TR>
        <TD width="800" align="center">
          <tiles:insert attribute="header"/>
        </TD>
      </TR>
      <TR height="20" widht="800" >
       <TD>
          <tiles:insert attribute="login"/>
       </TD>
      <TR>
      <TR>
        <TD valign="top" width="150" >
          <tiles:insert attribute="menu"/>
        </TD>
        <TD align="left" width="400" valign="top" >
          <tiles:insert attribute="main"/>
        </TD>
        <TD width="250" valign="top">
          <tiles:insert attribute="search"/>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>