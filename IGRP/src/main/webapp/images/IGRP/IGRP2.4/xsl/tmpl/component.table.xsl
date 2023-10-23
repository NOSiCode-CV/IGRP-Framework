<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-table-fields-checkbox-td" mode="igrp-table-fields-checkbox-td" match="*">
        <xsl:param name="tag" select="name()"/>
        <xsl:param name="tag_check" select="../*[name() = concat($tag,'_check')]"/>
        <xsl:param name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:param name="switch"/>

        <xsl:if test="$tag != '-0'">
            <div class="form-check {$switch}">
                <input type="checkbox" name="p_{$tag}_fk" value="{.}" check-rel="{$tag}" class="checkdcontrol form-check-input">
                    <xsl:if test="$tag_check=.">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                    <xsl:call-template name="setAttributes">
                        <xsl:with-param name="field" select="$field"/>
                    </xsl:call-template>
                </input>
            </div>
        </xsl:if>

        <input type="hidden" name="p_{$tag}_check_fk" class="{$tag}_check">
            <xsl:if test="$tag_check=.">
                <xsl:attribute name="value"><xsl:value-of select="$tag_check"/></xsl:attribute>
            </xsl:if>
        </input>
        
        <xsl:if test="$tag_check!=$tag">
            <input type="hidden" name="p_{$tag}_fk" value="{.}" class="{$tag}"/>
        </xsl:if>
        
       
    </xsl:template>

    <xsl:template name="igrp-table-fields-color-td" mode="igrp-table-fields-color-td" match="*">
        <xsl:param name="tag" select="name()"/>
        <xsl:param name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:param name="color" select="."/>
        <xsl:param name="table-colors" select="../../../legend_color/item"/>
        <xsl:attribute name="class">tdcolor</xsl:attribute>

        <div class="td-badge">
            <span class="badge rounded-pill " style="background:{ concat( $table-colors[value=$color]/color, '1a' )  }; color:{$table-colors[value=$color]/color}">
                <xsl:value-of select="$table-colors[value=$color]/label"/>
            </span>
        </div>

    </xsl:template>

    
</xsl:stylesheet>