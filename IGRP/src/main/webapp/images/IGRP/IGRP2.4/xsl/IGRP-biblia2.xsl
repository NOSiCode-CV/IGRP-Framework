<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
  
  <xsl:template match="/">
    
    <html>

      <head>

        <xsl:call-template name="IGRP-head"/>
       
      </head>

      <body>
        
      </body>

    </html>

  </xsl:template>

  <xsl:include href="tmpl/IGRP-functions.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-utils.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-form-utils.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-table-utils.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-treemenu.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-charts.tmpl.xsl?v=1506102103446"/>
</xsl:stylesheet>
