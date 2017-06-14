<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template mode="IGRP-view" name="IGRP-view" match="view">
        <div class="box-content resetPadding" sep-name="{name()}">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="title"/>
            </xsl:call-template>
            <div class="box-collapser">
                <div class="col">
                    <xsl:if test="label/view_foto != ''">
                        <div class="col15">
                            <div class="viewFoto">
                                <img src="{value/view_foto}" />
                            </div>
                        </div>
                    </xsl:if>
                    <xsl:variable name="class">
                        <xsl:choose>
                            <xsl:when test="label/view_foto != ''">
                                <xsl:value-of select="'col85'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'col'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <div class="{$class}">
                        <div class="col">
                            <xsl:if test="label/*[position() = 1 and name() != 'view_foto']/text()">
                                <div class="viewName borderColor">
                                    <xsl:value-of select="value/*[position() = 1 and name() != 'view_foto']/text()"/>
                                </div>
                            </xsl:if>
                        </div>
                        <div class="viewDados addPaddingBottom10">
                            <xsl:for-each select="label/*[name() != 'view_foto' and position() != 1]">
                                <xsl:variable name="vName" select="name()"/>
                                <xsl:variable name="pos" select="(position()+1) mod 2" />
                                <xsl:choose>
                                    <xsl:when test="@type = 'separator'">
                                        <div class="col">
                                            <h1>
                                                <xsl:value-of select="text()"/>
                                            </h1>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="index" select="position()"/>
                                        <div class="col">
                                            <div class="groupView borderColor" color="view{$pos}">
                                                <!--
                                                <xsl:if test="position() = last()">
                                                    <xsl:attribute name="class">groupView resetBorder</xsl:attribute>
                                                </xsl:if>-->
                                                <xsl:choose>
                                                    <xsl:when test="@type = 'link'">
                                                        <span class="viewValue link">
                                                            <a class="bClick" href="{../../value/*[name()=$vName]}" target="_blank">
                                                                <xsl:value-of select="text()"/>
                                                            </a>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <span class="viewLabel">
                                                            <xsl:value-of select="text()"/>:
                                                        </span>
                                                        <span class="viewValue">
                                                            <xsl:value-of select="../../value/*[name()=$vName]"/>
                                                        </span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <div class="_clear"/>
                                            </div>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
    </xsl:template>
</xsl:stylesheet>