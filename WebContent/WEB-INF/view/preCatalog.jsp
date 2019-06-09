<%@page contentType="text/html; charset=utf-8" %>
<%@page import="dao.MemberDAO" %>
<%@page import="dao.ShoppingDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%-- <%
 	ShoppingDAO dao = new ShoppingDAO();
	int rcvTotalfee = dao.searchTotalFee("baba@gmail.com");
	System.out.println("rcvTotalfee=" + rcvTotalfee);
%> --%>
<script>
<%-- $(function() {
	var tmpfee = <%= rcvTotalfee %>
	if(tmpfee!=null && tmpfee>0)
	{
		$('#totalfee').text("本日のお買い物 合計金額は "+ Number(tmpfee).toLocaleString() + "円です");
	}
}); --%>
</script>

<%-- <h2>これはTaglibのテストです</h2>
<h3>※本日の日付は、<my:MyTag name="Foo"/>です。</h3> --%>
<%-- <h3>お客様の本日のお買い物合計[ <fmt:formatNumber value="<%= rcvTotalfee %>" pattern="###,###" /> ]円</h3> --%>
<%-- <h3>お客様の本日のお買い物合計[ <fmt:formatNumber value="<my:MyTag name=\"baba@gmail.com\"/>" pattern="###,###" /> ]円</h3> --%>
<h3>お客様の本日のお買い物合計[ <my:MyTag name="baba@gmail.com"/> ]円</h3>