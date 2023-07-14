<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-separatorlist-add" >
        <a class="btn fs-12 btn-sm btn-soft-success show-add-row text-capitalize">
            <xsl:value-of select="$locale-strings/add"/>
        </a>
    </xsl:template>

</xsl:stylesheet>