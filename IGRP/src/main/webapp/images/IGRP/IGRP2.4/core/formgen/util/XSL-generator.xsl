<?xml version="1.0" encoding="utf-8"?>
<gen:stylesheet version="1.0" xmlns:gen="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="dim-red"
 exclude-result-prefixes="xsl">
  <gen:namespace-alias stylesheet-prefix="xsl" result-prefix="xsl"/>
  
  <gen:template match="/">
    <xsl:stylesheet version="1.0">     
      <xsl:output method="html" omit-xml-declaration="yes" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />
	  <xsl:template match="/">

        <html>
          <head>
            <xsl:call-template name="IGRP-head"/>
          </head>
          <body class="{$bodyClass}">
            <xsl:call-template name="IGRP-topmenu"/>
            <form>
              <div class="container-fluid">
                <div class="row">
                  <xsl:call-template name="IGRP-sidebar"/>
                  <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                    <div class="content"></div>
                  </div>
                </div>
              </div>
              <xsl:call-template name="IGRP-bottom"/>
            </form>
          </body>
        </html>
      </xsl:template>

    </xsl:stylesheet>
    
  </gen:template>
  <!--TEMPLATES-->
  
</gen:stylesheet>
