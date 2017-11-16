<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    
    <xsl:param name="jsEnter">
        <xsl:text>&#10;</xsl:text>
    </xsl:param>

    <xsl:variable name="tab">
        <xsl:text>&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab2">
        <xsl:text>&#9;&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab3">
        <xsl:text>&#9;&#9;&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab4">
        <xsl:text>&#9;&#9;&#9;&#9;</xsl:text>
    </xsl:variable>
    <!-- <xsl:variable name="newline">
            <xsl:text>&#x0A;</xsl:text>
        </xsl:variable> -->
    <xsl:variable name="newline">
        <xsl:value-of select="$jsEnter"/>
    </xsl:variable>

    <xsl:key name="unique_instance" match="//content/*" use="local-name()"/>
    
    <xsl:variable name="sql_chart3d">
        <xsl:text>SELECT 'Eixo de Y' EixoY,'Eixo de X' EixoX, 1000 Valor From dual</xsl:text>
    </xsl:variable>

    <xsl:variable name="sql_chart2d">
        <xsl:text>SELECT 'Eixo de X' EixoX, 1000 Valor From dual</xsl:text>
    </xsl:variable>

    <xsl:variable name="double_quotes">"</xsl:variable>

    <xsl:variable name="simple_quotes">'</xsl:variable>

    <xsl:variable name="import_config">
        <xsl:text>import nosi.core.config.Config;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_components">
        <xsl:text>import nosi.core.gui.components.*;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_fields">
        <xsl:text>import nosi.core.gui.fields.*;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_view">
        <xsl:text>import nosi.core.webapp.View;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_model">
        <xsl:text>import nosi.core.webapp.Model;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_array_list">
        <xsl:text>import java.util.ArrayList;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_list">
        <xsl:text>import java.util.List;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_separator_list">
        <xsl:text>import nosi.core.gui.components.IGRPSeparatorList.Pair;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_separator_list_annotation">
        <xsl:text>import nosi.core.webapp.SeparatorList;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_controller">
        <xsl:text>import nosi.core.webapp.Controller;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_exception">
        <xsl:text>import java.io.IOException;</xsl:text>
        <xsl:value-of select="$newline"/>
        <xsl:text>import nosi.core.webapp.Core;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_response">
        <xsl:text>import nosi.core.webapp.Response;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_igrp">
        <xsl:text>import nosi.core.webapp.Igrp;</xsl:text>
    </xsl:variable>

    <xsl:variable name="import_annotations">
        <xsl:text>import nosi.core.webapp.RParam;</xsl:text>
    </xsl:variable>

    <xsl:variable name="base_import">
        <xsl:text>import nosi.webapps.</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="preserve_url" select="rows/plsql/preserve_url"/>
    <xsl:variable name="begin_reserve_code_controller_actions" select="'/*---- Insert your actions here... ----*/'"/>
    <xsl:variable name="begin_reserve_code_controller_import" select="'/*---- Import your packages here... ----*/'"/>
    <xsl:variable name="begin_reserve_code_controller_on_action" select="'/*---- Insert your code here... ----*/'"/>
    <xsl:variable name="end_reserve_code" select="'/*----#END-PRESERVED-AREA----*/'"/>
    <xsl:variable name="app_name">
        <xsl:value-of select="rows/app"/>
    </xsl:variable>
    <xsl:variable name="page_name">
        <xsl:value-of select="rows/page"/>
    </xsl:variable>
    <xsl:variable name="class_name">
        <xsl:value-of select="rows/plsql/package_html"></xsl:value-of>
    </xsl:variable>
    <xsl:variable name="page">
        <xsl:call-template name="lowerCase">
            <xsl:with-param name="text">
                <xsl:value-of select="rows/plsql/package_html"></xsl:value-of>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="app">
        <xsl:call-template name="lowerCase">
            <xsl:with-param name="text">
                <xsl:value-of select="rows/app"></xsl:value-of>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="package_name">
        <xsl:value-of select="concat(rows/plsql/package_db,'.',$page,';')"></xsl:value-of>
    </xsl:variable>
    <xsl:variable name="package_import_name">
        <xsl:value-of select="concat('import ',rows/plsql/package_db)"/>
    </xsl:variable>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <xsl:template name="CamelCaseWord">
        <xsl:param name="text"/>
        <xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
        <xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
    </xsl:template>
    <xsl:template name="gen-className">
        <xsl:param name="className"/>
        <xsl:variable name="tableName_">
            <xsl:call-template name="CamelCaseWord">
                <xsl:with-param name="text">
                    <xsl:value-of select="$className"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$tableName_ = 'List'">
                <xsl:value-of select="concat($tableName_,'1')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$tableName_"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="upperCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $smallcase, $uppercase)"/>
    </xsl:template>
    <xsl:template name="lowerCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $uppercase, $smallcase)"/>
    </xsl:template>
    <!-- get class name instance -->
    <xsl:template name="typeClass">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type='form'">
                <xsl:value-of select="'IGRPForm'" />
            </xsl:when>
            <xsl:when test="$type='table'">
                <xsl:value-of select="'IGRPTable'" />
            </xsl:when>
            <xsl:when test="$type='formlist'">
                <xsl:value-of select="'IGRPFormList'" />
            </xsl:when>
            <xsl:when test="$type='box'">
                <xsl:value-of select="'IGRPBox'" />
            </xsl:when>
            <xsl:when test="$type='chart'">
                <xsl:value-of select="'IGRPChart'" />
            </xsl:when>
            <xsl:when test="$type='circlestatbox'">
                <xsl:value-of select="'IGRPCircleStatBox'" />
            </xsl:when>
            <xsl:when test="$type='filter'">
                <xsl:value-of select="'IGRPFilter'" />
            </xsl:when>
            <xsl:when test="$type='fingerprint'">
                <xsl:value-of select="'IGRPFingerPrint'" />
            </xsl:when>
            <xsl:when test="$type='paragraph'">
                <xsl:value-of select="'IGRPParagraph'" />
            </xsl:when>
            <xsl:when test="$type='quickbuttonbox'">
                <xsl:value-of select="'IGRPQuickButtonBox'" />
            </xsl:when>
            <xsl:when test="$type='sectionheader'">
                <xsl:value-of select="'IGRPSectionHeader'" />
            </xsl:when>
            <xsl:when test="$type='separatorlist'">
                <xsl:value-of select="'IGRPSeparatorList'" />
            </xsl:when>
            <xsl:when test="$type='smallbox'">
                <xsl:value-of select="'IGRPSmallBox'" />
            </xsl:when>
            <xsl:when test="$type='statbox'">
                <xsl:value-of select="'IGRPStartBox'" />
            </xsl:when>
            <xsl:when test="$type='tabcontent'">
                <xsl:value-of select="'IGRPTabContent'" />
            </xsl:when>
            <xsl:when test="$type='view'">
                <xsl:value-of select="'IGRPView'" />
            </xsl:when>
            <xsl:when test="$type='mapchart'">
                <xsl:value-of select="'IGRPMapChart'" />
            </xsl:when>
            <xsl:when test="$type='map'">
                <xsl:value-of select="'IGRPMapEsri'" />
            </xsl:when>
            <xsl:when test="$type='iframe'">
                <xsl:value-of select="'IGRPIframe'" />
            </xsl:when>
            <xsl:when test="$type='video'">
                <xsl:value-of select="'IGRPVideo'" />
            </xsl:when>
            <xsl:when test="$type='toolsbar'">
                <xsl:value-of select="'IGRPToolsBar'" />
            </xsl:when>
            <xsl:when test="$type='verticalmenu'">
                <xsl:value-of select="'IGRPVerticalMenu'" />
            </xsl:when>
            <xsl:when test="$type='button'">
                <xsl:value-of select="'IGRPButton'" />
            </xsl:when>
            <xsl:when test="$type='calendar'">
                <xsl:value-of select="'IGRPCalendar'" />
            </xsl:when>
            <xsl:when test="$type='carousel'">
                <xsl:value-of select="'IGRPCarousel'" />
            </xsl:when>
            <xsl:when test="$type='panels'">
                <xsl:value-of select="'IGRPPanel'" />
            </xsl:when>
            <xsl:when test="$type='treemenu'">
                <xsl:value-of select="'IGRPTreeMenu'" />
            </xsl:when>
            <xsl:when test="$type='tabmenu'">
                <xsl:value-of select="'IGRPMenu'" />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>
    <xsl:template name="replace-all">
        <xsl:param name="text" />
        <xsl:param name="replace" />
        <xsl:param name="by" />
        <xsl:choose>
            <xsl:when test="$text = '' or $replace = ''or not($replace)" >
                <!-- Prevent this routine from hanging -->
                <xsl:value-of select="$text" />
            </xsl:when>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)" />
                <xsl:value-of select="$by" />
                <xsl:call-template name="replace-all">
                    <xsl:with-param name="text" select="substring-after($text,$replace)" />
                    <xsl:with-param name="replace" select="$replace" />
                    <xsl:with-param name="by" select="$by" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- begin reserve_code tmpl -->
    <xsl:template name="begin_reserve_code_action">
        <xsl:param name="type"/>
        <xsl:param name="url"/>
        <xsl:variable name="typeUpper">
            <xsl:call-template name="upperCase">
                <xsl:with-param name="text" select="$type"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:text>/*----#START-PRESERVED-AREA(</xsl:text>
        <xsl:value-of select="$typeUpper"/>
        <xsl:text>)----*/</xsl:text>
        <xsl:text>/*----#gen(preserve_code,</xsl:text>
        <xsl:value-of select="$url"/>
        <xsl:text>)/#----*/</xsl:text>
    </xsl:template>
    <!-- end reserve_code tmpl -->
    <xsl:template name="end_reserve_code_action">
        <xsl:param name="type"/>
        <xsl:variable name="typeUpper">
            <xsl:call-template name="upperCase">
                <xsl:with-param name="text" select="$type"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:text>/*----#END-PRESERVED-AREA----*/</xsl:text>
    </xsl:template>
</xsl:stylesheet>