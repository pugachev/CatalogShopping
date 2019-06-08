<%@page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<HTML>
 <BODY>
  <TABLE border="0" width="1024">
      <TR width="1024">
        <TD>
          <tiles:insert attribute="header"/>
        </TD>
      </TR>
      <TR>
        <TD valign="top" width="224" >
          <tiles:insert attribute="menu"/>        
        </TD>
        <TD align="left" width="800">
          <tiles:insert attribute="main"/>
        </TD>
      </TR>
  </TABLE>
 </BODY>
</HTML>