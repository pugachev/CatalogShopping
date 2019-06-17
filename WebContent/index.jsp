<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="util.ReadProperties" %>
<%
	String tmp1 = ReadProperties.getProperty("targeturl");
	String tmp = "'"+"0; url=/CatalogShopping/"+tmp1+".do" + "'";
	System.out.println("tmp=" + tmp);
%>
<!DOCTYPE html>
<HTML>
  <HEAD>
   <META http-equiv="refresh" content=<%= tmp %>>
  </HEAD>
  <BODY>
  </BODY>
</HTML>