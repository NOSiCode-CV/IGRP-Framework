<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Text Editor Template -->
<xsl:template name="text-editor">
	<xsl:param name="name" select="'texteditor'"/>
    <xsl:param name="value" select="'Text Editor'"/>
    <xsl:param name="maxlength" select="''"/>
    <xsl:param name="rel" select="''"/>
    
    <textarea name="{$name}" id="{$name}" class="textEditor" rows="10" cols="80">
    	<xsl:if test="$maxlength != ''">
            <xsl:attribute name="maxlength"><xsl:value-of select="$maxlength"/></xsl:attribute>
        </xsl:if>
        <xsl:if test="$rel != ''">
            <xsl:attribute name="rel">F_<xsl:value-of select="$rel"/></xsl:attribute>
        </xsl:if>
    	<xsl:value-of select="$value" disable-output-escaping="yes"/>
    </textarea>
    <script type="text/javascript">
		$(function(){
			var _div = "<xsl:value-of select='$name'/>";
			$('#'+_div).ckeditor();
		});
	</script>
</xsl:template>
</xsl:stylesheet>