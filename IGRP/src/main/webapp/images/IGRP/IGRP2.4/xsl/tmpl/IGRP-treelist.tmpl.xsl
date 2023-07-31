<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="IGRP-treelist" match="*" mode="IGRP-treelist">
        
        <xsl:param name="prefix" select="''"/>

        <xsl:variable name="parentTag" select="concat($prefix,'parent')"/>
        
        <ul class="nav nav-list nav-menu-list-style">

            <xsl:call-template name="IGRP-treelist-loop">

                <xsl:with-param name="prefix" select="$prefix"/>

                <xsl:with-param name="items" select="table/value/row[ *[name() = $parentTag] = '' ]"/>

            </xsl:call-template>

        </ul>

    </xsl:template>

    <xsl:template name="IGRP-treelist-loop">

        <xsl:param name="prefix" select="''"/>

        <xsl:param name="items"/>

        <xsl:variable name="idTag" select="concat($prefix,'uid')"/>

        <xsl:variable name="titleTag" select="concat($prefix,'title')"/>

        <xsl:variable name="linkTag" select="concat($prefix,'link')"/>

        <xsl:variable name="targetTag" select="concat($prefix,'target')"/>

        <xsl:variable name="parentTag" select="concat($prefix,'parent')"/>

 
        <xsl:for-each select="$items">

            <xsl:variable name="itemId" select="*[name() = $idTag]"/>

            <xsl:variable name="parentID" select="*[name() = $parentTag]"/>

            <xsl:variable name="childs" select="../row[ *[name() = $parentTag] = $itemId ]"/>

            <li class="h-tst">
                
                <xsl:if test="$parentID = ''">
                    <xsl:attribute name="main-parent">true</xsl:attribute>
                </xsl:if>
                
                <a class="title" data-toggle="collapse" data-target="#{$itemId}_childs">
                    <span><xsl:value-of select="*[ name() = $titleTag ]"/></span>
                    <xsl:if test="count($childs) &gt; 0">
                        <i class="fa fa-caret-down"></i>
                    </xsl:if>
                </a>

                <xsl:if test="count($childs) &gt; 0">

                    <ul class="nav nav-list collapse in" id="{$itemId}_childs">

                        <xsl:call-template name="IGRP-treelist-loop">

                            <xsl:with-param name="prefix" select="$prefix"/>

                            <xsl:with-param name="items" select="$childs"/>

                        </xsl:call-template>

                    </ul>

                </xsl:if>

            </li>

            <!-- <xsl:choose>
            
                <xsl:when test="$parentID != ''">
                   
                </xsl:when>

                <xsl:otherwise>
                    
                </xsl:otherwise>

            </xsl:choose> --> 
    
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>