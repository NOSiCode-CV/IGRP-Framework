<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
                <style></style>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu" />
                <form>
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " item-name="sectionheader_1">
                                                        <h1>
                                                            <xsl:value-of  select="rows/content/sectionheader_1/fields/text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-9">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/paragraph_1">
                                                    <div class="gen-container-item " item-name="paragraph_1">
                                                        <div class="box-body">
                                                            <p>
                                                                <xsl:value-of  select="rows/content/paragraph_1/fields/text/value" disable-output-escaping="yes" />
                                                            </p>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder gen-container-item " gen-fields=".btns-holder a.btn" item-name="toolsbar_1" gen-structure="toolsbar">
                                                        <div role="group" class="btns-holder  btn-group-justified">
                                                            <xsl:apply-templates  select="rows/content/toolsbar_1" mode="gen-buttons" />
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/tabcontent_1">
                                                    <div class="gen-tab-holder nav-tabs-custom gen-container-item " item-name="tabcontent_1" tab-template="default">
                                                        <ul class="nav nav-tabs">
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='separator_list']">
                                                                <li class="active gen-fields-holder" rel="tab-tabcontent_1-separator_list" item-name="separator_list">
                                                                    <a aria-expanded="true" href="#tab-tabcontent_1-separator_list" data-toggle="tab">
                                                                        <i class="fa fa-list-alt" />
                                                                        <span gen-lbl-setter="true">
                                                                            <xsl:value-of select="rows/content/tabcontent_1/item[@name='separator_list']/title" />
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='charts']">
                                                                <li class=" gen-fields-holder" rel="tab-tabcontent_1-charts" item-name="charts">
                                                                    <a aria-expanded="true" href="#tab-tabcontent_1-charts" data-toggle="tab">
                                                                        <i class="fa fa-area-chart" />
                                                                        <span gen-lbl-setter="true">
                                                                            <xsl:value-of select="rows/content/tabcontent_1/item[@name='charts']/title" />
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </xsl:if>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='separator_list']">
                                                                <div class="tab-pane gen-rows-holder active" rel="tab-tabcontent_1-separator_list" id="tab-tabcontent_1-separator_list">
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-12">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/separatorlist_1">
                                                                                    <div class="box gen-container-item " item-name="separatorlist_1">
                                                                                        <div class="box-body IGRP-separatorlist" dialog="false" tag="separatorlist_1">
                                                                                            <div class="splist-form-holder">
                                                                                                <div role="form" class="splist-form" gen-id="drop-zone" gen-field-template="form.field">
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="text_1">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/text_1/@name}">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label" />
                                                                                                                </span>
                                                                                                            </label>
                                                                                                            <input name="{rows/content/separatorlist_1/fields/text_1/@name}" type="text" class="form-control" value="{rows/content/separatorlist_1/fields/text_1/value}" id="{rows/content/separatorlist_1/fields/text_1/@name}" maxlength="30"></input>
                                                                                                        </div>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-type="email" item-name="email_1">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/email_1/@name}">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label" />
                                                                                                                </span>
                                                                                                            </label>
                                                                                                            <input name="{rows/content/separatorlist_1/fields/email_1/@name}" type="email" class="form-control" value="{rows/content/separatorlist_1/fields/email_1/value}" id="{rows/content/separatorlist_1/fields/email_1/@name}" maxlength="30"></input>
                                                                                                        </div>
                                                                                                    </xsl:if>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                                                <table class="table table-striped gen-data-table" rel="T_separatorlist_1" id="separatorlist_1">
                                                                                                    <thead>
                                                                                                        <tr gen-id="drop-zone" gen-field-template="th">
                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                                                                <xsl:if test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                                                                                    <th item-name="text_1" align="">
                                                                                                                        <span gen-lbl-setter="">
                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label" />
                                                                                                                        </span>
                                                                                                                    </th>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                                                                                <xsl:if test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                                                                                    <th item-name="email_1" align="">
                                                                                                                        <span gen-lbl-setter="">
                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label" />
                                                                                                                        </span>
                                                                                                                    </th>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <th class="table-btn">
                                                                                                                <span class="table-row-add btn">
                                                                                                                    <i class="fa fa-plus" />
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                                                            <tr gen-id="drop-zone" gen-field-template="td">
                                                                                                                <input name="p_separatorlist_1_id" type="hidden" class="sl-row-id" value="{separatorlist_1_id}" />
                                                                                                                <xsl:if test="text_1">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                                                                                            <td class="text" data-title="{../../../fields/text_1/label}" data-row="{position()}" field="text_1">
                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                    <xsl:value-of select="text_1_desc" disable-output-escaping="yes" />
                                                                                                                                </span>
                                                                                                                                <input name="p_text_1_fk" type="hidden" value="{text_1}" />
                                                                                                                                <input name="p_text_1_fk_desc" type="hidden" value="{text_1_desc}" />
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input name="p_text_1_fk" type="hidden" value="{text_1}" />
                                                                                                                            <input name="p_text_1_fk_desc" type="hidden" value="{text_1_desc}" />
                                                                                                                        </xsl:otherwise>
                                                                                                                    </xsl:choose>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="email_1">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                                                                                            <td class="email" data-title="{../../../fields/email_1/label}" data-row="{position()}" field="email_1">
                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                    <xsl:value-of select="email_1_desc" disable-output-escaping="yes" />
                                                                                                                                </span>
                                                                                                                                <input name="p_email_1_fk" type="hidden" value="{email_1}" />
                                                                                                                                <input name="p_email_1_fk_desc" type="hidden" value="{email_1_desc}" />
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input name="p_email_1_fk" type="hidden" value="{email_1}" />
                                                                                                                            <input name="p_email_1_fk_desc" type="hidden" value="{email_1_desc}" />
                                                                                                                        </xsl:otherwise>
                                                                                                                    </xsl:choose>
                                                                                                                </xsl:if>
                                                                                                                <td class="table-btn" data-row="{position()}">
                                                                                                                    <span class="table-row-edit btn" rel="separatorlist_1">
                                                                                                                        <i class="fa fa-pencil" />
                                                                                                                    </span>
                                                                                                                    <span class="table-row-remove btn" rel="separatorlist_1">
                                                                                                                        <i class="fa fa-times" />
                                                                                                                    </span>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </xsl:for-each>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </xsl:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='charts']">
                                                                <div class="tab-pane gen-rows-holder " rel="tab-tabcontent_1-charts" id="tab-tabcontent_1-charts">
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-4">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/chart_1">
                                                                                    <div class="box gen-container-item " item-name="chart_1" gen-structure="graphic">
                                                                                        <xsl:call-template name="box-header">
                                                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title" />
                                                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                                                        </xsl:call-template>
                                                                                        <div class="box-body">
                                                                                            <xsl:call-template name="igrp-graph">
                                                                                                <xsl:with-param name="table" select="rows/content/chart_1" />
                                                                                                <xsl:with-param name="chart_type" select="'line'" />
                                                                                                <xsl:with-param name="height" select="'250'" />
                                                                                                <xsl:with-param name="title" select="'Chart'" />
                                                                                                <xsl:with-param name="url" select="rows/content/chart_1/url" />
                                                                                            </xsl:call-template>
                                                                                        </div>
                                                                                    </div>
                                                                                </xsl:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="gen-column col-md-4">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/chart_2">
                                                                                    <div class="box gen-container-item " item-name="chart_2" gen-structure="graphic">
                                                                                        <xsl:call-template name="box-header">
                                                                                            <xsl:with-param name="title" select="rows/content/chart_2/@title" />
                                                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                                                        </xsl:call-template>
                                                                                        <div class="box-body">
                                                                                            <xsl:call-template name="igrp-graph">
                                                                                                <xsl:with-param name="table" select="rows/content/chart_2" />
                                                                                                <xsl:with-param name="chart_type" select="'line'" />
                                                                                                <xsl:with-param name="height" select="'250'" />
                                                                                                <xsl:with-param name="title" select="'Chart'" />
                                                                                                <xsl:with-param name="url" select="rows/content/chart_2/url" />
                                                                                            </xsl:call-template>
                                                                                        </div>
                                                                                    </div>
                                                                                </xsl:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="gen-column col-md-4">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/chart_3">
                                                                                    <div class="box gen-container-item " item-name="chart_3" gen-structure="graphic">
                                                                                        <xsl:call-template name="box-header">
                                                                                            <xsl:with-param name="title" select="rows/content/chart_3/@title" />
                                                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                                                        </xsl:call-template>
                                                                                        <div class="box-body">
                                                                                            <xsl:call-template name="igrp-graph">
                                                                                                <xsl:with-param name="table" select="rows/content/chart_3" />
                                                                                                <xsl:with-param name="chart_type" select="'line'" />
                                                                                                <xsl:with-param name="height" select="'250'" />
                                                                                                <xsl:with-param name="title" select="'Chart'" />
                                                                                                <xsl:with-param name="url" select="rows/content/chart_3/url" />
                                                                                            </xsl:call-template>
                                                                                        </div>
                                                                                    </div>
                                                                                </xsl:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </xsl:if>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.js"></script>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js"></script>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1464267795522"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1464267795522"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1464267795522"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1464267795522"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1464267795522"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1464267795522"/>
</xsl:stylesheet>