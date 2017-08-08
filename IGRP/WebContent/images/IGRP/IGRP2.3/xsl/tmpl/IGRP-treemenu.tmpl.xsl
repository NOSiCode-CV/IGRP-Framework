<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="target" select="'_self'"/>
    <xsl:param name="id"/>
    <xsl:param name="name"/>
    <xsl:param name="class" select="'tree'"/>

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
            </xsl:call-template>
        </ul>
    </xsl:template>

    <xsl:template name="treemenu" match="*" mode="treemenu">
        <xsl:param name="target" select="'_self'"/>
        <xsl:param name="style" select="'default'"/>
        <xsl:param name="toggle" select="'live'"/>
        <xsl:param name="onload" select="'false'"/>
        <xsl:param name="package"/>
        <xsl:variable name="name" select="local-name(.)"/>
        <xsl:variable name="parentId" select="concat($name,'_parent')"/>
        <div class="box-tm box-body" app="{//rows/app}" package-db="{$package}" themes="{$style}" data-toggle="{$toggle}" name="{$name}" id="tm_{$name}">
            <xsl:if test="$toggle = 'remote'">
                <xsl:attribute name="target"><xsl:value-of select="$target"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="$onload = 'true'">
                <xsl:attribute name="onload"><xsl:value-of select="$onload"/></xsl:attribute>
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
                                                <a tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
                                                    <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                               <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span> 
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
                                                    <li id="{$vid}">
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
                                                                            <a tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
                                                                                <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                                            </a>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                           <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span> 
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
                                                                        </xsl:call-template>
                                                                    </ul>
                                                                </div>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                               <a class="holder" tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
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
                                                        <a tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
                                                            <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                       <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span> 
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                            <div class="list-holder" id="list-{$id}"></div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a class="holder" tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
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

   <xsl:template name="recorTreeMenu">
        <xsl:param name="treeMenu"/>
        <xsl:param name="id"/>
        <xsl:param name="name"/>
        <xsl:param name="target" select="'_self'"/>
        <xsl:variable name="parent" select="concat($name,'_parent')"/>
        <xsl:for-each select="$treeMenu/*[$parent = name()]">

            <xsl:if test="text() = $id">
                <xsl:variable name="parentId" select="../*[name() = concat($name,'_tmid')]"/>
                <li id="{$parentId}">
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
                                        <a tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
                                            <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <span><xsl:value-of select="../*[name() = concat($name,'_link_desc')]"/></span> 
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
                                    </xsl:call-template>
                                </ul>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <a class="holder" tree-target="{$target}" href="{../*[name() = concat($name,'_link')]}">
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