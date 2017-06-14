<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="debug">
    	<xsl:if test="rows/content/messages/message[@type='debug'] != ''">
        	<xsl:variable name="contDebug" select="count(rows/content/messages/message[@type='debug'])"/>
            <div class="col">
                <div class="icon iconDebug"/>
                <div class="debug addBorder">
                    <xsl:if test="$contDebug &gt; 9">
                        <div class="search borderColor">
                            <label><xsl:value-of select="$lngPath/search"/></label>
                            <input type="text" id="searchDebug" name="searchDebug"/>
                            <div class="_clear"/>
                        </div>
                    </xsl:if>
                    <ul>
                        <xsl:for-each select="rows/content/messages/message[@type='debug']">
                        	<li class="borderColor"><xsl:value-of select="." /></li>
                        </xsl:for-each>
                        <div class="_clear"/>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>    
</xsl:stylesheet>