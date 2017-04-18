<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- QUICKBUTTONBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/quickbuttonbox/quickbuttonbox.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/ilha">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="ilha" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ilha/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_ilha" name="{rows/content/form_1/fields/ilha/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ilha/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nome_f">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="nome_f" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome_f/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome_f/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome_f/value}" class="form-control" id="{rows/content/form_1/fields/nome_f/@name}" name="{rows/content/form_1/fields/nome_f/@name}" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/mac">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="mac" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/mac/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/mac/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/mac/value}" class="form-control" id="{rows/content/form_1/fields/mac/@name}" name="{rows/content/form_1/fields/mac/@name}" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_registo_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_registo_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_registo_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_registo_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_registo_inicio/value}" class="form-control gen-date" id="form_1-data_registo_inicio" name="{rows/content/form_1/fields/data_registo_inicio/@name}" format="IGRP_datePicker" maxlength="10"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_registo_fim">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_registo_fim" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_registo_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_registo_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_registo_fim/value}" class="form-control gen-date" id="form_1-data_registo_fim" name="{rows/content/form_1/fields/data_registo_fim/@name}" format="IGRP_datePicker" maxlength="10"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-10">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/gen_table/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/nome">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nome/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/mac_address">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/mac_address/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/dt_register">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/dt_register/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/utilizador">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/utilizador/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ambiente">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ambiente/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/version">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/version/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/estado">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/estado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/export">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/export/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_fk" value="{id}"/>
                                                                            <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                                                                            <input type="hidden" name="p_user_register_fk" value="{user_register}"/>
                                                                            <input type="hidden" name="p_user_register_fk_desc" value="{user_register_desc}"/>
                                                                            <input type="hidden" name="p_dt_start_fk" value="{dt_start}"/>
                                                                            <input type="hidden" name="p_dt_start_fk_desc" value="{dt_start_desc}"/>
                                                                            <input type="hidden" name="p_dt_end_fk" value="{dt_end}"/>
                                                                            <input type="hidden" name="p_dt_end_fk_desc" value="{dt_end_desc}"/>
                                                                            <xsl:if test="nome">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="mac_address">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/mac_address/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="mac_address"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="dt_register">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/dt_register/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="dt_register"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="utilizador">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/utilizador/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="utilizador"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ambiente">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/ambiente/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="ambiente"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="version">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/version/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="version"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="estado">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/estado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="estado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="export">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/export}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="export != ''">
                                                                                            <a href="{export}" class="link bClick" target="_self" name="export">
                                                                                                <xsl:value-of select="export_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="export_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/gen_table/table/context-menu" mode="table-context-menu"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-2">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/qb_add_device">
                                                    <div class="quick-button-box gen-container-item " gen-class="" item-name="qb_add_device">
                                                        <a href="{rows/content/qb_add_device/fields/qb_add_device_url/value}" target="modal" class="quick-button metro {rows/content/qb_add_device/fields/qb_add_device_bg/value}">
                                                            <i class="fa {rows/content/qb_add_device/fields/qb_add_device_icn/value}" aria-hidden="true"/>
                                                            <p>
                                                                <xsl:value-of select="rows/content/qb_add_device/fields/qb_add_device_tit/value"/>
                                                            </p>
                                                            <span class="badge">
                                                                <xsl:value-of select="rows/content/qb_add_device/fields/qb_add_device_val/value"/>
                                                            </span>
                                                        </a>
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
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485259163498"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485259163498"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485259163498"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485259163498"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485259163498"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1485259163498"/>
</xsl:stylesheet>