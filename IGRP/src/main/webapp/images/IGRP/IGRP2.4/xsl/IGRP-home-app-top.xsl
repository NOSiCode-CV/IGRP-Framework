<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="/images/IGRP/xml/ " -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"  />
  <xsl:template match="/">
    
  <html>
    <head>
      <xsl:call-template name="IGRP-head"/>
      <script languae="javascript">
          function GoToPage(pUrl){
              top.window.location=pUrl;
          }
      </script>
    </head>
    <body class="{$bodyClass} fixed-sidebar">
       <nav id="igrp-top-nav" class="navbar navbar-fixed-top">
            
        <a class="navbar-brand col-sm-3 col-md-2" href="javascript:GoToPage('{rows/link}')" bg-color="template" style="width:23%">
         <img src="{$path}/themes/default/img/logo.png"/>
         <span style="font-size:14px"><xsl:value-of select="rows/title"/></span>
        </a>

        <ul id="igrp-top-menu" class="nav navbar-nav navbar-right">
          <li>
            <a href="#"><xsl:value-of select="rows/site/user_name"/></a>
          </li>
          <li alt="Sair">
            <a href="javascript:GoToPage('{rows/site/button/link}')"><i class="fa fa-sign-out"></i></a>
          </li>
        </ul>

      </nav>
      
    </body>
  </html>

</xsl:template>

<xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=1476098525269"/>
<xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1476098525269"/>
</xsl:stylesheet>