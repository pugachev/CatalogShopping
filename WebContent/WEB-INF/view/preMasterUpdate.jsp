<%@page contentType="text/html; charset=utf-8" %>
<%@page import="dao.MemberDAO" %>
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
/* 	MemberDAO dao = new MemberDAO();
	boolean result = dao.isEntriedMail("ayako@gmail.com");
	if(result)
	{
		System.out.println("存在するユーザー様です");
	}
	else
	{
		System.out.println("このメールアドレスは登録されていません");
	} */
%>
<h2>これはTaglibのテストです</h2>
<h3>※本日の日付は、<my:MyTag name="Foo"/>です。</h3>
