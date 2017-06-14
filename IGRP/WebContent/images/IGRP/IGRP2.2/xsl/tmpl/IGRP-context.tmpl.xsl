<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="context-menu" mode="context-menu" match="context-menu">
	<xsl:param name="contextId" select="'IGRP_contextMenu'"/>
    <ul class="contextMenu" id="{$contextId}">
        <xsl:for-each select="item">
            <li id="CTX_ID_{position()}" class="operationTable" trel="{title}">
                <a class="{target}" target="{target}">
                    <xsl:call-template name="page-nav">
                        <xsl:with-param name="action" select="link"/>
                        <xsl:with-param name="page" select="page"/>
                        <xsl:with-param name="app" select="app"/>
                        <xsl:with-param name="linkextra" select="parameter"/>
                    </xsl:call-template>
                    <xsl:if test="img!=''">
                    	<img title="{title}" src="{$path_tmpl}/img/icon/tools-bar/{img}"/>
                    </xsl:if>
                    <span><xsl:value-of select="title"/></span>
                </a>
            </li>
        </xsl:for-each>
    </ul>
</xsl:template>
    
<xsl:template name="cxtmenu-resp" mode="cxtmenu-resp" match="context-menu">
    <xsl:param name="ctx"/>
    <xsl:variable name="ctx_hidden" select="$ctx/param[contains(text(), 'ctx_hidden')]"/>
    <xsl:variable name="ctxHidden">
        <xsl:call-template name="allCtxHidden">
            <xsl:with-param name="text" select="$ctx_hidden"/>
       </xsl:call-template>
   </xsl:variable>
   <xsl:variable name="tCtxAll" select="string-length($ctxHidden)"/>
   <xsl:variable name="ctxTotal" select="count(item)"/>
   <xsl:if test="$tCtxAll &lt;= $ctxTotal">
        <span class="showResponsiveTable ctxmenu"></span>
   </xsl:if>
</xsl:template>

<xsl:template name="context-param" mode="context-param" match="context-menu">
    <xsl:attribute name="CTX_PARAM_COUNT"><xsl:value-of select="count(param)" /></xsl:attribute>
    <xsl:attribute name="CTX_FORM"><xsl:value-of select="ctx_form" /></xsl:attribute>
    <xsl:attribute name="CTX_FORM_IDX"><xsl:value-of select="ctx_form_idx" /></xsl:attribute>
    <xsl:for-each select="param">
        <xsl:attribute name="CTX_P{position()}"><xsl:value-of select="." /></xsl:attribute>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>