<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://exslt.org/common" exclude-result-prefixes="ext" version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes"  	encoding="UTF-8" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <xsl:variable name="form" select="rows/content/form" />
        <xsl:variable name="formFields" select="$form/label/*[not(@rel)][not(@container='true')][not(@type='list')]" />
        <xsl:variable name="formLength" select="count($formFields)" />
        <xsl:variable name="oContainers" select="$form/label/*[@container='true']" />
        <xsl:variable name="oContainersLength" select="count($oContainers)" />
        <xsl:variable name="fToolsBar" select="$form/tools-bar" />
        <xsl:variable name="filter" select="rows/content/filter" />
        <xsl:variable name="filterFields" select="$filter/label/*" />
        <xsl:variable name="table" select="rows/content/table" />
        <xsl:variable name="tableFields" select="$table/label/*" />
        <xsl:variable name="hasLeft" select="rows/content/menu/group/@align = 'left' or rows/content/*[@align='left']" />
        <xsl:variable name="hasRight" select="rows/content/menu/group/@align = 'right' or rows/content/*[@align='right']" />
        <xsl:variable name="mainColumnClass">
            <xsl:choose>
                <xsl:when test="$hasLeft and $hasRight">col-1-2</xsl:when>
                <xsl:when test="$hasLeft and not($hasRight)">col-9-12</xsl:when>
                <xsl:when test="not($hasLeft) and $hasRight">col-9-12</xsl:when>
                <xsl:otherwise>col-1-1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>[{"columns":[
        <xsl:if test="$hasLeft">
            <xsl:call-template name="leftAndRight">
                <xsl:with-param name="position" select="'left'" />
            </xsl:call-template>,
        </xsl:if>{"size":"
        <xsl:value-of select="$mainColumnClass" />","containers":
        <xsl:text>[</xsl:text>
        <xsl:if test="rows/content/view">
            <xsl:apply-templates select="rows/content/view" mode="container">
                <xsl:with-param name="type" select="'view'" />
            </xsl:apply-templates>
            <xsl:if test="$formLength &gt; 0 or count($fToolsBar/item) &gt; 0 or $oContainersLength &gt; 0 or $filter or $tableFields">,</xsl:if>
        </xsl:if>
        <xsl:if test="$fToolsBar/item">
            <xsl:variable name="tb-items">
                <xsl:for-each select="$fToolsBar/item">
                    <xsl:element name="{concat('item',position())}">
                        <xsl:attribute name="target">
                            <xsl:value-of select="target" />
                        </xsl:attribute>
                        <xsl:attribute name="type">button</xsl:attribute>
                        <xsl:attribute name="img">
                            <xsl:value-of select="img" />
                        </xsl:attribute>
                        <xsl:value-of select="title" />
                    </xsl:element>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="tbar-items" select="ext:node-set($tb-items)/*" />
            <xsl:apply-templates select="$fToolsBar" mode="container">
                <xsl:with-param name="type" select="'toolsbar'" />
                <xsl:with-param name="fields" select="$tbar-items" />
                <xsl:with-param name="tag" select="'toolsbar'" />
            </xsl:apply-templates>
            <xsl:if test="$formLength &gt; 0 or $oContainersLength &gt; 0 or $filter or $tableFields">,</xsl:if>
        </xsl:if>
        <xsl:if test="$form">
            <xsl:if test="$formLength &gt; 0 and count($formFields) &gt; 0">
                <xsl:apply-templates select="$form" mode="container">
                    <xsl:with-param name="type" select="'form'" />
                    <xsl:with-param name="fields" select="$formFields" />
                </xsl:apply-templates>
                <xsl:if test="$oContainersLength &gt; 0 or $filter or $tableFields">,</xsl:if>
            </xsl:if>
            <xsl:if test="$oContainersLength &gt; 0">
                <xsl:for-each select="$oContainers">
                    <xsl:variable name="tag" select="name()" />
                    <xsl:variable name="type">
                        <xsl:choose>
                            <xsl:when test="@type='list'">table</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@type" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="oContainersFields" select="$form/label/*[@rel=$tag]" />
                    <xsl:if test="count($oContainersFields) &gt; 0">
                        <xsl:apply-templates select="." mode="container">
                            <xsl:with-param name="type" select="$type" />
                            <xsl:with-param name="fields" select="$oContainersFields" />
                        </xsl:apply-templates>
                    </xsl:if>
                    <xsl:if test="position()!=$oContainersLength">,</xsl:if>
                </xsl:for-each>
                <xsl:if test="$filter or $tableFields">,</xsl:if>
            </xsl:if>
        </xsl:if>
        <xsl:if test="$filter">
            <xsl:apply-templates select="." mode="container">
                <xsl:with-param name="type" select="'form'" />
                <xsl:with-param name="fields" select="$filterFields" />
            </xsl:apply-templates>
            <xsl:if test="$tableFields">,</xsl:if>
        </xsl:if>
        <xsl:if test="$tableFields">
            <xsl:apply-templates select="." mode="container">
                <xsl:with-param name="type" select="'table'" />
                <xsl:with-param name="fields" select="$tableFields" />
            </xsl:apply-templates>
        </xsl:if>
        <xsl:text>]</xsl:text>}
        <xsl:if test="$hasRight">,
            <xsl:call-template name="leftAndRight">
                <xsl:with-param name="position" select="'right'" />
            </xsl:call-template>
        </xsl:if>]}]
    </xsl:template>
    <xsl:template name="leftAndRight">
        <xsl:param name="position" />{"size":"col-1-4","containers":[
        <xsl:if test="rows/content/menu/group/@align = $position">{"proprieties":{"title":"
            <xsl:value-of select="rows/content/menu/group/@title" />","code":"
            <xsl:value-of select="rows/content/menu/group/@code" />","type":"tabmenu"},"fields":[
            <xsl:variable name="menuItemsLength" select="count(rows/content/menu/group/item)" />
            <xsl:for-each select="rows/content/menu/group/item">{"tag":"
                <xsl:value-of select="concat(name(),position())" />","label":"
                <xsl:value-of select="title" />","code" :"
                <xsl:value-of select="@code" />"}
                <xsl:if test="position() &lt; $menuItemsLength">,</xsl:if>
            </xsl:for-each>]}
            <xsl:if test="rows/content/*/@align=$position">,</xsl:if>
        </xsl:if>
        <xsl:if test="rows/content/*/@align=$position">
            <xsl:variable name="graphicsLength" select="count(rows/content/*[@align=$position])" />
            <xsl:for-each select="rows/content/*[@align=$position]">
                <xsl:if test="@type='chart'">{"proprieties":{"title":"
                    <xsl:value-of select="caption" />","hasTitle":false,"collapsible":true,"type":"graphic","tag":"
                    <xsl:value-of select="name()" />","height":
                    <xsl:value-of select="height" />,"chart_type":"
                    <xsl:value-of select="chart_type" />"},"fields":[]}
                </xsl:if>
            </xsl:for-each>
        </xsl:if>]}
    </xsl:template>
    <xsl:template name="container" mode="container" match="*">
        <xsl:param name="tag" select="name()" />
        <xsl:param name="type" select="@type" />
        <xsl:param name="fields" select="label/*" />
        <xsl:variable name="count" select="count($fields)" />{"proprieties":{"title":"
        <xsl:value-of select="$tag" />","hasTitle":false,"collapsible":false,"type":"
        <xsl:value-of select="$type" />","tag":"
        <xsl:value-of select="$tag" />"},"fields":[
        <xsl:for-each select="$fields">
            <xsl:apply-templates select="." mode="fields" />
            <xsl:if test="position()!=$count">
                <xsl:text>,</xsl:text>
            </xsl:if>
        </xsl:for-each>],"place":"c"}
    </xsl:template>
    <xsl:template name="fields" mode="fields" match="*">
        <xsl:param name="count" />
        <xsl:variable name="attrsLength" select="count(@*)" />{"label":"
        <xsl:value-of select="." />","tag":"
        <xsl:value-of select="name()" />"
        <xsl:if test="$attrsLength &gt; 0">,
            <xsl:for-each select="@*">
                <xsl:if test="name() != 'rel'">"
                    <xsl:value-of select="name()" />":"
                    <xsl:value-of select="." />"
                    <xsl:if test="position()!=$attrsLength">,</xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>}
    </xsl:template>
</xsl:stylesheet>