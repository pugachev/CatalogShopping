<%@page contentType="text/html; charset=utf-8" %>
<%@page import="dao.MemberDAO" %>
<%@page import="dao.ShoppingDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<script>
$(function() {
	console.log('Hello World3');
});
</script>
<%
 	ShoppingDAO dao = new ShoppingDAO();
	int rcvTotalfee = dao.searchTotalFee("baba@gmail.com");

%>
<%-- <h2>これはTaglibのテストです</h2>
<h3>※本日の日付は、<my:MyTag name="Foo"/>です。</h3> --%>
<h3>お客様の本日のお買い物合計は<%= rcvTotalfee %></h3>
