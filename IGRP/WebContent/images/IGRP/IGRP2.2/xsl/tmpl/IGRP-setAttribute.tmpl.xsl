<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="FIELD_validator">
	<xsl:param name="field" />
     <xsl:if test="$field/@readonly='true'">
        <xsl:attribute name="disabled">disabled</xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@readonly='readonly' and $field/@type != 'file'">
        <xsl:attribute name="readonly">readonly</xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@visible">
        <xsl:attribute name="visible">false</xsl:attribute>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>