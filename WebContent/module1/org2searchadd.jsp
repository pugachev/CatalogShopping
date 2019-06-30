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

<%
	//親ノード(ここは固定)
	JSONObject parentData = new JSONObject();
	parentData.accumulate("type", "text");
	parentData.accumulate("label", "商品一覧");

	CatalogDAO dao = new CatalogDAO();

	int childCnt = dao.getConutDispgropu();

	Product pdct = dao.getDaihyouDataDispgroup("A");
	System.out.println(" >>> "+pdct.getName() + " " + pdct.getPrice() + " " + pdct.getDaihyou() + " " + pdct.getDispgroup());

	List<Product> pdctList = dao.getProductListByGroup("B");
	for(int i=0;i<pdctList.size();i++)
	{
		Product ptmp = pdctList.get(i);
		System.out.println(" [" + i + "]=" + ptmp.getName() + " " + ptmp.getPrice() + " " + ptmp.getDaihyou() + " " + ptmp.getDispgroup());
	}

	String tmpgroup = dao.getDispgroup();
	String[] testgroup = tmpgroup.split(",");
	for(int j=0;j<testgroup.length;j++)
	{
		System.out.println(" >>> " + testgroup[j] + " <<< ");
	}


	//子ノードを作成していく
	for(int i=0;i<childCnt;i++)
	{
		//子ノードで代表フラグをもつデータを取得する
		/* Catalog rcvDaihyou = dao. */
		JSONObject childData1 = new JSONObject();
		childData1.accumulate("type", "text");
		childData1.accumulate("label", "本マグロ");
		//子ノード1の持つ配列
		List<String> mchilddata1 = new ArrayList<String>();
		mchilddata1.add("本マグロ　赤身100g");
		mchilddata1.add("本マグロ　中トロ100g");
		childData1.accumulate("children", mchilddata1);
	}

	//子ノード1
	JSONObject childData1 = new JSONObject();
	childData1.accumulate("type", "text");
	childData1.accumulate("label", "本マグロ");
	//子ノード1の持つ配列
	List<String> mchilddata1 = new ArrayList<String>();
	mchilddata1.add("本マグロ　赤身100g");
	mchilddata1.add("本マグロ　中トロ100g");
	childData1.accumulate("children", mchilddata1);

	//子ノード2
	JSONObject childData2 = new JSONObject();
	childData2.accumulate("type", "text");
	childData2.accumulate("label", "車えび");
	//子ノード2の持つ配列
	List<String> mchilddata2 = new ArrayList<String>();
	mchilddata2.add("車えび　500g");
	mchilddata2.add("車えび　1kg");
	childData2.accumulate("children", mchilddata2);

	//子ノード3
	JSONObject childData3 = new JSONObject();
	childData3.accumulate("type", "text");
	childData3.accumulate("label", "松坂牛");
	//子ノード3の持つ配列
	List<String> mchilddata3 = new ArrayList<String>();
	mchilddata3.add("松坂牛　サーロイン200g");
	mchilddata3.add("松坂牛　リブロース200g");
	childData3.accumulate("children", mchilddata2);


/* 	//子ノード
	JSONObject childData = new JSONObject();
	//追加用の一時ノード
	List<JSONObject> tmp = new ArrayList<JSONObject>();
	//子ノード1を追加
	tmp.add(childData1);
	//子ノード2を追加
	tmp.add(childData2);
	//子ノード3を追加
	tmp.add(childData3);
	//子ノードに子ノード1と子ノード2を追加
	childData.accumulate("children", tmp); */

	//親ノードに子ノード追加
	parentData.accumulate("children",childData1);
	parentData.accumulate("children",childData2);
	parentData.accumulate("children",childData3);

	String tmpdata = "[" + parentData.toString() + "]";
	/* [{\"type\":\"text\",\"label\":\"List 0\",\"children\":[{\"type\":\"text\",\"label\":\"item 0-0\",\"children\":[\"item 0-0-0\",\"item 0-0-1\"]},{\"type\":\"text\",\"label\":\"item 0-1\",\"children\":[\"item 0-1-0\",\"item 0-1-1\"]}]}]"; */
	/* [{"type":"text","label":"商品一覧","children":{"children":[{"type":"text","label":"本マグロ","children":["本マグロ　赤身100g","本マグロ　中トロ100g"]},{"type":"text","label":"車えび","children":["車えび　500g","車えび　1kg",["車えび　500g","車えび　1kg","松坂牛　サーロイン200g","松坂牛　リブロース200g"]]},{"type":"text","label":"松坂牛"}]}}] */
	/* [{"type":"text","label":"商品一覧","children":[{"type":"text","label":"\"本マグロ\""},{"type":"text","label":"\"車えび\""},{"type":"text","label":"\"松坂牛\""}]}] */
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