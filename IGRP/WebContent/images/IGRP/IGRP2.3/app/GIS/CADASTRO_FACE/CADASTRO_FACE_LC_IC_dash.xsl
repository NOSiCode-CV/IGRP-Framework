<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder btn-group-lg pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/filter_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="filter_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/filter_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/filter_1/fields"/>
                                                                <xsl:if test="rows/content/filter_1/fields/nip">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="nip" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/nip/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nip/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/nip/value}" class="form-control" id="{rows/content/filter_1/fields/nip/@name}" name="{rows/content/filter_1/fields/nip/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/n_processo">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="n_processo" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/n_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/n_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/n_processo/value}" class="form-control" id="{rows/content/filter_1/fields/n_processo/@name}" name="{rows/content/filter_1/fields/n_processo/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/n_processo_cadastro">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="n_processo_cadastro" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/n_processo_cadastro/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/n_processo_cadastro/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/n_processo_cadastro/value}" class="form-control" id="{rows/content/filter_1/fields/n_processo_cadastro/@name}" name="{rows/content/filter_1/fields/n_processo_cadastro/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/codigo_claim">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="codigo_claim" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/codigo_claim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/codigo_claim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/codigo_claim/value}" class="form-control" id="{rows/content/filter_1/fields/codigo_claim/@name}" name="{rows/content/filter_1/fields/codigo_claim/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/n_poligono">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="n_poligono" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/n_poligono/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/n_poligono/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/n_poligono/value}" class="form-control" id="{rows/content/filter_1/fields/n_poligono/@name}" name="{rows/content/filter_1/fields/n_poligono/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_homologacao_de">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_homologacao_de" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_homologacao_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_homologacao_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_homologacao_de/value}" class="form-control gen-date" id="filter_1-data_homologacao_de" name="{rows/content/filter_1/fields/data_homologacao_de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_homologacao_ate">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_homologacao_ate" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_homologacao_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_homologacao_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_homologacao_ate/value}" class="form-control gen-date" id="filter_1-data_homologacao_ate" name="{rows/content/filter_1/fields/data_homologacao_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/estado_registo">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="estado_registo" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/estado_registo/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/estado_registo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_estado_registo" name="{rows/content/filter_1/fields/estado_registo/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/estado_registo/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/anomalias">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="anomalias" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/anomalias/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/anomalias/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_anomalias" name="{rows/content/filter_1/fields/anomalias/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/anomalias/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/validado_imp">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="validado_imp" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/validado_imp/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/validado_imp/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_validado_imp" name="{rows/content/filter_1/fields/validado_imp/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/validado_imp/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/titular">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="titular" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/titular/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/titular/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/titular/value}" class="form-control" id="{rows/content/filter_1/fields/titular/@name}" name="{rows/content/filter_1/fields/titular/@name}" maxlength="300" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nif">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="nif" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/nif/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nif/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/nif/value}" class="form-control" id="{rows/content/filter_1/fields/nif/@name}" name="{rows/content/filter_1/fields/nif/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/cidade_vila_ou_zona">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="cidade_vila_ou_zona" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/cidade_vila_ou_zona/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/cidade_vila_ou_zona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="filter_1_cidade_vila_ou_zona" name="{rows/content/filter_1/fields/cidade_vila_ou_zona/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/cidade_vila_ou_zona/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/bairro_ou_lugar">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="bairro_ou_lugar" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/bairro_ou_lugar/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/bairro_ou_lugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_bairro_ou_lugar" name="{rows/content/filter_1/fields/bairro_ou_lugar/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/bairro_ou_lugar/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/data_registo_predial_ate">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_registo_predial_ate" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_registo_predial_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_registo_predial_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_registo_predial_ate/value}" class="form-control gen-date" id="filter_1-data_registo_predial_ate" name="{rows/content/filter_1/fields/data_registo_predial_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_registo_predial_de">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_registo_predial_de" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_registo_predial_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_registo_predial_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_registo_predial_de/value}" class="form-control gen-date" id="filter_1-data_registo_predial_de" name="{rows/content/filter_1/fields/data_registo_predial_de/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                        <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/tb_toolsbar">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="tb_toolsbar">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/tb_toolsbar" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/gen_table/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu" exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/n_processo_desc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/n_processo_desc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/proc_cadastro">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/proc_cadastro/label"/>
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
                                                                        <xsl:if test="rows/content/gen_table/fields/requerente">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/requerente/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo_pedido">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo_pedido/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/n_registo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/n_registo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/nip_desc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nip_desc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/n_apresentacao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/n_apresentacao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/user_qualifica">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/user_qualifica/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ver_certidao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ver_certidao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ver_cip">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ver_cip/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ver_cip_pdf">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ver_cip_pdf/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/validar">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="validar"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_requisicao_fk" value="{id_requisicao}"/>
                                                                            <input type="hidden" name="p_id_requisicao_fk_desc" value="{id_requisicao_desc}"/>
                                                                            <input type="hidden" name="p_ba_unit_id_fk" value="{ba_unit_id}"/>
                                                                            <input type="hidden" name="p_ba_unit_id_fk_desc" value="{ba_unit_id_desc}"/>
                                                                            <input type="hidden" name="p_id_valida_fk" value="{id_valida}"/>
                                                                            <input type="hidden" name="p_id_valida_fk_desc" value="{id_valida_desc}"/>
                                                                            <input type="hidden" name="p_id_registo_fk" value="{id_registo}"/>
                                                                            <input type="hidden" name="p_id_registo_fk_desc" value="{id_registo_desc}"/>
                                                                            <input type="hidden" name="p_objectid_fk" value="{objectid}"/>
                                                                            <input type="hidden" name="p_objectid_fk_desc" value="{objectid_desc}"/>
                                                                            <xsl:if test="n_processo_desc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/n_processo_desc}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="n_processo_desc != ''">
                                                                                            <a href="{n_processo_desc}" class="link bClick" target="_self" name="n_processo_desc">
                                                                                                <xsl:value-of select="n_processo_desc_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="n_processo_desc_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="proc_cadastro">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/proc_cadastro}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="proc_cadastro != ''">
                                                                                            <a href="{proc_cadastro}" class="link bClick" target="modal" name="proc_cadastro">
                                                                                                <xsl:value-of select="proc_cadastro_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="proc_cadastro_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="estado">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/estado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="estado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="requerente">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/requerente/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="requerente"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tipo_pedido">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo_pedido/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo_pedido"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_registo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_registo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_registo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nip_desc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nip_desc/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nip_desc"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_apresentacao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_apresentacao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_apresentacao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="user_qualifica">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/user_qualifica/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="user_qualifica"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ver_certidao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ver_certidao}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ver_certidao != ''">
                                                                                            <a href="{ver_certidao}" class="link bClick" target="_blank" name="ver_certidao">
                                                                                                <xsl:value-of select="ver_certidao_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ver_certidao_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ver_cip">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ver_cip}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ver_cip != ''">
                                                                                            <a href="{ver_cip}" class="link bClick" target="_blank" name="ver_cip">
                                                                                                <xsl:value-of select="ver_cip_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ver_cip_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ver_cip_pdf">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ver_cip_pdf}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ver_cip_pdf != ''">
                                                                                            <a href="{ver_cip_pdf}" class="link bClick" target="_blank" name="ver_cip_pdf">
                                                                                                <xsl:value-of select="ver_cip_pdf_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ver_cip_pdf_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="validar">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/validar}" class="bs-checkbox">
                                                                                    <xsl:if test="validar != '-0'">
                                                                                        <input type="checkbox" name="p_validar" value="{validar}" check-rel="validar">
                                                                                            <xsl:if test="validar_check=validar">
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner"/></div>
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
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488850878624"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488850878624"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488850878624"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488850878624"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488850878625"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1488850878625"/>
</xsl:stylesheet>