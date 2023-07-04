<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" doctype-system="about:legacy-compat" omit-xml-declaration="yes" encoding="utf-8" indent="yes" />

  <xsl:template match="/">
  
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        
        <xsl:call-template name="IGRP-topmenu"/>

        <div class="container-fluid">
          <div class="row">
            <xsl:call-template name="IGRP-sidebar"/>
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
             
              <xsl:apply-templates mode="igrp-messages" select="rows/content/messages">
                <xsl:with-param name="dismiss" select="'false'"/>
              </xsl:apply-templates>


            </div>
          </div>
        </div>

        <xsl:call-template name="IGRP-bottom"/>
 
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>