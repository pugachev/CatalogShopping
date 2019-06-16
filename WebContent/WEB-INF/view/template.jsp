<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<HTML>
	<head>
		<script src="${pageContext.request.contextPath}/js/jquery-2.2.4.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.colorbox-min.js"></script>
	<style>
.header {

}
.wrapper {
     float: left;
     margin: 0;
     width: 100%;
     margin-right: -260px;
}

.content {
     float: right;
     width: 100%;
     margin-left: -260px;
}

.content_main {
     position: relative;
     margin: 0 250px 0 250px;
}

.l_sidebar {
     float: left;
     width: 250px;
}
.r_sidebar {
     float: right;
     width: 250px;
}

.footer {
     clear: both;
}

@media (max-width: 1280px) {
     .wrapper, .content, .content_main, .r_sidebar {
          float: none;
          margin: 0;
          width: auto;
     }
}

@media (max-width: 800px) {
     .wrapper, .content, .content_main, .l_sidebar {
          float: none;
          margin: 0;
          width: auto;
     }
     .r_sidebar {
          display: none;
     }
}
	</style>
	</head>
  <BODY>
<header class="header">
	 <tiles:insert attribute="preprocess"/>
     <tiles:insert attribute="header"/>
</header><!-- header class="header" -->

<div class="wrapper">
<div class="content">

<div class="l_sidebar">
	<tiles:insert attribute="menu"/>
	<%-- <tiles:insert attribute="search"/> --%>
	<!-- <p>ここはメニューです</p> -->
</div><!-- div class="l_sidebar" -->

<div class="content_main">
	<tiles:insert attribute="login"/>
	<tiles:insert attribute="main"/>
</div><!-- div class="content_main" -->

</div><!-- div class="content" -->

</div><!-- div class="wrapper" -->

<div class="r_sidebar">
	<tiles:insert attribute="search"/>
</div><!-- div class="r_sidebar" -->


<footer class="footer" style="background-color:0x7f55f1;">
	<div id="footer2">
	 <center><p class="right">present by Layout Gallery. Copyright © Your Site Name. All rights reserved.</p></center>
	</div>
</footer><!-- footer class="footer" -->
	</body>
</html>










