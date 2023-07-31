<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>

    <xsl:include href="XSL_CONSTANTS.xsl" />
    <xsl:include href="XSL_FIELDS.xsl" />
    <xsl:include href="XSL_BUTTON.xsl"/>
    <xsl:include href="XSL_MODEL.xsl" />
    <xsl:include href="XSL_VIEW.xsl" />
    <xsl:include href="XSL_CONTROLLER.xsl" />
   <xsl:include href="IGRP.blockly.java.xsl" />

    <xsl:template match="/">
      <xsl:call-template name="create-controller"></xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>