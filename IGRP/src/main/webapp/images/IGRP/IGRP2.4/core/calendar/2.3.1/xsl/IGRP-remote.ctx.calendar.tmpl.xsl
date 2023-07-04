<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="path_tmpl"/>
    <xsl:template match="/">
        <xsl:for-each select="rows/content/table/value/row">
        
        <xsl:variable name="ctx_hidden" select="context-menu/param[contains(text(), 'ctx_hidden')]"/>
		<xsl:variable name="ctx_param">
			<xsl:for-each select="context-menu/param[not(contains(., 'ctx_hidden'))]">
					<xsl:text>&amp;</xsl:text><xsl:value-of select="."/>
			</xsl:for-each>			
		</xsl:variable>
        
        <xsl:variable name="substringAfter" select="substring-after($ctx_hidden,'=')"/>
        <xsl:variable name="ctxHidden">
            <xsl:call-template name="allCtxHidden">
                <xsl:with-param name="text" select="$ctx_hidden"/>
            </xsl:call-template>
        </xsl:variable>
			
        <ul class="contextMenu calendarCtx" id="ctx-{id}">
        	<xsl:for-each select="../../context-menu/item">
            	<xsl:variable name="vText">
                	 <xsl:call-template name="split">
                        <xsl:with-param name="vText" select="$substringAfter"/>
                        <xsl:with-param name="ctx" select="title"/>
                        <xsl:with-param name="item" select="string-length($ctxHidden)"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$vText != title">
                    <li class="operationTable">
                        <a target="{target}">
                            <xsl:call-template name="page-nav">
                                <xsl:with-param name="action" select="link"/>
                                <xsl:with-param name="page" select="page"/>
                                <xsl:with-param name="app" select="app"/>
                                <xsl:with-param name="linkextra" select="concat(parameter,$ctx_param)"/>
                            </xsl:call-template>
                            <xsl:if test="img!=''">
                                <img title="{title}" src="{$path_tmpl}/img/icon/tools-bar/{img}"/>
                            </xsl:if>
                            <span><xsl:value-of select="title"/></span>
                        </a>
                    </li>
                </xsl:if>
            </xsl:for-each>
        </ul></xsl:for-each>
    </xsl:template>
    
    <xsl:template name="allCtxHidden">
        <xsl:param name="text"/>
        <xsl:param name="separator" select="','"/>
        <xsl:param name="cont" select="0"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="allCtxHidden">
                	<xsl:with-param name="cont" select="$cont + 1"/>
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$cont"/>
    </xsl:template>
	
    <!--retorna o item a esconder-->
   <xsl:template name="split">
  	<xsl:param name="vText"/>
    <xsl:param name="ctx"/>
   	<xsl:param name="item"/>
    <xsl:param name="pos" select="0"/>
    <xsl:param name="separator" select="','"/>
    <xsl:if test="$vText != ''">
        <xsl:choose>
            <xsl:when test="contains($vText, $separator)">
                <xsl:variable name="ctxAfter" select="substring-after($vText, $separator)"/>
                <xsl:variable name="ctxBefore" select="substring-before($vText, $separator)"/>
                <xsl:if test="$pos &lt; $item">
                    <xsl:choose>
                    	<xsl:when test="$ctx = $ctxBefore"><xsl:value-of select="$ctx"/></xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="split">
                                <xsl:with-param name="vText" select="$ctxAfter"/>
                                <xsl:with-param name="ctx" select="$ctx"/>
                                <xsl:with-param name="item" select="$item"/>
                                <xsl:with-param name="pos" select="$pos + 1"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$vText"/></xsl:otherwise>
        </xsl:choose>
    </xsl:if>
   </xsl:template>
    
    
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
            <xsl:otherwise>
                  <xsl:value-of select="$linkhref" /><xsl:value-of select="$linkextra" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:attribute>

</xsl:template>
    
</xsl:stylesheet>