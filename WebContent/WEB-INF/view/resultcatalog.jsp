<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<style>
	.tbl-r03 p {
	  font-size: 16px;
	  font-weight: bold;
	  text-align: center;
	  margin: 60px auto 40px;
	}
	.tbl-r03 th {
	  background: #e9727e;
	  border: solid 1px #ccc;
	  color: #fff;
	  padding: 10px;
	}
	.tbl-r03 td {
	  border: solid 1px #ccc;
	  padding: 10px;
	}
	//PCのデフォルトスタイルは割愛します
	.tbl-r03 td:first-child {
	  background: #fbf5f5;
	}
	@media screen and (max-width: 640px) {
	  .tbl-r03 {
	    width: 80%;
	  }
	  .tbl-r03 .thead {
	    display: none;
	  }
	  .tbl-r03 tr {
	    width: 100%;
	  }
	  .tbl-r03 td {
	    display: block;
	    text-align: right;
	    width: 100%;
	  }
	  .tbl-r03 td:first-child {
	    background: #e9727e;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	  }
	  .tbl-r03 td:before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    margin-right: 10px;
	  }
	}

</style>
   詳細を見たい商品の商品番号をクリックしてください。(resultcatalog.jsp)

   <TABLE class="tbl-r03" width="100%">
   	<thead>
     <TR class="thead" >
      <th></th>
      <TH><FONT color=#ffffff>番号</FONT></TH>
      <TH><FONT color=#ffffff>商品名</FONT></TH>
      <TH><FONT color=#ffffff>価格</FONT></TH>
     </TR>
    </thead>
     <logic:iterate id="product" name="products" type="model.Product" offset="<%=(String)request.getAttribute(\"offset\") %>" length="10" indexId="count" >
     <tbody>
      <!-- カタログらしく、色を変える -->
      <TR >
       <td></td>
       <TD data-label="番号" ><html:link action="/CatalogDetail" paramId="id" paramName="product" paramProperty="id" ><bean:write name="product" property="id" /></html:link></TD>
       <TD data-label="商品名"><bean:write name="product" property="name" /></TD>
       <TD data-label="価格"><bean:write name="product" property="price" />円</TD>
      </TR>
    </tbody>
     </logic:iterate>
     <tbody>
   <TR >
   <TD colspan="4" >
   <html:form action="/CatalogPage" >
     <logic:greaterThan name="offset" value="0">
      <html:submit property="action" >
       <bean:message key="back" />
      </html:submit>
     </logic:greaterThan>
     <logic:lessThan name="offset" value="<%=Integer.toString(((java.util.List)session.getAttribute(\"products\")).size() -10) %>" >
     <html:submit property="action" >
      <bean:message key="next" />
     </html:submit>
    </logic:lessThan>
    <html:hidden property="offset" value="<%=(String)request.getAttribute(\"offset\") %>" />
   </html:form>
   </TD>
   </TR>
   </TABLE>
<%-- <html:form action="/MoveModule1">
	<html:submit value="module1へ"/>
</html:form> --%>
