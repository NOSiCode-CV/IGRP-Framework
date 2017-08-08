<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-sm-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/page_title">
                                                                            <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                                                <h2>
                                                                                    <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                                                </h2>
                                                                            </section>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-sm-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/toolsbar_1">
                                                                            <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                                                <div class="btns-holder   pull-right" role="group">
                                                                                    <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                                        <xsl:with-param name="vertical" select="'true'"/>
                                                                                    </xsl:apply-templates>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/separatorlist_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/balcao">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="balcao" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/balcao/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/balcao/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_balcao" name="{rows/content/separatorlist_1/fields/balcao/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/balcao/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/servico">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="servico" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/servico/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/servico/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_servico" name="{rows/content/separatorlist_1/fields/servico/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/servico/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/numero_de_atendimentos">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="numero_de_atendimentos" item-type="number" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/numero_de_atendimentos/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_atendimentos/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/numero_de_atendimentos/value}" class="form-control " id="{rows/content/separatorlist_1/fields/numero_de_atendimentos/@name}" name="{rows/content/separatorlist_1/fields/numero_de_atendimentos/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/dias_de_semana">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="dias_de_semana" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/dias_de_semana/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/dias_de_semana/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_dias_de_semana" name="{rows/content/separatorlist_1/fields/dias_de_semana/@name}" required="required" multiple="multiple">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/dias_de_semana/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/hora_inicio">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="hora_inicio" item-type="text" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/hora_inicio/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/hora_inicio/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/separatorlist_1/fields/hora_inicio/value}" class="form-control " id="{rows/content/separatorlist_1/fields/hora_inicio/@name}" name="{rows/content/separatorlist_1/fields/hora_inicio/@name}" required="required" maxlength="6" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/hora_fim">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="hora_fim" item-type="text" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/hora_fim/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/hora_fim/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/separatorlist_1/fields/hora_fim/value}" class="form-control " id="{rows/content/separatorlist_1/fields/hora_fim/@name}" name="{rows/content/separatorlist_1/fields/hora_fim/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/numero_de_atendedores">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="numero_de_atendedores" item-type="number" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/numero_de_atendedores/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_atendedores/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/numero_de_atendedores/value}" class="form-control " id="{rows/content/separatorlist_1/fields/numero_de_atendedores/@name}" name="{rows/content/separatorlist_1/fields/numero_de_atendedores/@name}" required="required" maxlength="2" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="tempo_medio_de_atendimento_mn" item-type="number" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn/value}" class="form-control " id="{rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn/@name}" name="{rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="antecedencia_alterarcancelar_hr" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_antecedencia_alterarcancelar_hr" name="{rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="antecedencia_de_agendamento_hr" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_antecedencia_de_agendamento_hr" name="{rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr/list/option">
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
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/balcao">
                                                                                <xsl:if test="not(balcao/@visible)">
                                                                                    <th align="" item-name="balcao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/balcao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/servico">
                                                                                <xsl:if test="not(servico/@visible)">
                                                                                    <th align="" item-name="servico">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/servico/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/numero_de_atendimentos">
                                                                                <xsl:if test="not(numero_de_atendimentos/@visible)">
                                                                                    <th align="" item-name="numero_de_atendimentos">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_atendimentos/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/dias_de_semana">
                                                                                <xsl:if test="not(dias_de_semana/@visible)">
                                                                                    <th align="" item-name="dias_de_semana">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/dias_de_semana/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/hora_inicio">
                                                                                <xsl:if test="not(hora_inicio/@visible)">
                                                                                    <th align="" item-name="hora_inicio">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/hora_inicio/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/hora_fim">
                                                                                <xsl:if test="not(hora_fim/@visible)">
                                                                                    <th align="" item-name="hora_fim">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/hora_fim/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/numero_de_atendedores">
                                                                                <xsl:if test="not(numero_de_atendedores/@visible)">
                                                                                    <th align="" item-name="numero_de_atendedores">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_atendedores/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn">
                                                                                <xsl:if test="not(tempo_medio_de_atendimento_mn/@visible)">
                                                                                    <th align="" item-name="tempo_medio_de_atendimento_mn">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/tempo_medio_de_atendimento_mn/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr">
                                                                                <xsl:if test="not(antecedencia_alterarcancelar_hr/@visible)">
                                                                                    <th align="" item-name="antecedencia_alterarcancelar_hr">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/antecedencia_alterarcancelar_hr/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr">
                                                                                <xsl:if test="not(antecedencia_de_agendamento_hr/@visible)">
                                                                                    <th align="" item-name="antecedencia_de_agendamento_hr">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/antecedencia_de_agendamento_hr/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn btn-link">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                <xsl:if test="balcao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(balcao/@visible)">
                                                                                            <td field="balcao" data-row="{position()}" data-title="{../../../fields/balcao/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="balcao_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_balcao_fk" value="{balcao}"/>
                                                                                                <input type="hidden" name="p_balcao_fk_desc" value="{balcao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_balcao_fk" value="{balcao}"/>
                                                                                            <input type="hidden" name="p_balcao_fk_desc" value="{balcao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="servico">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(servico/@visible)">
                                                                                            <td field="servico" data-row="{position()}" data-title="{../../../fields/servico/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="servico_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                                                                                <input type="hidden" name="p_servico_fk_desc" value="{servico_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                                                                            <input type="hidden" name="p_servico_fk_desc" value="{servico_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="numero_de_atendimentos">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(numero_de_atendimentos/@visible)">
                                                                                            <td field="numero_de_atendimentos" data-row="{position()}" data-title="{../../../fields/numero_de_atendimentos/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="numero_de_atendimentos_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_numero_de_atendimentos_fk" value="{numero_de_atendimentos}"/>
                                                                                                <input type="hidden" name="p_numero_de_atendimentos_fk_desc" value="{numero_de_atendimentos_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_numero_de_atendimentos_fk" value="{numero_de_atendimentos}"/>
                                                                                            <input type="hidden" name="p_numero_de_atendimentos_fk_desc" value="{numero_de_atendimentos_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="dias_de_semana">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(dias_de_semana/@visible)">
                                                                                            <td field="dias_de_semana" data-row="{position()}" data-title="{../../../fields/dias_de_semana/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="dias_de_semana_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_dias_de_semana_fk" value="{dias_de_semana}"/>
                                                                                                <input type="hidden" name="p_dias_de_semana_fk_desc" value="{dias_de_semana_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_dias_de_semana_fk" value="{dias_de_semana}"/>
                                                                                            <input type="hidden" name="p_dias_de_semana_fk_desc" value="{dias_de_semana_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="hora_inicio">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(hora_inicio/@visible)">
                                                                                            <td field="hora_inicio" data-row="{position()}" data-title="{../../../fields/hora_inicio/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="hora_inicio_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_hora_inicio_fk" value="{hora_inicio}"/>
                                                                                                <input type="hidden" name="p_hora_inicio_fk_desc" value="{hora_inicio_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_hora_inicio_fk" value="{hora_inicio}"/>
                                                                                            <input type="hidden" name="p_hora_inicio_fk_desc" value="{hora_inicio_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="hora_fim">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(hora_fim/@visible)">
                                                                                            <td field="hora_fim" data-row="{position()}" data-title="{../../../fields/hora_fim/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="hora_fim_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_hora_fim_fk" value="{hora_fim}"/>
                                                                                                <input type="hidden" name="p_hora_fim_fk_desc" value="{hora_fim_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_hora_fim_fk" value="{hora_fim}"/>
                                                                                            <input type="hidden" name="p_hora_fim_fk_desc" value="{hora_fim_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="numero_de_atendedores">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(numero_de_atendedores/@visible)">
                                                                                            <td field="numero_de_atendedores" data-row="{position()}" data-title="{../../../fields/numero_de_atendedores/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="numero_de_atendedores_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_numero_de_atendedores_fk" value="{numero_de_atendedores}"/>
                                                                                                <input type="hidden" name="p_numero_de_atendedores_fk_desc" value="{numero_de_atendedores_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_numero_de_atendedores_fk" value="{numero_de_atendedores}"/>
                                                                                            <input type="hidden" name="p_numero_de_atendedores_fk_desc" value="{numero_de_atendedores_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tempo_medio_de_atendimento_mn">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(tempo_medio_de_atendimento_mn/@visible)">
                                                                                            <td field="tempo_medio_de_atendimento_mn" data-row="{position()}" data-title="{../../../fields/tempo_medio_de_atendimento_mn/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tempo_medio_de_atendimento_mn_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tempo_medio_de_atendimento_mn_fk" value="{tempo_medio_de_atendimento_mn}"/>
                                                                                                <input type="hidden" name="p_tempo_medio_de_atendimento_mn_fk_desc" value="{tempo_medio_de_atendimento_mn_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tempo_medio_de_atendimento_mn_fk" value="{tempo_medio_de_atendimento_mn}"/>
                                                                                            <input type="hidden" name="p_tempo_medio_de_atendimento_mn_fk_desc" value="{tempo_medio_de_atendimento_mn_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="antecedencia_alterarcancelar_hr">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(antecedencia_alterarcancelar_hr/@visible)">
                                                                                            <td field="antecedencia_alterarcancelar_hr" data-row="{position()}" data-title="{../../../fields/antecedencia_alterarcancelar_hr/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="antecedencia_alterarcancelar_hr_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_antecedencia_alterarcancelar_hr_fk" value="{antecedencia_alterarcancelar_hr}"/>
                                                                                                <input type="hidden" name="p_antecedencia_alterarcancelar_hr_fk_desc" value="{antecedencia_alterarcancelar_hr_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_antecedencia_alterarcancelar_hr_fk" value="{antecedencia_alterarcancelar_hr}"/>
                                                                                            <input type="hidden" name="p_antecedencia_alterarcancelar_hr_fk_desc" value="{antecedencia_alterarcancelar_hr_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="antecedencia_de_agendamento_hr">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(antecedencia_de_agendamento_hr/@visible)">
                                                                                            <td field="antecedencia_de_agendamento_hr" data-row="{position()}" data-title="{../../../fields/antecedencia_de_agendamento_hr/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="antecedencia_de_agendamento_hr_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_antecedencia_de_agendamento_hr_fk" value="{antecedencia_de_agendamento_hr}"/>
                                                                                                <input type="hidden" name="p_antecedencia_de_agendamento_hr_fk_desc" value="{antecedencia_de_agendamento_hr_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_antecedencia_de_agendamento_hr_fk" value="{antecedencia_de_agendamento_hr}"/>
                                                                                            <input type="hidden" name="p_antecedencia_de_agendamento_hr_fk_desc" value="{antecedencia_de_agendamento_hr_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="separatorlist_1">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="separatorlist_1">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
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
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1501679959258"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1501679959258"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1501679959258"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1501679959258"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1501679959259"/>
</xsl:stylesheet>
