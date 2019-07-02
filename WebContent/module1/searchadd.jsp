<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="java.util.*" %>
<%@page import="net.sf.json.JSONObject" %>
<%@page import="dao.CatalogDAO" %>
<%@page import="java.sql.*" %>
<%@page import="model.Product" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.IOException" %>
<%@page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="util.IniFileParser" %>
<%@page import="java.io.InputStream" %>
<%@page import="util.CookieTest" %>

<%


	InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("sample.ini");
	IniFileParser iniParser = IniFileParser.read(in);
	ObjectMapper mapper = new ObjectMapper();
	JsonNode node = mapper.readTree(iniParser.toJson());

	String tmp="";

	//親ノード(ここは固定)
	JSONObject parentData = new JSONObject();
	parentData.accumulate("type", "text");
	parentData.accumulate("label", "商品一覧");


    for(int i=0;i<iniParser.getEntry("child").size();i++)
	{
        JSONObject childData = new JSONObject();
        List<String> mchilddata = new ArrayList<String>();

		childData.accumulate("type", "text");
		childData.accumulate("label", iniParser.getEntry("child").get(i).getValue().toString().replaceAll("\"", ""));

		for(int j=0;j<iniParser.getEntry(iniParser.getEntry("child").get(i).getKey().toString().replaceAll("\"", "")).size();j++)
		{
			mchilddata.add(iniParser.getEntry(iniParser.getEntry("child").get(i).getKey().toString().replaceAll("\"", "")).get(j).getValue());
		}
		childData.accumulate("children", mchilddata);
		parentData.accumulate("children",childData);
	}




	String tmpdata = "[" + parentData.toString() + "]";

	System.out.println(tmpdata);

%>

<head>
<!-- Required CSS -->
<link type="text/css" rel="stylesheet" href="http://yui.yahooapis.com/2.9.0/build/treeview/assets/skins/sam/treeview.css">
<!-- Optional CSS for for date editing with Calendar-->
<link type="text/css" rel="stylesheet" href="http://yui.yahooapis.com/2.9.0/build/calendar/assets/skins/sam/calendar.css">

<!-- Dependency source file -->
<script src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js" ></script>
<!-- Optional dependency source file -->
<script src="http://yui.yahooapis.com/2.9.0/build/animation/animation-min.js" type="text/javascript"></script>
<!-- Optional dependency source file for date editing with Calendar-->
<script src="http://yui.yahooapis.com/2.9.0/build/calendar/calendar-min.js" ></script>
<!-- Optional dependency source file to decode contents of yuiConfig markup attribute-->
<script src="http://yui.yahooapis.com/2.9.0/build/json/json-min.js" ></script>

<!-- TreeView source file -->
<script src="http://yui.yahooapis.com/2.9.0/build/treeview/treeview-min.js" ></script>
<script>

var cookies_get='';

//モジュールパターンで実装する。
YAHOO.namespace("EGP");

YAHOO.EGP.BasicTree = function() {
	var tree;
	// Tree NOdeをオブジェクトリテラルの階層で表現
/* 	var treeNodes= [
        	{type:"text", label:"List 0", children: [
                	 {type:"text", label:"List 0-0", children: [
                	               "item 0-0-0",
                	               "item 0-0-1"
                	  ]},
                	  {type:"text", label:"item 0-1", children: [
			       	               "item 0-1-0",
			    	               "item 0-1-1"
                	  ]}
            ]}
        ]; */
	var treeNodes=<%= tmpdata %>
    var buildTextNodeTree = function() {
	    //treeのインスタンス化
	    tree = new YAHOO.widget.TreeView("treeDiv1",treeNodes);
	    tree.subscribe("expand", function(node) {
	    tree.subscribe("labelClick", function(node) {
	        console.log(node.label);
	        var hostUrl= 'http://localhost:8080/CatalogShopping/Catalog2.do';
	        var param1 = node.label;
	        document.getElementById('parameter1').value=param1;
	        document.cookie= 'value="'+node.label+'"';
	        document.getElementById('senddata').click();

/* 	        $.ajax({
	            url: hostUrl,
	            type:'POST',
	            dataType: 'text',
	            data : {parameter1 : param1},
	            timeout:3000,
	        }).done(function(data) {
	                          alert("ok");
	        }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
	                         alert("error");
	        }) */


	    });

	    tree.setNodesProperty('propagateHighlightUp',true);
	    tree.setNodesProperty('propagateHighlightDown',true);
    });


	//treeの描画
        tree.draw();
    };

    return{
    	init: function() {
	    	//alert("start");
        	buildTextNodeTree();
    	}
    };

}();

//DOMが完全にloadされたら、サンプルを初期化する。
YAHOO.util.Event.onDOMReady(
	 //DomReadyイベントで発火するハンドラ
	YAHOO.EGP.BasicTree.init,
	//ハンドラに渡すオブジェクト（関数）
	YAHOO.EGP.BasicTree,
	//ハンドラは、上記のオブジェクトのスコープをもつ。
	true
);

YAHOO.util.Event.addListener(window, "load", function(){

	});

$(window).load(function() {
	cookies_get = document.cookie.split("=");
	console.log('cookies_get='+cookies_get[1]);


});

$(document).ready( function(){

});
</script>
</head>
<body >
<div id="container">
<p>
階層化されたオブジェクト定義から生成されるTreeです。
</p>

<form method="post" action="http://localhost:8080/CatalogShopping/Catalog2.do">
	<input type="hidden" id="parameter1" name="parameter1" value="">
	<!-- <input type="submit" id="senddata" name="senddata" value="送信" style="visibility:hidden;"> -->
	<input type="submit" id="senddata" name="senddata" value="送信" style="display:none;">
</form>
<div id="treeDiv1">
</div>
</body>