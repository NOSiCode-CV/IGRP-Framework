<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="electronicsignature">
        <xsl:param name="field"/>
        <xsl:param name="maxheight" select="'150px'"/>

        <xsl:variable name="name" select="$field/@name"/>
        <xsl:variable name="value" select="$field/value"/>
        <xsl:variable name="label" select="$field/label"/>
        <xsl:variable name="autoupload" select="$field/@autoupload"/>
        <xsl:variable name="urlautoupload" select="$field/@urlautoupload"/>
        <xsl:variable name="labelstart" select="$field/@labelstart"/>
        <xsl:variable name="labelcancel" select="$field/@labelcancel"/>

        <div class="holder-signature" rel="{$name}" item-name="{$name}">
            <xsl:if test="$value != ''">
                <xsl:attribute name="signature">true</xsl:attribute>
            </xsl:if>
            <xsl:if test="$autoupload != ''">
                <xsl:attribute name="autoupload">true</xsl:attribute>
                <xsl:attribute name="url-autoupload">
                    <xsl:value-of select="$urlautoupload"/>
                </xsl:attribute>
            </xsl:if>
            <div rel="{$name}" class="control-signature">
                <a rel="start" class="control-start btn btn-sm btn-primary">
                    <xsl:if test="$labelstart != ''">
                        <xsl:attribute name="title">
                            <xsl:value-of select="$labelstart"/>
                        </xsl:attribute>
                    </xsl:if>
                    <i class="fa fa-pencil"></i>
                </a>
                <a rel="cancel" class="control-cancel btn btn-sm btn-danger hidden">
                    <xsl:if test="$labelcancel != ''">
                        <xsl:attribute name="title">
                            <xsl:value-of select="$labelcancel"/>
                        </xsl:attribute>
                    </xsl:if>
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