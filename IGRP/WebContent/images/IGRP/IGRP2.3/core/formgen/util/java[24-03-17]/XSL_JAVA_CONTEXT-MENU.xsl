<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:preserve-space elements="*"/>
<!-- =========================== Context Menu ===================================-->
  <xsl:template name="contextMenuTable" mode="contextMenuTable" match="*">
    	<!--ToolBar-->
		<xsl:variable name="j" select="position()" />
		<xsl:for-each select="item">
			<xsl:variable name="i" select="position()" />
			<xsl:text>page.addItensToContextMenu(this.table</xsl:text>
			<xsl:value-of select="$j" />
			<xsl:text>ContextMenuItem</xsl:text>
			<xsl:value-of select="$i" />
			<xsl:text>);</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
		</xsl:for-each>
			<xsl:text>page.addContextMenuToTable("</xsl:text>
			<xsl:value-of select="name(..)" />
			<xsl:text>");</xsl:text>
		<xsl:value-of select="$enter" />
    </xsl:template>
</xsl:stylesheet>