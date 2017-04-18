<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
                <!-- FORMLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/formlist/includes/igrp.formlist.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
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
                                                <xsl:if  test="rows/content/paragraph_1">
                                                    <div class="gen-container-item " item-name="paragraph_1">
                                                        <div class="box-body">
                                                            <p>
                                                                <xsl:value-of  select="rows/content/paragraph_1/fields/text/value" disable-output-escaping="yes" />
                                                            </p>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if  test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder gen-container-item " gen-fields=".btns-holder a.btn" item-name="toolsbar_1" gen-structure="toolsbar">
                                                        <div role="group" class="btns-holder   pull-right">
                                                            <xsl:apply-templates  select="rows/content/toolsbar_1" mode="gen-buttons" />
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if  test="rows/content/tabcontent_1">
                                                    <div class="gen-tab-holder nav-tabs-custom gen-container-item " item-name="tabcontent_1" tab-template="default">
                                                        <ul class="nav nav-tabs">
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='forms']">
                                                                <li class="active gen-fields-holder" rel="tab-tabcontent_1-forms" item-name="forms">
                                                                    <a aria-expanded="true" href="#tab-tabcontent_1-forms" data-toggle="tab">
                                                                        <i class="fa fa-list-alt" />
                                                                        <span gen-lbl-setter="true">
                                                                            <xsl:value-of select="rows/content/tabcontent_1/item[@name='forms']/title" />
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='table']">
                                                                <li class=" gen-fields-holder" rel="tab-tabcontent_1-table" item-name="table">
                                                                    <a aria-expanded="true" href="#tab-tabcontent_1-table" data-toggle="tab">
                                                                        <i class="fa fa-dot-circle-o" />
                                                                        <span gen-lbl-setter="true">
                                                                            <xsl:value-of select="rows/content/tabcontent_1/item[@name='table']/title" />
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </xsl:if>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='forms']">
                                                                <div class="tab-pane gen-rows-holder active" rel="tab-tabcontent_1-forms" id="tab-tabcontent_1-forms">
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-12">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/form_1">
                                                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                                                        <xsl:call-template name="box-header">
                                                                                            <xsl:with-param name="title" select="rows/content/form_1/@title" />
                                                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                                                        </xsl:call-template>
                                                                                        <div class="box-body">
                                                                                            <div role="form" gen-id="drop-zone">
                                                                                                <xsl:if test="rows/content/form_1/fields/select">
                                                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-type="select" item-name="select">
                                                                                                        <label for="{rows/content/form_1/fields/select/@name}">
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/select/label" />
                                                                                                        </label>
                                                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/select/@name}" id="form_1_select">
                                                                                                            <xsl:for-each select="rows/content/form_1/fields/select/list/option">
                                                                                                                <option label="{text}" value="{value}">
                                                                                                                    <xsl:if test="@selected='true'">
                                                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                    </xsl:if>
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="text" />
                                                                                                                    </span>
                                                                                                                </option>
                                                                                                            </xsl:for-each>
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </xsl:if>
                                                                                                <xsl:if test="rows/content/form_1/fields/text">
                                                                                                    <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="text">
                                                                                                        <label for="{rows/content/form_1/fields/text/@name}">
                                                                                                            <span gen-lbl-setter="">
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/text/label" />
                                                                                                            </span>
                                                                                                        </label>
                                                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/text/@name}" value="{rows/content/form_1/fields/text/value}" id="{rows/content/form_1/fields/text/@name}" maxlength="30"></input>
                                                                                                    </div>
                                                                                                </xsl:if>
                                                                                                <xsl:if test="rows/content/form_1/fields/email">
                                                                                                    <div class="form-group col-md-6   gen-fields-holder" item-type="email" item-name="email">
                                                                                                        <label for="{rows/content/form_1/fields/email/@name}">
                                                                                                            <span gen-lbl-setter="">
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/email/label" />
                                                                                                            </span>
                                                                                                        </label>
                                                                                                        <input type="email" class="form-control" name="{rows/content/form_1/fields/email/@name}" value="{rows/content/form_1/fields/email/value}" id="{rows/content/form_1/fields/email/@name}" maxlength="30"></input>
                                                                                                    </div>
                                                                                                </xsl:if>
                                                                                                <xsl:if test="rows/content/form_1/fields/date">
                                                                                                    <div class="form-group col-md-6  gen-fields-holder" item-type="date" item-name="date">
                                                                                                        <label for="{rows/content/form_1/fields/date/@name}">
                                                                                                            <span gen-lbl-setter="">
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/date/label" />
                                                                                                            </span>
                                                                                                        </label>
                                                                                                        <div class="input-group">
                                                                                                            <input type="text" class="form-control gen-date" name="{rows/content/form_1/fields/date/@name}" value="{rows/content/form_1/fields/date/value}" id="form_1-date" maxlength="30" format="IGRP_datePicker" />
                                                                                                            <span class="input-group-btn gen-date-icon">
                                                                                                                <span class="btn btn-default">
                                                                                                                    <i class="fa fa-calendar" />
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </xsl:if>
                                                                                                <xsl:if test="rows/content/form_1/fields/texteditor_1">
                                                                                                    <div class="form-group col-md-12  gen-fields-holder" item-type="texteditor" item-name="texteditor_1">
                                                                                                        <label>
                                                                                                            <span gen-lbl-setter="">
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/texteditor_1/label" />
                                                                                                            </span>
                                                                                                        </label>
                                                                                                        <textarea class="gen-texteditor" name="{rows/content/form_1/fields/texteditor_1/@name}" id="form_1_texteditor_1">
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/texteditor_1/value" disable-output-escaping="yes" />
                                                                                                        </textarea>
                                                                                                        <script type="text/javascript"></script>
                                                                                                    </div>
                                                                                                </xsl:if>
                                                                                            </div>
                                                                                        </div>
                                                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                                                    </div>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/formlist_1">
                                                                                    <div class="box box-table-contents gen-container-item " item-name="formlist_1">
                                                                                        <div class="box-body table-box">
                                                                                            <table class="table table-striped gen-data-table IGRP_formlist" rel="T_formlist_1" id="formlist_1" data-control="data-formlist_1">
                                                                                                <thead>
                                                                                                    <tr gen-id="drop-zone" gen-field-template="table.th">
                                                                                                        <xsl:if test="rows/content/formlist_1/fields/checkbox_1">
                                                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="checkbox_1" />
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/formlist_1/fields/date_1">
                                                                                                            <th class=" gen-fields-holder" align="">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/date_1/label" />
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/formlist_1/fields/lookup_1">
                                                                                                            <th class=" gen-fields-holder" align="">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/lookup_1/label" />
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                                                                                            <th class="table-btn">
                                                                                                                <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                                                                                                    <xsl:if test="not(@nodelete)">
                                                                                                                        <span class="formlist-row-add" rel="formlist_1">
                                                                                                                            <i class="fa fa-plus" />
                                                                                                                        </span>
                                                                                                                    </xsl:if>
                                                                                                                </xsl:if>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                                                                                        <tr gen-id="drop-zone" row="{position()}">
                                                                                                            <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}" />
                                                                                                            <xsl:if test="checkbox_1">
                                                                                                                <xsl:if test="not(checkbox_1/@visible)">
                                                                                                                    <td data-row="{position()}" align="" data-title="{../../fields/checkbox_1/label}">
                                                                                                                        <div class="form-group" item-type="checkbox" item-name="checkbox_1">
                                                                                                                            <input type="hidden" name="p_checkbox_1_fk_desc" value="{checkbox_1_desc}" />
                                                                                                                            <xsl:if test="checkbox_1 != '-0'">
                                                                                                                                <input type="checkbox" class="checkbox" rel="F_formlist_1" name="p_checkbox_1_fk" value="{checkbox_1}" check-rel="checkbox_1">
                                                                                                                                    <xsl:if test="checkbox_1_check= checkbox_1">
                                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                                    </xsl:if>
                                                                                                                                </input>
                                                                                                                            </xsl:if>
                                                                                                                        </div>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="date_1">
                                                                                                                <xsl:if test="not(date_1/@visible)">
                                                                                                                    <td class="date" data-row="{position()}" align="" data-title="{../../fields/date_1/label}">
                                                                                                                        <input type="hidden" name="{../../../fields/date_1/@name}_fk_desc" value="{date_1_desc}" />
                                                                                                                        <div class="form-group" item-type="date" item-name="date_1">
                                                                                                                            <div class="input-group" item-type="date" item-name="date_1">
                                                                                                                                <input type="text" class="form-control gen-date" rel="F_formlist_1" name="{../../../fields/date_1/@name}_fk" value="{date_1}" id="formlist_1-date_1" format="IGRP_datePicker" />
                                                                                                                                <span class="input-group-btn gen-date-icon">
                                                                                                                                    <span class="btn btn-default">
                                                                                                                                        <i class="fa fa-calendar" />
                                                                                                                                    </span>
                                                                                                                                </span>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="lookup_1">
                                                                                                                <xsl:if test="not(lookup_1/@visible)">
                                                                                                                    <td class="lookup" data-row="{position()}" align="" data-title="{../../fields/lookup_1/label}">
                                                                                                                        <input type="hidden" name="{../../../fields/lookup_1/@name}_fk_desc" value="{lookup_1_desc}" />
                                                                                                                        <div class="form-group" item-type="lookup" item-name="lookup_1">
                                                                                                                            <div class="input-group">
                                                                                                                                <input type="text" class="form-control gen-lookup" name="{../../../fields/lookup_1/@name}_fk" value="{lookup_1}" id="formlist_1_lookup_1" />
                                                                                                                                <xsl:call-template name="lookup-tool">
                                                                                                                                    <xsl:with-param name="page" select="//rows/page" />
                                                                                                                                    <xsl:with-param name="ad_hoc" select="'1'" />
                                                                                                                                    <xsl:with-param name="action" select="'LOOKUP'" />
                                                                                                                                    <xsl:with-param name="name" select="//rows/content/formlist_1/fields/lookup_1/@name" />
                                                                                                                                    <xsl:with-param name="js_lookup" select="//rows/content/formlist_1/fields/lookup_1/lookup" />
                                                                                                                                    <xsl:with-param name="input-id" select="'formlist_1_lookup_1'" />
                                                                                                                                    <xsl:with-param name="btnClass" select="'default'" />
                                                                                                                                </xsl:call-template>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                                                                <td class="table-btn" data-row="{position()}">
                                                                                                                    <xsl:if test="not(@nodelete)">
                                                                                                                        <span class="formlist-row-remove" rel="formlist_1">
                                                                                                                            <i class="fa fa-times" />
                                                                                                                        </span>
                                                                                                                    </xsl:if>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                        </tr>
                                                                                                    </xsl:for-each>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/separatorlist_1">
                                                                                    <div class="box gen-container-item " item-name="separatorlist_1">
                                                                                        <xsl:call-template name="box-header">
                                                                                            <xsl:with-param name="title" select="rows/content/separatorlist_1/@title" />
                                                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                                                        </xsl:call-template>
                                                                                        <div class="box-body IGRP-separatorlist" dialog="false" tag="separatorlist_1">
                                                                                            <div class="splist-form-holder">
                                                                                                <div role="form" class="splist-form" gen-id="drop-zone" gen-field-template="form.field">
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                                                        <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="text_1">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/text_1/@name}">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label" />
                                                                                                                </span>
                                                                                                            </label>
                                                                                                            <input type="text" class="form-control" name="{rows/content/separatorlist_1/fields/text_1/@name}" value="{rows/content/separatorlist_1/fields/text_1/value}" id="{rows/content/separatorlist_1/fields/text_1/@name}" maxlength="30"></input>
                                                                                                        </div>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/color">
                                                                                                        <div class="form-group col-md-6  gen-fields-holder" item-type="color" item-name="color">
                                                                                                            <label for="{rows/content/separatorlist_1/fields/color/@name}">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/color/label" />
                                                                                                                </span>
                                                                                                            </label>
                                                                                                            <div class="input-group form-color-picker" id="separatorlist_1_color_colorp">
                                                                                                                <input type="text" class="form-control" name="{rows/content/separatorlist_1/fields/color/@name}" value="{rows/content/separatorlist_1/fields/color/value}" id="separatorlist_1_color" format="hex" />
                                                                                                                <span class="input-group-addon">
                                                                                                                    <i />
                                                                                                                </span>
                                                                                                            </div>
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
                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/color">
                                                                                                                <xsl:if test="//rows/content/separatorlist_1/fields/color/@table='true'">
                                                                                                                    <th item-name="color" align="">
                                                                                                                        <span gen-lbl-setter="">
                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/color/label" />
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
                                                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}" />
                                                                                                                <xsl:if test="text_1">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                                                                                            <td class="text" data-row="{position()}" data-title="{../../../fields/text_1/label}" field="text_1">
                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                    <xsl:value-of select="text_1_desc" disable-output-escaping="yes" />
                                                                                                                                </span>
                                                                                                                                <input type="hidden" name="p_text_1_fk" value="{text_1}" />
                                                                                                                                <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}" />
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input type="hidden" name="p_text_1_fk" value="{text_1}" />
                                                                                                                            <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}" />
                                                                                                                        </xsl:otherwise>
                                                                                                                    </xsl:choose>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="color">
                                                                                                                    <xsl:choose>
                                                                                                                        <xsl:when test="//rows/content/separatorlist_1/fields/color/@table='true'">
                                                                                                                            <td class="color" data-row="{position()}" data-title="{../../../fields/color/label}">
                                                                                                                                <span class="separator-list-td-val color" style="background-color:{color_desc};height: 10px;display: block;" />
                                                                                                                                <input type="hidden" name="p_color_fk" value="{color}" />
                                                                                                                                <input type="hidden" name="p_color_fk_desc" value="{color_desc}" />
                                                                                                                            </td>
                                                                                                                        </xsl:when>
                                                                                                                        <xsl:otherwise>
                                                                                                                            <input type="hidden" name="p_color_fk" value="{color}" />
                                                                                                                            <input type="hidden" name="p_color_fk_desc" value="{color_desc}" />
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
                                                            <xsl:if  test="rows/content/tabcontent_1/item[@name='table']">
                                                                <div class="tab-pane gen-rows-holder " rel="tab-tabcontent_1-table" id="tab-tabcontent_1-table">
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-12">
                                                                            <div class="gen-inner">
                                                                                <xsl:if test="rows/content/table_1">
                                                                                    <div class="box box-table-contents gen-container-item " item-name="table_1">
                                                                                        <div class="box-body table-box">
                                                                                            <xsl:apply-templates select="rows/content/table_1/table/legend_color" mode="table-legend" />
                                                                                            <table class="table table-striped gen-data-table " id="table_1">
                                                                                                <thead>
                                                                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                                                                        <xsl:if test="rows/content/table_1/fields/text_1">
                                                                                                            <th class=" gen-fields-holder" align="left">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/table_1/fields/text_1/label" />
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/table_1/fields/number_1">
                                                                                                            <th class=" gen-fields-holder" align="left">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/table_1/fields/number_1/label" />
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/table_1/fields/email_1">
                                                                                                            <th class=" gen-fields-holder" align="left">
                                                                                                                <span gen-lbl-setter="">
                                                                                                                    <xsl:value-of select="rows/content/table_1/fields/email_1/label" />
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/table_1/fields/color_1">
                                                                                                            <th class="color-th gen-fields-holder" align="left">
                                                                                                                <xsl:value-of select="rows/content/table_1/fields/color_1/label" />
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                                                        <tr gen-id="drop-zone">
                                                                                                            <xsl:if test="text_1">
                                                                                                                <td class="text" data-row="{position()}" align="left" data-title="{../../fields/text_1/label}">
                                                                                                                    <span class="">
                                                                                                                        <xsl:value-of select="text_1" />
                                                                                                                    </span>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="number_1">
                                                                                                                <td class="number" data-row="{position()}" align="left" data-title="{../../fields/number_1/label}">
                                                                                                                    <span class="">
                                                                                                                        <xsl:value-of select="number_1" />
                                                                                                                    </span>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="email_1">
                                                                                                                <td class="email" data-row="{position()}" align="left" data-title="{../../fields/email_1/label}">
                                                                                                                    <span class="">
                                                                                                                        <xsl:value-of select="email_1" />
                                                                                                                    </span>
                                                                                                                </td>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="color_1">
                                                                                                                <td class="color" data-row="{position()}" align="" data-title="{../../label/color_1}">
                                                                                                                    <xsl:call-template name="tdcolor">
                                                                                                                        <xsl:with-param name="color" select="color_1" />
                                                                                                                    </xsl:call-template>
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
                                                                                                <xsl:with-param name="title" select="'Line Chart'" />
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
                                                                                                <xsl:with-param name="chart_type" select="'area'" />
                                                                                                <xsl:with-param name="height" select="'250'" />
                                                                                                <xsl:with-param name="title" select="'Area Chart'" />
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
                                                                                                <xsl:with-param name="chart_type" select="'tablecharts'" />
                                                                                                <xsl:with-param name="height" select="'250'" />
                                                                                                <xsl:with-param name="title" select="'Table Chart'" />
                                                                                                <xsl:with-param name="url" select="rows/content/chart_3/url" />
                                                                                            </xsl:call-template>
                                                                                        </div>
                                                                                    </div>
                                                                                </xsl:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="gen-column col-md-12">
                                                                            <div class="gen-inner" /></div>
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
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"></script>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js"></script>
                <!-- FORMLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/formlist/includes/igrp.formlist.js"></script>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js"></script>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js"></script>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js"></script>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js"></script>
                <!-- TEXTEDITOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/texteditor/includes/ckeditor/ckeditor.js"></script>
                <!-- COLOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js"></script>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1464025666675"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1464025666675"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1464025666675"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1464025666675"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1464025666675"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1464025666675"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1464025666675"/>
</xsl:stylesheet>