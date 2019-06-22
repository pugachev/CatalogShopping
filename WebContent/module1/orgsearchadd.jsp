<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<script>
$(function() {

  //セレクトボックスが切り替わったら発動
  $('select').change(function() {
    //選択したvalue値を変数に格納
    var val = $(this).val();
    //選択したvalue値をp要素に出力
    $('input:hidden[name="keyword"]').val(val);
  });
});
</script>
<TABLE width="250" bgColor="0xffffe0" border="0">
 <TR valign="top">
  <TH>
   品物の検索(module1)
  </TH>
  <td>
	<select name="product">
	  <option value="本マグロ">本マグロ</option>
	  <option value="車えび">車えび</option>
	  <option value="松坂牛">松坂牛</option>
	</select>
  </td>
  <td>
  <tr>
    <td>
  <html:form action="/SearchProductModule1Action">
  	<input type="hidden" name="keyword" value="本マグロ">
	<html:submit value="検索"/>
  </html:form>
  </td>
  </tr>

 </TR>
</TABLE>