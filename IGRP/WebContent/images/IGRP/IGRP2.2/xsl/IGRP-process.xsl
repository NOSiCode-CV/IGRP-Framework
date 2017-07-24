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
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
            <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
            <xsl:call-template name="GEN-FORM" />
        </form>
        <div class="_clear"/>
      </div>
      	<xsl:if test="rows/content/form/label/*[contains(@type,'LOOKUP')] or rows/content/filter/label/*[contains(@type,'LOOKUP')]">
    		<xsl:call-template name="link-opener"/>
    	</xsl:if>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage"><xsl:call-template name="footer"/></div>
    </body>
    </html>
  </xsl:template>
  <!--INCLUDE TEMPLATE-->
  <!--TEMPLATE HOME INCLUDE-->
  <xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-form-text-editor.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-virtualkeyboard.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-process.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-finger-print.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-view.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-form-gen.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-others.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-slide-menu.tmpl.xsl?v=1"/>
</xsl:stylesheet>