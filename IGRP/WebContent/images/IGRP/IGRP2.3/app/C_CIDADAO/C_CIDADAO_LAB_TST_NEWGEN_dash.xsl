<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
                <style></style>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu"/>
                <form>
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/sectionheader_1">
                                                    <section  class="content-header gen-container-item " item-name="sectionheader_1">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-10">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/paragraph_1">
                                                    <div  class="gen-container-item " item-name="paragraph_1">
                                                        <div class="box-body">
                                                            <p>
                                                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if  test="rows/content/tabcontent_1">
                                                    <div  class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" item-name="tabcontent_1">
                                                        <ul class="nav nav-tabs">
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_1']">
                                                                <li item-name="tab_item_1" class="active gen-fields-holder" rel="tab-tabcontent_1-tab_item_1">
                                                                    <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_1">
                                                                        <i class="fa fa-dot-circle-o"/>
                                                                        <span gen-lbl-setter="true">
                                                                            <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab_item_1']/title"/>
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_2']">
                                                                <li item-name="tab_item_2" class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_2">
                                                                    <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_2">
                                                                        <i class="fa fa-dot-circle-o"/>
                                                                        <span gen-lbl-setter="true">
                                                                            <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab_item_2']/title"/>
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </xsl:if>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_1']">
                                                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-tab_item_1" rel="tab-tabcontent_1-tab_item_1">
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-12">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/separatorlist_1">
                                                                                    <div class="box gen-container-item " item-name="separatorlist_1">
                                                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                                                            <div class="splist-form-holder">
                                                                                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="text_1" item-type="text">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/text_1/@name}">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                                                                                </span>
                                                                                                            </label>
                                                                                                            <input type="text" value="{rows/content/separatorlist_1/fields/text_1/value}" class="form-control" id="{rows/content/separatorlist_1/fields/text_1/@name}" name="{rows/content/separatorlist_1/fields/text_1/@name}" maxlength="30"></input>
                                                                                                        </div>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/password_1">
                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="password_1" item-type="password">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/password_1/@name}">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/password_1/label"/>
                                                                                                                </span>
                                                                                                            </label>
                                                                                                            <input type="password" value="{rows/content/separatorlist_1/fields/password_1/value}" class="form-control" id="{rows/content/separatorlist_1/fields/password_1/@name}" name="{rows/content/separatorlist_1/fields/password_1/@name}" maxlength="30"></input>
                                                                                                        </div>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/lookup_1">
                                                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="lookup_1" item-type="lookup">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/lookup_1/@name}">
                                                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/lookup_1/label"/>
                                                                                                            </label>
                                                                                                            <div class="input-group">
                                                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/lookup_1/value}" class="form-control gen-lookup" id="separatorlist_1_lookup_1" name="{rows/content/separatorlist_1/fields/lookup_1/@name}"/>
                                                                                                                <xsl:call-template name="lookup-tool">
                                                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                                                    <xsl:with-param name="name" select="rows/content/separatorlist_1/fields/lookup_1/@name"/>
                                                                                                                    <xsl:with-param name="js_lookup" select="rows/content/separatorlist_1/fields/lookup_1/lookup"/>
                                                                                                                    <xsl:with-param name="input-id" select="'separatorlist_1_lookup_1'"/>
                                                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                                                </xsl:call-template>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </xsl:if>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                                                    <thead>
                                                                                                        <tr gen-id="drop-zone" gen-field-template="th">
                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                                                                <xsl:if test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                                                                                    <th align="" item-name="text_1">
                                                                                                                        <span gen-lbl-setter="">
                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                                                                                        </span>
                                                                                                                    </th>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/password_1">
                                                                                                                <xsl:if test="//rows/content/separatorlist_1/fields/password_1/@table='true'">
                                                                                                                    <th align="" item-name="password_1">
                                                                                                                        <span gen-lbl-setter="">
                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/password_1/label"/>
                                                                                                                        </span>
                                                                                                                    </th>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/lookup_1">
                                                                                                                <xsl:if test="//rows/content/separatorlist_1/fields/lookup_1/@table='true'">
                                                                                                                    <th align="" item-name="lookup_1">
                                                                                                                        <span gen-lbl-setter="">
                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/lookup_1/label"/>
                                                                                                                        </span>
                                                                                                                    </th>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <th class="table-btn">
                                                                                                                <span class="table-row-add btn">
                                                                                                                    <i class="fa fa-plus"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                                                            <tr gen-id="drop-zone" gen-field-template="td">
                                                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                                                <xsl:if test="text_1">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                                                                                            <td field="text_1" data-row="{position()}" data-title="{../../../fields/text_1/label}" class="text">
                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                    <xsl:value-of select="text_1_desc" disable-output-escaping="yes"/>
                                                                                                                                </span>
                                                                                                                                <input type="hidden" name="p_text_1_fk" value="{text_1}"/>
                                                                                                                                <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input type="hidden" name="p_text_1_fk" value="{text_1}"/>
                                                                                                                            <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                                                                                                        </xsl:otherwise>
                                                                                                                    </xsl:choose>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="password_1">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/password_1/@table='true'">
                                                                                                                            <td field="password_1" data-row="{position()}" data-title="{../../../fields/password_1/label}" class="password">
                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                    <xsl:value-of select="password_1_desc" disable-output-escaping="yes"/>
                                                                                                                                </span>
                                                                                                                                <input type="hidden" name="p_password_1_fk" value="{password_1}"/>
                                                                                                                                <input type="hidden" name="p_password_1_fk_desc" value="{password_1_desc}"/>
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input type="hidden" name="p_password_1_fk" value="{password_1}"/>
                                                                                                                            <input type="hidden" name="p_password_1_fk_desc" value="{password_1_desc}"/>
                                                                                                                        </xsl:otherwise>
                                                                                                                    </xsl:choose>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="lookup_1">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/lookup_1/@table='true'">
                                                                                                                            <td field="lookup_1" data-row="{position()}" data-title="{../../../fields/lookup_1/label}" class="lookup">
                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                    <xsl:value-of select="lookup_1_desc" disable-output-escaping="yes"/>
                                                                                                                                </span>
                                                                                                                                <input type="hidden" name="p_lookup_1_fk" value="{lookup_1}"/>
                                                                                                                                <input type="hidden" name="p_lookup_1_fk_desc" value="{lookup_1_desc}"/>
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input type="hidden" name="p_lookup_1_fk" value="{lookup_1}"/>
                                                                                                                            <input type="hidden" name="p_lookup_1_fk_desc" value="{lookup_1_desc}"/>
                                                                                                                        </xsl:otherwise>
                                                                                                                    </xsl:choose>
                                                                                                                </xsl:if>
                                                                                                                <td data-row="{position()}" class="table-btn">
                                                                                                                    <span class="table-row-edit btn" rel="separatorlist_1">
                                                                                                                        <i class="fa fa-pencil"/>
                                                                                                                    </span>
                                                                                                                    <span class="table-row-remove btn" rel="separatorlist_1">
                                                                                                                        <i class="fa fa-times"/>
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
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_2']">
                                                                <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_2" rel="tab-tabcontent_1-tab_item_2">
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-12">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/table_1">
                                                                                    <div class="box box-table-contents gen-container-item " item-name="table_1">
                                                                                        <div class="box-body table-box">
                                                                                            <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                                                                                            <table id="table_1" class="table table-striped gen-data-table ">
                                                                                                <thead>
                                                                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                                                                        <xsl:if test="rows/content/table_1/fields/radio_1">
                                                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/table_1/fields/radio_1/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/table_1/fields/color_1">
                                                                                                            <th align="left" class="color-th gen-fields-holder">
                                                                                                                <xsl:value-of select="rows/content/table_1/fields/color_1/label"/>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/table_1/fields/email_1">
                                                                                                            <th align="left" class=" gen-fields-holder">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/table_1/fields/email_1/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/table_1/fields/text_1">
                                                                                                            <th align="left" class=" gen-fields-holder">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/table_1/fields/text_1/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                                                        <tr gen-id="drop-zone">
                                                                                                            <xsl:if test="radio_1">
                                                                                                                <td align="" data-row="{position()}" data-title="{../../label/radio_1}" class="bs-checkbox">
                                                                                                                    <xsl:if test="radio_1 != '-0'">
                                                                                                                        <input type="radio" name="p_radio_1" value="{radio_1}">
                                                                                                                            <xsl:if test="radio_1_check=radio_1">
                                                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                            </xsl:if>
                                                                                                                        </input>
                                                                                                                    </xsl:if>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="color_1">
                                                                                                                <td align="" data-row="{position()}" data-title="{../../label/color_1}" class="color">
                                                                                                                    <xsl:call-template name="tdcolor">
                                                                                                                        <xsl:with-param name="color" select="color_1"/>
                                                                                                                    </xsl:call-template>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="email_1">
                                                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/email_1/label}" class="email">
                                                                                                                    <span class="">
                                                                                                                        <xsl:value-of select="email_1"/>
                                                                                                                    </span>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="text_1">
                                                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                                                                                                    <span class="">
                                                                                                                        <xsl:value-of select="text_1"/>
                                                                                                                    </span>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                        </tr>
                                                                                                    </xsl:for-each>
                                                                                                </tbody>
                                                                                            </table>
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
                                        <div class="gen-column col-md-2">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/toolsbar_1">
                                                    <div  class="toolsbar-holder gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="toolsbar_1">
                                                        <div class="btns-holder  btn-group-justified" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"/>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if  test="rows/content/chart_1">
                                                    <div  class="box gen-container-item " gen-structure="graphic" item-name="chart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                <xsl:with-param name="chart_type" select="'line'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Chart'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                            </xsl:call-template>
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
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.js"></script>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js"></script>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js"></script>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"></script>
                <!-- COLOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js"></script>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1464346632200"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1464346632201"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1464346632201"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1464346632201"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1464346632201"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1464346632201"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1464346632201"/>
</xsl:stylesheet>