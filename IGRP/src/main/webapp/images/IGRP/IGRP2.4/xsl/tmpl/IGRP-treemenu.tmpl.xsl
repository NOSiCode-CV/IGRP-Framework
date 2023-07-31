<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="target" select="'_self'"/>
    <xsl:param name="target_fields"/>
    <xsl:param name="id"/>
    <xsl:param name="name"/>
    <xsl:param name="class" select="'tree'"/>
    <xsl:param name="tooltip" select="'false'"/>
    <xsl:param name="parser" select="'false'"/>

    <xsl:template match="/" priority="0">
        <ul class="nav nav-list {$class}">
            <xsl:if test="$id">
                <xsl:attribute name="rel">list-<xsl:value-of select="$id"/></xsl:attribute>
            </xsl:if>
            <xsl:call-template name="recorTreeMenu">
                <xsl:with-param name="treeMenu" select="*/value/row"/>
                <xsl:with-param name="id" select="$id"/>
                <xsl:with-param name="name" select="$name"/>
                <xsl:with-param name="target" select="$target"/>
                <xsl:with-param name="target_fields" select="$target_fields"/>
                <xsl:with-param name="tooltip" select="$tooltip"/>
                <xsl:with-param name="parser" select="$parser"/>
            </xsl:call-template>
        </ul>
    </xsl:template>

    <xsl:template name="treemenu" match="*" mode="treemenu">
        <xsl:param name="target" select="'_self'"/>
        <xsl:param name="target_fields"/>
        <xsl:param name="style" select="'default'"/>
        <xsl:param name="toggle" select="'live'"/>
        <xsl:param name="onload" select="'false'"/>
        <xsl:param name="tooltip" select="'false'"/>
        <xsl:param name="parser" select="'false'"/>
        <xsl:param name="search" select="'false'"/>
        <xsl:param name="package"/>
        <xsl:param name="app"/>
        <xsl:param name="gentype"/>
        <xsl:variable name="name" select="local-name(.)"/>
        <xsl:variable name="parentId" select="concat($name,'_parent')"/>
        <xsl:variable name="vapp">
            <xsl:choose>
                <xsl:when test="$app"><xsl:value-of select="$app"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="//rows/app"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="$search = 'true'">
            <div class="treemenu-search">
                <div class="side-bar-ctrl visible-xs clearfix" >
                  <i class="fa fa-navicon pull-right"></i>
                </div>
                
                <div class="igrp-sidebar-menu-search-wrapper">
                  <input 
                    type="text" 
                    class="form-control igrp-search-list" 
                    placeholder="Pesquisar ..." 
                    search-list="#tm_{$name} ul.nav-list li a"
                    search-attr="text"
                    search-item-parent=".nav-header"
                    search-item-wrapper=".box-tm" />
                </div>
            </div>
        </xsl:if>
        <div class="box-tm box-body" app="{$vapp}" package-db="{$package}" gentype="{$gentype}" themes="{$style}" data-toggle="{$toggle}" name="{$name}" id="tm_{$name}">
            <xsl:if test="$tooltip = 'true'">
                <xsl:attribute name="tooltip"><xsl:value-of select="$tooltip"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="$toggle = 'remote'">
                <xsl:attribute name="target"><xsl:value-of select="$target"/></xsl:attribute>
                <xsl:if test="$target = 'changesrc'">
                    <xsl:attribute name="target_fields"><xsl:value-of select="$target_fields"/></xsl:attribute>
                </xsl:if>
            </xsl:if>
            <xsl:if test="$onload = 'true'">
                <xsl:attribute name="onload"><xsl:value-of select="$onload"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="$parser = 'true'">
                <xsl:attribute name="parser"><xsl:value-of select="$parser"/></xsl:attribute>
            </xsl:if>

            <ul class="nav nav-list">
                <xsl:for-each select="./table/value/row/*[name() = $parentId]">
                    <xsl:variable name="id" select="../*[name() = concat($name,'_tmid')]"/>
                    <xsl:if test="not(text())">
                        <li id="{$id}">
                            <i class="fa fa-check-square-o activeicon" aria-hidden="true"></i>
                            <xsl:choose>
                                <xsl:when test="//./table/value/row/*[$parentId = name()]/text() = $id or ../*[name() = concat($name,'_child')] &gt; 0">
                                    <div class="tree-toggler nav-header" rel="list-{$id}">
                                        <xsl:call-template name="isActive">
                                            <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="isSet">
                                            <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                        </xsl:call-template>
                                        <span class="icon">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </span>
                                        <xsl:choose>
                                            <xsl:when test="../*[name() = concat($name,'_link')] != ''">
                                                <a text="{../*[name() = concat($name,'_link_desc')]}">
                                                    <xsl:call-template name="setTarget">
                                                        <xsl:with-param name="parser" select="$parser"/>
                                                        <xsl:with-param name="target" select="$target"/>
                                                        <xsl:with-param name="target_fields" select="$target_fields"/>
                                                        <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                                        <xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                    </xsl:call-template>
                                                    
                                                    <xsl:call-template name="setTooltipTreemenu">
                                                        <xsl:with-param name="tooltip" select="$tooltip"/>
                                                        <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                    </xsl:call-template>
                                                    <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <a class="form-link" text="{../*[name() = concat($name,'_link_desc')]}">
                                                    <xsl:call-template name="setTarget">
                                                        <xsl:with-param name="parser" select="$parser"/>
                                                        <xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                    </xsl:call-template>

                                                    <xsl:call-template name="setTooltipTreemenu">
                                                        <xsl:with-param name="tooltip" select="$tooltip"/>
                                                        <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                    </xsl:call-template>
                                                    <xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/>
                                                </a> 
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                    <div class="list-holder" id="list-{$id}">
                                        <ul class="nav nav-list tree" rel="list-{$id}">
                                            <xsl:call-template name="isActive">
                                                <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                            </xsl:call-template>
                                            <xsl:for-each select="//./table/value/row/*[($parentId = name())]">
                                                <xsl:if test="text() = $id">
                                                    <xsl:variable name="vid" select="../*[name() = concat($name,'_tmid')]"/>
                                                    <li id="{$vid}" text="{../*[name() = concat($name,'_link_desc')]}">
                                                        <xsl:choose>
                                                            <xsl:when test="//./table/value/row/*[$parentId = name()]/text() = $vid or ../*[name() = concat($name,'_child')] &gt; 0">
                                                                <div class="tree-toggler nav-header" rel="list-{$vid}">
                                                                    <xsl:call-template name="isActive">
                                                                        <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                                                    </xsl:call-template>
                                                                    <xsl:call-template name="isSet">
                                                                        <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                                                    </xsl:call-template>
                                                                    <span class="icon">
                                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                                    </span>
                                                                    <xsl:choose>
                                                                        <xsl:when test="../*[name() = concat($name,'_link')] != ''">
                                                                            <a text="{../*[name() = concat($name,'_link_desc')]}">
                                                                                <xsl:call-template name="setTarget">
                                                                                    <xsl:with-param name="parser" select="$parser"/>
                                                                                    <xsl:with-param name="target" select="$target"/>
                                                                                    <xsl:with-param name="target_fields" select="$target_fields"/>
                                                                                    <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                                                                	<xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                                                </xsl:call-template>
                                                                                
                                                                                <xsl:call-template name="setTooltipTreemenu">
                                                                                    <xsl:with-param name="tooltip" select="$tooltip"/>
                                                                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                                                </xsl:call-template>
                                                                                <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                                            </a>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <a class="form-link" text="{../*[name() = concat($name,'_link_desc')]}">
                                                                                
                                                                                <xsl:call-template name="setTarget">
                                                                                    <xsl:with-param name="parser" select="$parser"/>
                                                                                    <xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                                                </xsl:call-template>

                                                                                <xsl:call-template name="setTooltipTreemenu">
                                                                                    <xsl:with-param name="tooltip" select="$tooltip"/>
                                                                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                                                </xsl:call-template>
                                                                                <xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/>
                                                                            </a> 
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </div>
                                                                <div class="list-holder" id="list-{$vid}">
                                                                    <ul class="nav nav-list tree" rel="list-{$vid}">
                                                                        <xsl:call-template name="isActive">
                                                                            <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                                                        </xsl:call-template>
                                                                        <xsl:call-template name="recorTreeMenu">
                                                                            <xsl:with-param name="treeMenu" select="//./table/value/row"/>
                                                                            <xsl:with-param name="id" select="$vid"/>
                                                                            <xsl:with-param name="name" select="$name"/>
                                                                            <xsl:with-param name="target" select="$target"/>
                                                                            <xsl:with-param name="target_fields" select="$target_fields"/>
                                                                            <xsl:with-param name="tooltip" select="$tooltip"/>
                                                                            <xsl:with-param name="parser" select="$parser"/>
                                                                        </xsl:call-template>
                                                                    </ul>
                                                                </div>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                               <a text="{../*[name() = concat($name,'_link_desc')]}">
                                                                    <xsl:call-template name="setTarget">
                                                                        <xsl:with-param name="parser" select="$parser"/>
                                                                        <xsl:with-param name="target" select="$target"/>
                                                                        <xsl:with-param name="target_fields" select="$target_fields"/>
                                                                        <xsl:with-param name="class" select="'form-link holder'"/>
                                                                        <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                                                    	<xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                                    </xsl:call-template>
                                                                    
                                                                    <xsl:call-template name="setTooltipTreemenu">
                                                                        <xsl:with-param name="tooltip" select="$tooltip"/>
                                                                        <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                                    </xsl:call-template>
                                                                    <i class="fa fa-angle-right icon" aria-hidden="true"></i>
                                                                    <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                                </a> 
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </li>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="../*[name() = concat($name,'_child')] &gt; 0">
                                            <div class="tree-toggler nav-header" rel="list-{$id}">
                                                <xsl:call-template name="isActive">
                                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="isSet">
                                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                                </xsl:call-template>
                                                <span class="icon">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                                </span>
                                                <xsl:choose>
                                                    <xsl:when test="../*[name() = concat($name,'_link')] != ''">
                                                        <a text="{../*[name() = concat($name,'_link_desc')]}">
                                                            <xsl:call-template name="setTarget">
                                                                <xsl:with-param name="parser" select="$parser"/>
                                                                <xsl:with-param name="target" select="$target"/>
                                                                <xsl:with-param name="target_fields" select="$target_fields"/>
                                                                <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                                                <xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                            </xsl:call-template>

                                                            <xsl:call-template name="setTooltipTreemenu">
                                                                <xsl:with-param name="tooltip" select="$tooltip"/>
                                                                <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                            </xsl:call-template>
                                                            <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <a class="form-link" text="{../*[name() = concat($name,'_link_desc')]}">
                                                            <xsl:call-template name="setTooltipTreemenu">
                                                                <xsl:with-param name="tooltip" select="$tooltip"/>
                                                                <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                            </xsl:call-template>
                                                            <xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/>
                                                        </a> 
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                            <div class="list-holder" id="list-{$id}"></div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a text="{../*[name() = concat($name,'_link_desc')]}">
                                                <xsl:call-template name="setTarget">
                                                    <xsl:with-param name="parser" select="$parser"/>
                                                    <xsl:with-param name="target" select="$target"/>
                                                    <xsl:with-param name="target_fields" select="$target_fields"/>
                                                    <xsl:with-param name="class" select="'form-link holder'"/>
                                                    <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                                    <xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                                </xsl:call-template>

                                                <xsl:call-template name="setTooltipTreemenu">
                                                    <xsl:with-param name="tooltip" select="$tooltip"/>
                                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                                </xsl:call-template>
                                                <i class="fa fa-angle-right icon" aria-hidden="true"></i>
                                                <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                            </a> 
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </li>
                    </xsl:if>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="isActive">
        <xsl:param name="text" />
        <xsl:if test="$text = 'true'">
            <xsl:attribute name="type">active</xsl:attribute>
        </xsl:if>
    </xsl:template>

    <xsl:template name="isSet">
        <xsl:param name="text" />
        <xsl:if test="$text = 'true'">
            <xsl:attribute name="class">tree-toggler nav-header set</xsl:attribute>
        </xsl:if>
    </xsl:template>

    <xsl:template name="isActiveField">
        <xsl:param name="text" />
        <xsl:if test="$text = 'true'">
            <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
    </xsl:template>

    <xsl:template name="setTooltipTreemenu">
        <xsl:param name="tooltip"  select="'false'"/>
        <xsl:param name="text"/>
        <xsl:if test="$tooltip = 'true'">
            <xsl:attribute name="data-toggle"><xsl:value-of select="'tooltip'"/></xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$text"/></xsl:attribute>
            <xsl:if test="position() = 1">
                <xsl:attribute name="data-placement"><xsl:value-of select="'bottom'"/></xsl:attribute>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="setTarget">
        <xsl:param name="parser"  select="'false'"/>
        <xsl:param name="target"  select="'_self'"/>
        <xsl:param name="target_fields"/>
        <xsl:param name="href"/>
        <xsl:param name="haslink" select="false()"/>
        <xsl:param name="class" select="'form-link'"/>
        
        <xsl:choose>
            <xsl:when test="$parser = 'true'">
                <xsl:attribute name="class"><xsl:value-of select="'lookup-parser'"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
            	<xsl:if test="not($haslink)">
	                <xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute>
	                <xsl:if test="$href != ''">
	                    <xsl:attribute name="tree-target"><xsl:value-of select="$target"/></xsl:attribute>
	                    <xsl:attribute name="href"><xsl:value-of select="$href"/></xsl:attribute>
	                    <xsl:if test="$target = 'changesrc'">
	                        <xsl:attribute name="target-fields"><xsl:value-of select="$target_fields"/></xsl:attribute>
	                    </xsl:if>
	                </xsl:if>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:apply-templates mode="contextparam" select="../context-menu"/>
    </xsl:template>

    <xsl:template name="contextparam" mode="contextparam" match="context-menu">
        <xsl:attribute name="CTX_PARAM_COUNT">
            <xsl:value-of select="count(param)" />
        </xsl:attribute>

        <xsl:attribute name="CTX_FORM">
            <xsl:value-of select="ctx_form" />
        </xsl:attribute>

        <xsl:attribute name="CTX_FORM_IDX">
            <xsl:value-of select="ctx_form_idx" />
        </xsl:attribute>

        <xsl:for-each select="param">
            <xsl:attribute name="CTX_P{position()}">
                <xsl:value-of select="." />
            </xsl:attribute>
        </xsl:for-each>
    </xsl:template>


    <xsl:template name="recorTreeMenu">
        <xsl:param name="treeMenu"/>
        <xsl:param name="id"/>
        <xsl:param name="name"/>
        <xsl:param name="target" select="'_self'"/>
        <xsl:param name="target_fields"/>
        <xsl:param name="tooltip" select="'false'"/>
        <xsl:param name="parser" select="'false'"/>
        <xsl:variable name="parent" select="concat($name,'_parent')"/>
        <xsl:for-each select="$treeMenu/*[$parent = name()]">
       
            <xsl:if test="text() = $id">
                <xsl:variable name="parentId" select="../*[name() = concat($name,'_tmid')]"/>
                <li id="{$parentId}" text="{../*[name() = concat($name,'_link_desc')]}">
                    <i class="fa fa-check-square-o activeicon" aria-hidden="true"></i>
                    <xsl:choose>
                        <xsl:when test="$treeMenu/*[$parent = name()]/text() = $parentId  or ../*[name() = concat($name,'_child')] &gt; 0">
                            <div class="tree-toggler nav-header" rel="list-{$parentId}">
                                <xsl:call-template name="isActive">
                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                </xsl:call-template>
                                <xsl:call-template name="isSet">
                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                </xsl:call-template>
                                <span class="icon">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                </span>
                                <xsl:choose>
                                    <xsl:when test="../*[name() = concat($name,'_link')] != ''">
                                        <a text="{../*[name() = concat($name,'_link_desc')]}">
                                            <xsl:call-template name="setTarget">
                                                <xsl:with-param name="parser" select="$parser"/>
                                                <xsl:with-param name="target" select="$target"/>
                                                <xsl:with-param name="target_fields" select="$target_fields"/>
                                                <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                    			<xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                            </xsl:call-template>

                                            <xsl:call-template name="setTooltipTreemenu">
                                                <xsl:with-param name="tooltip" select="$tooltip"/>
                                                <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                            </xsl:call-template>
                                            <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <a class="form-link" text="{../*[name() = concat($name,'_link_desc')]}">
                                            <xsl:call-template name="setTarget">
                                                <xsl:with-param name="parser" select="$parser"/>
                                    			<xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                            </xsl:call-template>

                                            <xsl:call-template name="setTooltipTreemenu">
                                                <xsl:with-param name="tooltip" select="$tooltip"/>
                                                <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                            </xsl:call-template>
                                            <xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/>
                                        </a> 
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                            <div class="list-holder" id="list-{$parentId}">
                                <ul class="nav nav-list tree" rel="list-{$parentId}">
                                    <xsl:call-template name="isActive">
                                        <xsl:with-param name="text" select="../*[name() = concat($name,'_active')]"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="recorTreeMenu">
                                        <xsl:with-param name="treeMenu" select="$treeMenu"/>
                                        <xsl:with-param name="id" select="$parentId"/>
                                        <xsl:with-param name="name" select="$name"/>
                                        <xsl:with-param name="target" select="$target"/>
                                        <xsl:with-param name="target_fields" select="$target_fields"/>
                                        <xsl:with-param name="tooltip" select="$tooltip"/>
                                        <xsl:with-param name="parser" select="$parser"/>
                                    </xsl:call-template>
                                </ul>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <a text="{../*[name() = concat($name,'_link_desc')]}">
                                <xsl:call-template name="setTarget">
                                    <xsl:with-param name="parser" select="$parser"/>
                                    <xsl:with-param name="target" select="$target"/>
                                    <xsl:with-param name="target_fields" select="$target_fields"/>
                                    <xsl:with-param name="class" select="'form-link holder'"/>
                                    <xsl:with-param name="href" select="../*[name() = concat($name,'_link')]"/>
                                    <xsl:with-param name="haslink" select="not(../*[name() = concat($name,'_link')])"/>
                                </xsl:call-template>

                                <xsl:call-template name="setTooltipTreemenu">
                                    <xsl:with-param name="tooltip" select="$tooltip"/>
                                    <xsl:with-param name="text" select="../*[name() = concat($name,'_link_desc')]"/>
                                </xsl:call-template>
                                <i class="fa fa-angle-right icon" aria-hidden="true"></i>
                                <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                            </a>
                        </xsl:otherwise>
                    </xsl:choose>
                </li>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>