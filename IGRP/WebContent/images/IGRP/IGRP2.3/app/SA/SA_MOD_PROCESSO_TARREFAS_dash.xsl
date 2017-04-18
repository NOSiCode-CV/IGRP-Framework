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
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/table-colors.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
                <style/>
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
                                                <xsl:if test="rows/content/pes_tar">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="pes_tar">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/pes_tar/fields"/>
                                                                <xsl:if test="rows/content/pes_tar/fields/aplicacao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                                                        <label for="{rows/content/pes_tar/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/pes_tar/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="pes_tar_aplicacao" name="{rows/content/pes_tar/fields/aplicacao/@name}">
                                                                            <xsl:for-each select="rows/content/pes_tar/fields/aplicacao/list/option">
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
                                                                <xsl:if test="rows/content/pes_tar/fields/organica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="organica" item-type="select">
                                                                        <label for="{rows/content/pes_tar/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/pes_tar/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="pes_tar_organica" name="{rows/content/pes_tar/fields/organica/@name}">
                                                                            <xsl:for-each select="rows/content/pes_tar/fields/organica/list/option">
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
                                                                <xsl:if test="rows/content/pes_tar/fields/numero_processo">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="numero_processo" item-type="text">
                                                                        <label for="{rows/content/pes_tar/fields/numero_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/pes_tar/fields/numero_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/pes_tar/fields/numero_processo/value}" class="form-control " id="{rows/content/pes_tar/fields/numero_processo/@name}" name="{rows/content/pes_tar/fields/numero_processo/@name}" maxlength="250" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/pes_tar/fields/tipo_processo">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_processo" item-type="select">
                                                                        <label for="{rows/content/pes_tar/fields/tipo_processo/@name}">
                                                                            <xsl:value-of select="rows/content/pes_tar/fields/tipo_processo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="pes_tar_tipo_processo" name="{rows/content/pes_tar/fields/tipo_processo/@name}">
                                                                            <xsl:for-each select="rows/content/pes_tar/fields/tipo_processo/list/option">
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
                                                                <xsl:if test="rows/content/pes_tar/fields/data_inicio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/pes_tar/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/pes_tar/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/pes_tar/fields/data_inicio/value}" class="form-control gen-date " id="pes_tar-data_inicio" name="{rows/content/pes_tar/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/pes_tar/fields/data_fim">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/pes_tar/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/pes_tar/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/pes_tar/fields/data_fim/value}" class="form-control gen-date " id="pes_tar-data_fim" name="{rows/content/pes_tar/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/pes_tar/fields/prioridade">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="prioridade" item-type="select">
                                                                        <label for="{rows/content/pes_tar/fields/prioridade/@name}">
                                                                            <xsl:value-of select="rows/content/pes_tar/fields/prioridade/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="pes_tar_prioridade" name="{rows/content/pes_tar/fields/prioridade/@name}">
                                                                            <xsl:for-each select="rows/content/pes_tar/fields/prioridade/list/option">
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
                                                                <xsl:if test="rows/content/pes_tar/fields/search">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="search" item-type="text">
                                                                        <label for="{rows/content/pes_tar/fields/search/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/pes_tar/fields/search/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/pes_tar/fields/search/value}" class="form-control " id="{rows/content/pes_tar/fields/search/@name}" name="{rows/content/pes_tar/fields/search/@name}" maxlength="500" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/pes_tar/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <xsl:apply-templates mode="table-legend" select="rows/content/gen_table/table/legend_color"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/priority">
                                                                            <th align="left" class="color-th gen-fields-holder">
                                                                                <xsl:value-of select="rows/content/gen_table/fields/priority/label"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/descricao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/descricao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/atribuido_por">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/atribuido_por/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data_entrada">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data_entrada/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/dias_em_espera">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/dias_em_espera/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/marcar">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="marcar"/>
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
                                                                            <input type="hidden" name="p_env_fk_fk" value="{env_fk}"/>
                                                                            <input type="hidden" name="p_env_fk_fk_desc" value="{env_fk_desc}"/>
                                                                            <input type="hidden" name="p_flg_adhoc_fk" value="{flg_adhoc}"/>
                                                                            <input type="hidden" name="p_flg_adhoc_fk_desc" value="{flg_adhoc_desc}"/>
                                                                            <input type="hidden" name="p_apache_dad_fk" value="{apache_dad}"/>
                                                                            <input type="hidden" name="p_apache_dad_fk_desc" value="{apache_dad_desc}"/>
                                                                            <xsl:if test="priority">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/priority}" class="color">
                                                                                    <xsl:call-template name="tdcolor">
                                                                                        <xsl:with-param name="color" select="priority"/>
                                                                                    </xsl:call-template>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tipo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="descricao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/descricao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="descricao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="atribuido_por">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/atribuido_por/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="atribuido_por"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_entrada">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/data_entrada/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_entrada"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="dias_em_espera">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/dias_em_espera/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="dias_em_espera"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="marcar">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/marcar}" class="bs-checkbox">
                                                                                    <xsl:if test="marcar != '-0'">
                                                                                        <input type="checkbox" name="p_marcar" value="{marcar}" check-rel="marcar">
                                                                                            <xsl:if test="marcar_check=marcar">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                    </xsl:if>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- COLOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489685447036"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489685447036"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489685447036"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489685447036"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1489685447037"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1489685447037"/>
</xsl:stylesheet>