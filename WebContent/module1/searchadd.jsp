<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
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
//モジュールパターンで実装する。
YAHOO.namespace("EGP");

YAHOO.EGP.BasicTree = function() {
	var tree;
	// Tree NOdeをオブジェクトリテラルの階層で表現
	var treeNodes= [
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
        ];

    var buildTextNodeTree = function() {

    //treeのインスタンス化
    tree = new YAHOO.widget.TreeView("treeDiv1",treeNodes);
    tree.subscribe("expand", function(node) {alert("[index: "+node.index + ", label: " + node.label + "] was expanded");
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
</script>
</head>
<body >
<div id="container">
<p>
階層化されたオブジェクト定義から生成されるTreeです。
</p>
<div id="treeDiv1">
</div>
</body>