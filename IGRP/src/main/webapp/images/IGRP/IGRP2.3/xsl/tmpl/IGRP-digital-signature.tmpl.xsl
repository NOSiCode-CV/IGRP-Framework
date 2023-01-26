<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="digitalsignature">
        <xsl:param name="name" select="'signature'"/>
        <xsl:param name="value"/>
        <xsl:param name="label"/>
        <xsl:param name="maxheight" select="'150px'"/>
        <div class="holder-signature" rel="{$name}" item-name="{$name}">
            <xsl:if test="$value != ''">
                <xsl:attribute name="signature">true</xsl:attribute>
            </xsl:if>
            <div rel="{$name}" class="control-signature">
                <a rel="start" class="control-start btn btn-sm btn-primary">
                    <i class="fa fa-pencil"></i>
                </a>
                <a rel="cancel" class="control-cancel btn btn-sm btn-danger hidden">
                    <i class="fa fa-times"></i>
                </a>
            </div>
            <div class="box-signature">
                <canvas id="{$name}cnv" name="{$name}" style="height:{$maxheight}"></canvas>
            </div>

        <xsl:if test="$label != ''">
            <div class="signature-label">/ <xsl:value-of select="$label"/> /</div>
        </xsl:if>
        <input type="hidden" name="{$name}" id="{$name}" value="{$value}"/>
    </div>
    </xsl:template>
</xsl:stylesheet>