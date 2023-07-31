<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="page-nav">
        <xsl:param name="action"/>
        <xsl:param name="attrib" select="'href'"/>
        <xsl:param name="page" select="''"/>
        <xsl:param name="linkextra" select="''"/>
        <xsl:param name="app" select="/rows/app" />
        <xsl:param name="ad_hoc" select="'0'" />
        <xsl:variable name="app2" select="/rows/app" />
        <xsl:variable name="v_page" select="''"/>
        <xsl:variable name="linkhref">
            <xsl:choose>
                <xsl:when test="/rows/navigation/@file">
                    <xsl:value-of select="document(/rows/navigation/@file)/navigation/item[(@app=$app2) and ((@page=$page) or (@page=$v_page))  and (@action=$action)]/text()" />
                </xsl:when>
                <xsl:otherwise>
                <xsl:value-of select="/rows/navigation/@url" />
                <xsl:if test="$ad_hoc=0">
                <xsl:text>&amp;</xsl:text><xsl:value-of select="/rows/navigation/@prm_app" />=<xsl:value-of select="$app" /><xsl:text>&amp;</xsl:text><xsl:value-of select="/rows/navigation/@prm_page" />=<xsl:value-of select="$page" /><xsl:text>&amp;</xsl:text><xsl:value-of select="/rows/navigation/@prm_action" />=<xsl:value-of select="$action" />
               </xsl:if>
            </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="{$attrib}">
            <xsl:choose>
                <xsl:when test="contains($linkextra,'http://') or contains($linkextra,'https://')">
                    <xsl:value-of select="$linkextra" />
                </xsl:when>
                
                <xsl:when test="preview">
                    <xsl:value-of select="preview" />
                </xsl:when>
                
                <xsl:otherwise>
                    <xsl:value-of select="$linkhref" />
                    <xsl:value-of select="$linkextra" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>