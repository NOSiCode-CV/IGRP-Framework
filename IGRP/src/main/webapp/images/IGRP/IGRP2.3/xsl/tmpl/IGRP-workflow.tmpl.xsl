<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/" priority="0">
        <xsl:apply-templates select="." mode="workflow"/>
    </xsl:template>

    <xsl:template name="workflow" match="*" mode="workflow">
        <xsl:if test=".">
            <xsl:variable name="tag" select="local-name(.)"></xsl:variable>
            <div class="igrp-simple-workflow gen-container-item " item-name="{$tag}">
                <div class="simple-wf-items">
                    <xsl:variable name="qtd" select="count(./table/value/row[not(@total='yes')])" />
                    <div class="simple-wf-before" style="min-width: { 125 * $qtd }px" />
                    <xsl:for-each select="./table/value/row[not(@total='yes')]">
                        <a class="text-reset simple-wf-item" state="{*[name() = concat($tag,'_state')]}" data-workflow-id="{*[name() = concat($tag,'_step_id')]}">
                            <xsl:if test="*[name() = concat($tag,'_link')] != ''">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="*[name() = concat($tag,'_link')]" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="*[name() = concat($tag,'_link')] = ''">
                                <xsl:attribute name="disabled">
                                    <xsl:value-of select="true" />
                                </xsl:attribute>
                            </xsl:if>
                            <div class="simple-wf-circle" />
                            <div class="simple-wf-bar" />
                            <div class="text-truncate">
                                <b>
                                    <xsl:value-of select="*[name() = concat($tag,'_step')]" />
                                </b>
                            </div>
                        </a>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>