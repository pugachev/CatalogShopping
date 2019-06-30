<%@page contentType="text/html; charset=utf-8" %>
<%@page import="dao.MemberDAO" %>
<%@page import="dao.ShoppingDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.List" %>
<%@page import="model.Member" %>
<%@page import="model.Product" %>
<%@ page import="org.apache.log4j.Level" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.Enumeration" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%! int rcvTotalfee=0; %>
<%

 	ShoppingDAO dao = new ShoppingDAO();
	Member mem = (Member)request.getSession().getAttribute("login");
	if(mem!=null)
	{
		rcvTotalfee = dao.searchTotalFee(mem.getMail());
	}
	String imgsrc="'"+"none"+"'";
	if(rcvTotalfee>30000)
	{
		imgsrc="'"+"/CatalogShopping/img/gold.png"+"'";
	}
	else if(rcvTotalfee>20000)
	{
		imgsrc="'"+"/CatalogShopping/img/silver.png"+"'";
	}
	else if(rcvTotalfee>10000)
	{
		imgsrc="'"+"/CatalogShopping/img/copper.png"+"'";
	}
	System.out.println("rcvTotalfee=" + rcvTotalfee);

	List<Product> mProduct = (java.util.List)request.getSession().getAttribute("products2");
	System.out.println("module1 preCatalog.jsp "+mProduct.get(0).getName());

%>
<script>


$(function() {
	var tmpfee = <%= rcvTotalfee %>;
	var imgsrc = <%= imgsrc %>;
	if(tmpfee>0)
	{
		$('#totalfee').text("本日のお買い物 合計金額は "+ Number(tmpfee).toLocaleString() + "円です");
		var imgsrc = <%= imgsrc %>;
		$('#rankimg').attr('src',imgsrc);
	}
	else
	{
		$('#rankimg').css('display' , 'none');
	}
});
</script>

<%-- <h2>これはTaglibのテストです</h2>
<h3>※本日の日付は、<my:MyTag name="Foo"/>です。</h3> --%>
<%-- <h3>お客様の本日のお買い物合計[ <fmt:formatNumber value="<%= rcvTotalfee %>" pattern="###,###" /> ]円</h3> --%>
<%-- <h3>お客様の本日のお買い物合計[ <fmt:formatNumber value="<my:MyTag name=\"baba@gmail.com\"/>" pattern="###,###" /> ]円</h3> --%>
<%-- <h3 style="text-align: center;">お客様の本日のお買い物合計[ <my:MyTag name="baba@gmail.com"/> ]円</h3> --%>
