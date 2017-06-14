<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="home-header" />
                <link rel="stylesheet" type="text/css" href="{$path}/extentions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <script type="text/javascript" src="{$path}/extentions/formgen/types/containers/form/includes/igrp.forms.js"></script>
            </head>
            <body class="bodyColor">
                <div class="IGRP_overlay" />
                <xsl:call-template name="home-top-main" />
                <div id="igrp-bodyPage">
                    <xsl:call-template name="home-slide-menu" />
                    <div class="bodyPageRigth">
                        <xsl:apply-templates select="rows/content/messages" mode="notif_messages" />
                        <form class="default_form" name="formular_default" method="post" id="formular_default" enctype="multipart/form-data" action="#">
                            <div class="gen-row">
                                <div class="gen-column col-1-1">
                                    <div class="gen-inner">
                                        <xsl:if  test="rows/content/filter_1">
                                            <div class="box-content resetPadding gen-container-item" gen-id="body">
                                                <div class="box-collapser">
                                                    <div class="col">
                                                        <div gen-id="drop-zone">
                                                            <xsl:apply-templates  select="rows/content/filter_1/fields" mode="hidden-fields" />
                                                            <xsl:if  test="rows/content/filter_1/fields/code">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="code">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/code/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/code/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/code/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/filter_1/fields/code/@name}" maxlength="22" value="{rows/content/filter_1/fields/code/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/filter_1/fields/code" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/req_name">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="req_name">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/req_name/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/req_name/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/req_name/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/filter_1/fields/req_name/@name}" maxlength="250" value="{rows/content/filter_1/fields/req_name/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/filter_1/fields/req_name" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/req_doc_type">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="select">
                                                                    <div class="igrp_item select">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/req_doc_type/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/req_doc_type/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span>
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/req_doc_type/label" />
                                                                                </span>
                                                                            </span>
                                                                        </label>
                                                                        <select class="select" name="{rows/content/filter_1/fields/req_doc_type/@name}" data-placeholder="{rows/content/filter_1/fields/req_doc_type/list/option[position() = 1]/text}" chosen="select" id="{rows/content/filter_1/fields/req_doc_type/@name}" multiple-options="false">
                                                                            <xsl:if test="rows/content/filter_1/fields/req_doc_type/@multiple = 'true'">
                                                                                <xsl:attribute name="multiple">true</xsl:attribute>
                                                                            </xsl:if>
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/filter_1/fields/req_doc_type" />
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/filter_1/fields/req_doc_type/list/option[position() != 1]">
                                                                                <option value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/req_doc_number">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="req_doc_number">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/req_doc_number/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/req_doc_number/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/req_doc_number/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/filter_1/fields/req_doc_number/@name}" maxlength="50" value="{rows/content/filter_1/fields/req_doc_number/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/filter_1/fields/req_doc_number" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/req_contra_prova">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="req_contra_prova">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/req_contra_prova/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/req_contra_prova/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/req_contra_prova/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/filter_1/fields/req_contra_prova/@name}" maxlength="50" value="{rows/content/filter_1/fields/req_contra_prova/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/filter_1/fields/req_contra_prova" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/id_process">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="id_process">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/id_process/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/id_process/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/id_process/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/filter_1/fields/id_process/@name}" maxlength="22" value="{rows/content/filter_1/fields/id_process/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/filter_1/fields/id_process" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/sep_intevalo">
                                                                <div class="box-head subtitle gen-fields-holder">
                                                                    <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/filter_1/fields/sep_intevalo/label" />
                                                                    </span>
                                                                </div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/dt_reg_de">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="dt_reg_de">
                                                                    <div class="igrp_item date">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/dt_reg_de/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/dt_reg_de/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/dt_reg_de/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="itemIcon">
                                                                            <input class="date" type="text" name="{rows/content/filter_1/fields/dt_reg_de/@name}" value="{rows/content/filter_1/fields/dt_reg_de/value}" trel="IGRP_datePicker">
                                                                                <xsl:call-template name="FIELD_validator">
                                                                                    <xsl:with-param name="field" select="rows/content/filter_1/fields/dt_reg_de" />
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <div class="calendar" /></div>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/filter_1/fields/dt_reg_ate">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="dt_reg_ate">
                                                                    <div class="igrp_item date">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/filter_1/fields/dt_reg_ate/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/filter_1/fields/dt_reg_ate/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/filter_1/fields/dt_reg_ate/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="itemIcon">
                                                                            <input class="date" type="text" name="{rows/content/filter_1/fields/dt_reg_ate/@name}" value="{rows/content/filter_1/fields/dt_reg_ate/value}" trel="IGRP_datePicker">
                                                                                <xsl:call-template name="FIELD_validator">
                                                                                    <xsl:with-param name="field" select="rows/content/filter_1/fields/dt_reg_ate" />
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <div class="calendar" /></div>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                        </div>
                                                        <div class="_clear" />
                                                        <xsl:if  test="rows/content/filter_1/tools-bar">
                                                            <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="button-bar" />
                                                        </xsl:if>
                                                    </div>
                                                    <div class="_clear" /></div>
                                            </div>
                                        </xsl:if>
                                        <xsl:if  test="rows/content/gen_table">
                                            <div class="box-content resetPadding gen-container-item" gen-structure="label,values">
                                                <div class="box-collapser">
                                                    <div class="col borderColor">
                                                        <div class="box-table table-responsive">
                                                            <div class="table-container">
                                                                <xsl:variable  name="hasContextMenu" select="rows/content/gen_table/table/context-menu" />
                                                                <xsl:if  test="$hasContextMenu">
                                                                    <xsl:apply-templates select="rows/content/gen_table/table/context-menu" mode="context-menu">
                                                                        <xsl:with-param name="contextId" select="'gen_table'" />
                                                                    </xsl:apply-templates>
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/gen_table/fields/*[@type='color']">
                                                                    <xsl:apply-templates select="rows/content/gen_table/table/legend_color" mode="table-legend" />
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/gen_table/fields/filter">
                                                                    <xsl:call-template name="filter-az">
                                                                        <xsl:with-param name="name" select="rows/content/gen_table/fields/filter/@name" />
                                                                        <xsl:with-param name="value" select="rows/content/gen_table/fields/filter/value" />
                                                                        <xsl:with-param name="type" select="''" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                <table class="IGRP_table default-table" gen-id="table" data-control="gen_table">
                                                                    <thead>
                                                                        <tr gen-id="drop-zone" gen-field-template="th">
                                                                            <xsl:if  test="rows/content/gen_table/fields/code">
                                                                                <th class=" gen-fields-holder" align="center">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/code/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/dt_reg">
                                                                                <th class=" gen-fields-holder" align="center">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/dt_reg/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/date_1">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/date_1/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/req_name">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/req_name/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/req_doc_type">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/req_doc_type/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/req_doc_number">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/req_doc_number/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/id_process">
                                                                                <th class=" gen-fields-holder" align="center">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/id_process/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/gen_table/fields/req_contra_prova">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/gen_table/fields/req_contra_prova/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each  select="rows/content/gen_table/table/value/row">
                                                                            <tr class="IGRP_contextMenu" gen-id="drop-zone">
                                                                                <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                                <xsl:apply-templates select="." mode="tr-hidden-fields" />
                                                                                <xsl:if test="code">
                                                                                    <td class="number" align="center" data-title="{../../fields/code/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="code" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="dt_reg">
                                                                                    <td class="date" align="center" data-title="{../../fields/dt_reg/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="dt_reg" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="date_1">
                                                                                    <td class="date" align="left" data-title="{../../fields/date_1/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="date_1" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="req_name">
                                                                                    <td class="text" align="left" data-title="{../../fields/req_name/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="req_name" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="req_doc_type">
                                                                                    <td class="text" align="left" data-title="{../../fields/req_doc_type/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="req_doc_type" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="req_doc_number">
                                                                                    <td class="text" align="left" data-title="{../../fields/req_doc_number/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="req_doc_number" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="id_process">
                                                                                    <td class="number" align="center" data-title="{../../fields/id_process/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="id_process" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="req_contra_prova">
                                                                                    <td class="text" align="left" data-title="{../../fields/req_contra_prova/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="req_contra_prova" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="_clear" /></div>
                    <xsl:call-template name="link-opener" />
                    <div class="_clear" /></div>
                <div id="igrp-footerPage">
                    <xsl:call-template name="footer" />
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1452182546818"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1452182546818"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1452182546818"/>
    <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=1452182546818"/>
</xsl:stylesheet>