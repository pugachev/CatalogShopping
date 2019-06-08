<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<HTML>
 <BODY>
  <TABLE width="800">
      <TR>
        <TD width="800" border="0">
          <tiles:insert attribute="header"/>
        </TD>
      </TR>
      <TR height="20" widht="800">
       <TD>
          <tiles:insert attribute="login"/> 
       </TD>         
      <TR>
      <TR>
        <TD valign="top" width="150" >
          <tiles:insert attribute="menu"/>        
        </TD>
        <TD align="left" width="400">
          <tiles:insert attribute="main"/>
        </TD>
        <TD width="250" valign="top">
        </TD>
      </TR>
  </TABLE>
 </BODY>
</HTML>
