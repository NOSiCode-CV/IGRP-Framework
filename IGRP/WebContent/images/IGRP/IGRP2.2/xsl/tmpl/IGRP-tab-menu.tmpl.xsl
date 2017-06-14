<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template mode="tab-menu-gen" name="tab-menu-gen" match="*">
    <div class="col" sep-name="{name()}">
        <div class="divBorder tabMenuHolder">
            <ul class="IGRP-menu showTabDesk tabMenuGroups">
                <xsl:for-each select="group">
                    <xsl:variable name="posTab" select="position() - 1"/>
                    <li rel="tab{$posTab}" groupMenu-name="{name()}{$posTab}" group-id="{@id}">
                        <xsl:if test="$posTab = 0"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                        <a><span>
                            <xsl:if test="string-length(@title) &gt; 14">
                                <xsl:attribute name="title"><xsl:value-of select="@title" disable-output-escaping="yes"/></xsl:attribute>
                            </xsl:if>
                        <xsl:value-of select="@title" disable-output-escaping="yes"/></span></a>
                    </li>
                </xsl:for-each>
            </ul>
            <div class="itemTab">
                <xsl:for-each select="group">
                    <xsl:variable name="posTab" select="position() - 1"/>
                    <div class="tab showMobile" groupMenu-name="{name()}{$posTab}">
                        <span rel="tab{$posTab}">
                            <xsl:if test="$posTab = 0"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                            <xsl:value-of select="@title" disable-output-escaping="yes"/>
                        </span>
                    </div>
                    <ul class="IGRP-menu groupItemTab itemMenu" id="tab{$posTab}" type="tab" groupMenu-name="{name()}{$posTab}">
                        <xsl:if test="$posTab = 0"><xsl:attribute name="class">IGRP-menu groupItemTab itemMenu active</xsl:attribute></xsl:if>
                        <xsl:for-each select="item">
                            <xsl:variable name="pos" select="position() -1"/>
                            <li itemMenu-name="{name()}{concat($posTab,$pos)}">
                                <a class="bClick" target="{target}" pos="{concat($posTab,$pos)}">
                                    <xsl:if test="string-length(title) &gt; 14">
                                        <xsl:attribute name="title"><xsl:value-of select="title" disable-output-escaping="yes"/></xsl:attribute>
                                    </xsl:if>
                                    <xsl:call-template name="page-nav">          
                                        <xsl:with-param name="action" select="link" />
                                        <xsl:with-param name="page" select="page" />
                                        <xsl:with-param name="app" select="app" />
                                        <xsl:with-param name="linkextra" select="parameter" />
                                    </xsl:call-template>
                                    <xsl:if test="img and img != ''">
                                        <span class="icon"><img src="{$path_tmpl}/img/icon/menu/{img}"/></span>
                                    </xsl:if>
                                    <span class="item-lbl"><xsl:value-of select="title" disable-output-escaping="yes"/></span>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
        <div class="_clear"/>
    </div>
  </xsl:template>

  <xsl:template mode="tab-menu" name="tab-menu" match="menu">
  	<div class="col" sep-name="{name()}">
    	<div class="divBorder" id="tabsMenu">
            <ul class="IGRP-menu showTabDesk" id="tabs">
                <xsl:for-each select="group">
                	<xsl:variable name="posTab" select="position() - 1"/>
                    <li rel="tab{$posTab}" groupMenu-name="{name()}{$posTab}">
                    	<xsl:if test="$posTab = 0"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                    	<a><span>
                        	<xsl:if test="string-length(@title) &gt; 14">
                                <xsl:attribute name="title"><xsl:value-of select="@title" disable-output-escaping="yes"/></xsl:attribute>
                            </xsl:if>
                        <xsl:value-of select="@title" disable-output-escaping="yes"/></span></a>
                    </li>
                </xsl:for-each>
                <div class="_clear"/>
            </ul>
        	<div class="itemTab">
                <xsl:for-each select="group">
                    <xsl:variable name="posTab" select="position() - 1"/>
                    <div class="tab showMobile" groupMenu-name="{name()}{$posTab}">
                    	<span rel="tab{$posTab}">
                        	<xsl:if test="$posTab = 0"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                        	<xsl:value-of select="@title" disable-output-escaping="yes"/>
                        </span>
                    </div>
                    <ul class="IGRP-menu groupItemTab itemMenu" id="tab{$posTab}" type="tab" groupMenu-name="{name()}{$posTab}">
                    	<xsl:if test="$posTab = 0"><xsl:attribute name="class">IGRP-menu groupItemTab itemMenu active</xsl:attribute></xsl:if>
                        <xsl:for-each select="item">
                        	<xsl:variable name="pos" select="position() -1"/>
                            <li itemMenu-name="{name()}{concat($posTab,$pos)}">
                                <a class="bClick" target="{target}" pos="{concat($posTab,$pos)}">
                                	<xsl:if test="string-length(title) &gt; 14">
                                    	<xsl:attribute name="title"><xsl:value-of select="title" disable-output-escaping="yes"/></xsl:attribute>
                                   	</xsl:if>
                                    <xsl:call-template name="page-nav">          
                                        <xsl:with-param name="action" select="link" />
                                        <xsl:with-param name="page" select="page" />
                                        <xsl:with-param name="app" select="app" />
                                        <xsl:with-param name="linkextra" select="parameter" />
                                    </xsl:call-template>
                                    <xsl:if test="img and img != ''">
                                    	<span class="icon"><img src="{$path_tmpl}/img/icon/menu/{img}"/></span>
                                    </xsl:if>
                                    <span><xsl:value-of select="title" disable-output-escaping="yes"/></span>
                                </a>
                            </li>
                        </xsl:for-each>
                        <div class="_clear"/>
                    </ul>
                </xsl:for-each>
                <div class="_clear"/>
            </div>
        	<div class="_clear"/>
        </div>
    	<div class="_clear"/>
    </div>
  </xsl:template>
</xsl:stylesheet>