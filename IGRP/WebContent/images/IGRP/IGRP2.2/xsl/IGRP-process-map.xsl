<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <head>
    <xsl:call-template name="home-header"/>
    </head>
    <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    <!--BODY PAGE-->
    <div id="igrp-bodyPage">
      <xsl:call-template name="home-slide-menu"/>
      <div class="bodyPageRigth"> 
        <!--PUT YOUT CODE HERE-->
        <xsl:apply-templates mode="process-flow" select="rows/content/table"/>
        
        <!--NOTIFICATION-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" />
        <div class="box-content resetPadding">
            <xsl:call-template name="process-map">
              <xsl:with-param name="no" select="rows/content/menus"/>
            </xsl:call-template>
         	<div class="_clear"/>
      	</div>
        <div class="_clear"/>
      </div>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
    </div>
    </body>
    </html>
  </xsl:template>
  <!--INCLUDE TEMPLATE-->
  <!--TEMPLATE HOME INCLUDE-->
  <xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-slide-menu.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-process.tmpl.xsl?v=1"/>
</xsl:stylesheet>