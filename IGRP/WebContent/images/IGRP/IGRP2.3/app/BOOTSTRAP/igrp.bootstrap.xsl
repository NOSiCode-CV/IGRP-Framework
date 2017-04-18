<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
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
              
              <section class="content-header">
                <h1>
                  <xsl:value-of select="rows/content/title"/>
                </h1>
              </section>
              
              <div class="content">
                

              </div>
              


            </div>
          </div>
        </div>

        <xsl:call-template name="IGRP-bottom"/>
        
      </body>
    </html>
  </xsl:template>

  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>

</xsl:stylesheet>
