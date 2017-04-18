<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- TABLE CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" rel="stylesheet" />
                <!-- SELECT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/select2/select2.min.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/plugins/select2/select2.style.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title" gen-class="">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/name_f">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="name_f">
                                                                        <label for="{rows/content/form_1/fields/name_f/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/name_f/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/name_f/@name}" value="{rows/content/form_1/fields/name_f/value}" id="{rows/content/form_1/fields/name_f/@name}" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/device_f">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-type="select" item-name="device_f">
                                                                        <label for="{rows/content/form_1/fields/device_f/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/device_f/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/device_f/@name}" id="form_1_device_f" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/device_f/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/utilizador_f">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-type="select" item-name="utilizador_f">
                                                                        <label for="{rows/content/form_1/fields/utilizador_f/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/utilizador_f/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/utilizador_f/@name}" id="form_1_utilizador_f">
                                                                            <xsl:for-each select="rows/content/form_1/fields/utilizador_f/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-type="date" item-name="data_inicio">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-date" name="{rows/content/form_1/fields/data_inicio/@name}" value="{rows/content/form_1/fields/data_inicio/value}" id="form_1-data_inicio" maxlength="10" format="IGRP_datePicker" />
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar" />
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-type="date" item-name="data_fim">
                                                                        <label for="{rows/content/form_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-date" name="{rows/content/form_1/fields/data_fim/@name}" value="{rows/content/form_1/fields/data_fim/value}" id="form_1-data_fim" maxlength="10" format="IGRP_datePicker" />
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar" />
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table" gen-class="">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/gen_table/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/gen_table/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table IGRP_contextmenu" id="gen_table">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/name">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/name/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/device">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/device/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/utilizador">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/utilizador/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                            <input type="hidden" name="p_id_fk" value="{id}" />
                                                                            <input type="hidden" name="p_id_fk_desc" value="{id_desc}" />
                                                                            <input type="hidden" name="p_device_id_fk" value="{device_id}" />
                                                                            <input type="hidden" name="p_device_id_fk_desc" value="{device_id_desc}" />
                                                                            <input type="hidden" name="p_user_register_id_fk" value="{user_register_id}" />
                                                                            <input type="hidden" name="p_user_register_id_fk_desc" value="{user_register_id_desc}" />
                                                                            <xsl:if test="name">
                                                                                <td class="text" align="left" data-title="{../../fields/name/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="name" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="device">
                                                                                <td class="text" align="left" data-title="{../../fields/device/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="device" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="utilizador">
                                                                                <td class="text" align="left" data-title="{../../fields/utilizador/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="utilizador" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data">
                                                                                <td class="date" align="left" data-title="{../../fields/data/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/gen_table/table/context-menu" mode="table-context-menu" />
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
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js" />
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js" />
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js" />
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js" />
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js" />
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484062965372" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484062965372" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484062965372" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484062965372" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1484062965372" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1484062965372" />
</xsl:stylesheet>