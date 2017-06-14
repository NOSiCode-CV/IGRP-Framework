<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template mode="workFlow_tab" name="workFlow_tab" match="label">
        <xsl:param name="vType" select="'separator'"/>
        <xsl:if test="count(./*[@type=$vType]) &gt; 1">
            <ul class="workFlow-tab">
                <xsl:for-each select="./*[@type=$vType]">
                    <li rel="{local-name()}" position="{position()}">
                        <xsl:if test="position() = 1"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                        <xsl:if test="string-length(.) &gt; 14">
                            <xsl:attribute name="title">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </xsl:if>
                        <span class="label"><xsl:value-of select="."/></span>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
    </xsl:template>

  <xsl:template mode="workFlow_tab1" name="workFlow_tab1" match="label">
  	<xsl:if test="count(./*[@type='separator']) &gt; 1">
        <div class="col workFlow">
        	<ul class="process-flow">
            	<xsl:for-each select="./*[@type='separator']">
                	<li rel="{local-name()}" position="{position()}">
                    	<xsl:if test="position() = 1"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                        <xsl:if test="position() = last()"><xsl:attribute name="pRel">end</xsl:attribute></xsl:if>
                    	<a>
                            <span class="dot">
                                <span class="stp_num"><xsl:value-of select="position()"/></span>
                                <xsl:if test="position() != last()"><span class="stp_bar"></span></xsl:if>
                            </span>
                            <span class="stp_label"><xsl:value-of select="."/></span>
                            <xsl:if test="string-length(.) &gt; 19"><em><xsl:value-of select="."/></em></xsl:if>
                        </a>
                    </li>
                </xsl:for-each>
            	<div class="_clear"/>
            </ul>
            <div class="_clear"/>
        </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>