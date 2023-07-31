<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-statbox" mode="igrp-statbox" match="*">
        <xsl:param name="style" select="'default'"/>

        <xsl:variable name="tag" select="name(.)"/>
        <xsl:variable name="title" select="fields/*[name() = concat($tag,'_title')]/value"/>
        <xsl:variable name="value" select="fields/*[name() = concat($tag,'_val')]/value"/>
        <xsl:variable name="pct" select="fields/*[name() = concat($tag,'_pct')]/value"/>
        <xsl:variable name="text" select="fields/*[name() = concat($tag,'_text')]/value"/>
        <xsl:variable name="icon" select="fields/*[name() = concat($tag,'_icn')]/value"/>
        <xsl:variable name="state" select="fields/*[name() = concat($tag,'_state')]/value"/>
        <xsl:variable name="state-class">
            <xsl:choose>
                <xsl:when test="$state = '-'">danger</xsl:when>
                <xsl:when test="$state = '+'">success</xsl:when>
                <xsl:otherwise>dark</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="state-icon">
            <xsl:choose>
                <xsl:when test="$state = '-'">down</xsl:when>
                <xsl:when test="$state = '+'">up</xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="icon-color">
            <xsl:choose>
                <xsl:when test="fields/*[name() = concat($tag,'_bg')]/value">
                    <xsl:value-of select="fields/*[name() = concat($tag,'_bg')]/value"/>
                </xsl:when>
                <xsl:otherwise>dark</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <div class="card card-animate">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div class="avatar-sm flex-shrink-0">
                        <span class="avatar-title bg-soft-{$icon-color} text-{$icon-color} rounded-2 fs-2">
                            <i class="fa {$icon}"></i>
                        </span>
                    </div>
                    <div class="flex-grow-1 overflow-hidden ms-3">
                        <p class="text-uppercase fw-medium text-muted text-truncate mb-3">
                            <xsl:value-of select="$title"/>
                        </p>
                        <div class="d-flex align-items-center mb-3">
                            <h4 class="fs-4 flex-grow-1 mb-0">
                                <span class="counter-value" data-target="{$value}">
                                    <xsl:value-of select="$value"/>
                                </span>
                            </h4>
                            <span class="badge badge-soft-{$state-class} text-{$state-class} fs-12">
                                <i class="ri-arrow-{$state-icon}-s-line fs-13 align-middle me-1"></i>
                                <xsl:value-of select="$pct"/>%
                            </span>
                        </div>
                        <p class="text-muted text-truncate mb-0">
                            <xsl:value-of select="$text"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </xsl:template>

</xsl:stylesheet>