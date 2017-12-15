<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--Generate TOOLBAR GROUP-->
    <xsl:template name="generateBodyList">
        <xsl:param name="title" />
        <xsl:variable name="procName" select="'list'" />
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$entertab"/>
        <xsl:text>-----</xsl:text>
        <xsl:value-of
            select="concat($procName,': main procedure')"/>
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'load parameters into record'"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>LOAD</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_core_debug"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:text>ACTION DB:</xsl:text>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.DML_SELECT_ALL</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.DML_SELECT_ALL</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:call-template name="genCallListTabMenu" />
        <xsl:call-template name="genCallListToolsbar" />
        <xsl:call-template name="genCallListForm" />
        <xsl:call-template name="genCallListTable" />
        <xsl:call-template name="genCallListChart" />
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text>
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="concat(rows/page,'.',rows/plsql/action,'.title')"/>
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" />
            <xsl:value-of select="$enter2tab" />
            <xsl:value-of select="$tab" />
            <xsl:value-of select="$tab" />
            <xsl:value-of select="$tab" />
            <xsl:value-of select="$tab" />
            <xsl:value-of select="$tab" />
            <xsl:text>p_text=></xsl:text>
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="$title" />
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="$concat" />
            <xsl:value-of select="$pkg_type" />
            <xsl:text>.get_description_dml(</xsl:text>
            <xsl:value-of select="$pkg_core" />
            <xsl:text>.get_action</xsl:text>
            <xsl:text>)</xsl:text>
            <xsl:text>)</xsl:text>
        </xsl:variable>
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'invoke xml engine for igrp2.2'"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.XML_2DOT2(</xsl:text>
        <xsl:text>p_title=></xsl:text>
        <xsl:value-of select="$label"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="genCallListToolsbar">
        <xsl:for-each select="$all_toolsbars_html">
            <xsl:variable name="name">
                <xsl:choose>
                    <xsl:when test="name()='tools-bar'">
                        <xsl:value-of select="local-name(..)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="name()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="genCallList">
                <xsl:with-param name="tag" select="$name"/>
                <xsl:with-param name="type" select="'toolsbar'" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="genCallListForm">
        <xsl:for-each select="$all_callListForm">
            <xsl:call-template name="genCallList">
                <xsl:with-param name="tag" select="name()"/>
                <xsl:with-param name="type" select="'form'" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="genCallListTabMenu">
        <xsl:for-each select="rows/content/*[@type = 'tabmenu']">
            <xsl:call-template name="genCallList">
                <xsl:with-param name="tag" select="name()"/>
                <xsl:with-param name="type" select="'tabmenu'" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="genCallListTable">
        <xsl:for-each select="$all_fields_list">
            <xsl:call-template name="genCallList">
                <xsl:with-param name="tag" select="name()"/>
                <xsl:with-param name="type" select="'list'" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="genCallListChart">
        <xsl:if test="rows/content/*[@type = 'chart']">
            <xsl:call-template name="genCallList">
                <xsl:with-param name="tag" select="'chart'"/>
                <xsl:with-param name="type" select="'chart'" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template name="genCallList">
        <xsl:param name="tag" />
        <xsl:param name="type" />

        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="concat('invoke ',$space, $tag,$space,'type',$space,@xml-type)"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>

        <xsl:choose>
            <xsl:when test="$type='toolsbar'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>TOOLBAR_</xsl:text>
                <xsl:value-of select="$tag"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="$pkg_type_toolsbar"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="$quotes"/>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$quotes"/>
                <xsl:text>))</xsl:text>
                <xsl:value-of select="$endline"/>
            </xsl:when>
            

            <xsl:when test="$type='form' or @xml-type = 'form' or $type ='iframe'">

                <xsl:variable name="label">
                    <xsl:value-of select="$pkg_core"/>
                    <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
                    <xsl:value-of select="@code"/><xsl:value-of select="$quotes" />
                    <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text> 
                    <xsl:value-of select="$quotes" />
                    <xsl:value-of select="@title" />
                    <xsl:value-of select="$quotes" />   
                    <xsl:text>)</xsl:text>
                </xsl:variable>

                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>FIELD_</xsl:text>
                <xsl:value-of select="$tag"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="$pkg_type_form"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="$quotes"/>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$quotes"/>
                <xsl:text>).fields)</xsl:text>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$pkg_type_form"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="$quotes"/>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$quotes"/>
                <xsl:text>)</xsl:text>
                <xsl:text>.title:=</xsl:text><xsl:value-of select="$label"/>
                <xsl:value-of select="$endline"/>

            </xsl:when>


            <xsl:when test="$type='tabmenu'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>TABMENU_</xsl:text>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$pkg_type_tabmenu"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="$quotes"/>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$quotes"/>
                <xsl:text>):=</xsl:text>
                <xsl:value-of select="$pkg_type"/>
                <xsl:text>.tbl_tabmenu</xsl:text>
                <xsl:value-of select="$endline"/>
            </xsl:when>

            <xsl:when test="$type='list'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>LIST_</xsl:text>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$endline"/>
            </xsl:when>

            <xsl:when test="$type='chart'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>FIELD_</xsl:text>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$pkg_type_chart"/>
                <xsl:text>:=</xsl:text>
                <xsl:value-of select="$pkg_type"/>
                <xsl:text>.tbl_chart</xsl:text>
                <xsl:value-of select="$endline"/>
            </xsl:when>

        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>