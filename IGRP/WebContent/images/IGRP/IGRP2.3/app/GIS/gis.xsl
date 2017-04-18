<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
      </head>
      <body class="{$bodyClass} sidebar-off"  >
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      
                      <div class="gen-inner">

                        <xsl:if test="rows/content/map">
                          
                          <xsl:variable name="mapDataLink">
                            <xsl:choose>
                              <xsl:when test="contains(rows/content/map,'http://') or contains(rows/content/map,'https://') ">
                                <xsl:value-of select="rows/content/map"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:text>/images/IGRPLAB2.3/extensions/GIS/map.json</xsl:text>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:variable>

                          <xsl:call-template name="gis.map">
                            <xsl:with-param name="data" select="$mapDataLink"/>
                          </xsl:call-template>
                       
                        </xsl:if> 

                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

          <xsl:call-template name="IGRP-bottom"/>
          
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1464700648721"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1464700648721"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1464700648721"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1464700648721"/>
  <xsl:include href="../../extensions/gis/tmpl/gis.xsl?v=1464700648721"/>
</xsl:stylesheet>
