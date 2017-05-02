<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<html>
<head>
<xsl:call-template name="home-header"/>
<!--  FORM INCLUDES  -->
<link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
<script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"/>
</head>
<body class="bodyColor">
<div class="IGRP_overlay"/>
<xsl:call-template name="home-top-main"/>
<div id="igrp-bodyPage">
<xsl:call-template name="home-slide-menu"/>
<div class="bodyPageRigth">
<xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
<form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
<div class="gen-row">
<div class="gen-column col-1-1">
<div class="gen-inner">
<xsl:if test="rows/content/form_1">
<div class="box-content resetPadding gen-container-item" gen-id="body">
<xsl:call-template name="titlecollapser">
<xsl:with-param name="title" select="'Default Page'"/>
<xsl:with-param name="collapsible" select="'false'"/>
</xsl:call-template>
<div class="box-collapser">
<div class="col">
<div gen-id="drop-zone">
<xsl:apply-templates select="rows/content/form_1/fields" mode="hidden-fields"/>
</div>
<div class="_clear"/>
<xsl:if test="rows/content/form_1/tools-bar">
<xsl:apply-templates mode="button-bar" select="rows/content/form_1/tools-bar"/>
</xsl:if>
</div>
<div class="_clear"/>
</div>
</div>
</xsl:if>
</div>
</div>
</div>
</form>
<div class="_clear"/>
</div>
<xsl:call-template name="link-opener"/>
<div class="_clear"/>
</div>
<div id="igrp-footerPage">
<xsl:call-template name="footer"/>
</div>
</body>
</html>
</xsl:template>
<xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1472577442115"/>
<xsl:include href="tmpl/IGRP-slide-menu.tmpl.xsl?v=1472577442115"/>
<xsl:include href="tmpl/IGRP-setAttribute.tmpl.xsl?v=1472577442116"/>
</xsl:stylesheet>