<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style>.table-context-menu {    position: absolute;    display: none;    width: 160px;     box-shadow: 0px 4px 10px 0px #ddd;}</style>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
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
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/numero_pedido">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="numero_pedido" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/numero_pedido/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/numero_pedido/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/numero_pedido/value}" class="form-control " id="{rows/content/form_1/fields/numero_pedido/@name}" name="{rows/content/form_1/fields/numero_pedido/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/predio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="predio" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/predio/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/predio/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/predio/value}" class="form-control gen-lookup " id="form_1_predio" name="{rows/content/form_1/fields/predio/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/predio/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/predio/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_predio'"/>
                                                                                <xsl:with-param name="btnClass" select="'secondary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ato">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="ato" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/ato/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ato/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_ato" name="{rows/content/form_1/fields/ato/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ato/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/etapa">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="etapa" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/etapa/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/etapa/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_etapa" name="{rows/content/form_1/fields/etapa/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/etapa/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/estado">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado" name="{rows/content/form_1/fields/estado/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/de_pedido">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="de_pedido" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/de_pedido/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/de_pedido/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/de_pedido/value}" class="form-control gen-date " id="form_1-de_pedido" name="{rows/content/form_1/fields/de_pedido/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ate_pedido">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="ate_pedido" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/ate_pedido/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/ate_pedido/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/ate_pedido/value}" class="form-control gen-date " id="form_1-ate_pedido" name="{rows/content/form_1/fields/ate_pedido/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/n_pedido">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/n_pedido/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/id_det_pedido">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/id_det_pedido/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/l_ato">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/l_ato/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/l_predio">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/l_predio/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/data_pedido">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/data_pedido/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/l_etapa">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/l_etapa/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/l_estado">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/l_estado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/data_entrada">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/data_entrada/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_pedido_fk" value="{id_pedido}"/>
                                                                            <input type="hidden" name="p_id_pedido_fk_desc" value="{id_pedido_desc}"/>
                                                                            <input type="hidden" name="p_cod_estado_fk" value="{cod_estado}"/>
                                                                            <input type="hidden" name="p_cod_estado_fk_desc" value="{cod_estado_desc}"/>
                                                                            <xsl:if test="n_pedido">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_pedido/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_pedido"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="id_det_pedido">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/id_det_pedido/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="id_det_pedido"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="l_ato">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/l_ato/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="l_ato"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="l_predio">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/l_predio/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="l_predio"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_pedido">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_pedido/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_pedido"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="l_etapa">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/l_etapa/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="l_etapa"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="l_estado">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/l_estado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="l_estado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_entrada">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_entrada/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_entrada"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="table-context-menu"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490705814172"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490705814172"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490705814172"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490705814172"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490705814172"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1490705814172"/>
</xsl:stylesheet>