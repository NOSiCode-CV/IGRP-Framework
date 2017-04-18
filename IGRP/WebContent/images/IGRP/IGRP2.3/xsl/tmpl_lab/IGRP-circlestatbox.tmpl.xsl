<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="IGRP-circlestatbox" mode="IGRP-circlestatbox" match="*">
    <xsl:param name="tag"/>
    <xsl:param name="title"/>
    <xsl:param name="background"/>
    <xsl:param name="description"/>
    <xsl:param name="value"/>
    <xsl:param name="label"/>

    <xsl:value-of select="concat($tag,'_bg')"/>

    <!-- <xsl:variable name="tt">
        <xsl:apply-templates mode="getValue" select="[name() = concat($tag,'_bg')]/value">
            <xsl:with-param name="default" select="$title"/>
        </xsl:apply-templates>
    </xsl:variable> -->
   
    <!-- <xsl:variable name="title">
        <xsl:apply-templates mode="getValue" select="#path#/fields/#tag#_title/value">
            <xsl:with-param name="default" select="'#[title]#'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="label">
        <xsl:apply-templates mode="getValue" select="#path#/fields/#tag#_label/value">
            <xsl:with-param name="default" select="'#[label]#'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="value">
        <xsl:apply-templates mode="getValue" select="#path#/fields/#tag#_val/value">
            <xsl:with-param name="default" select="'#[val]#'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="desc">
        <xsl:apply-templates mode="getValue" select="#path#/fields/#tag#_desc/value">
            <xsl:with-param name="default" select="'#[desc]#'"/>
        </xsl:apply-templates>
    </xsl:variable> -->


    <xsl:value-of select="'dasda'"/>




  </xsl:template>

  

</xsl:stylesheet>