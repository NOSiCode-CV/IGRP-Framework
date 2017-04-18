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
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_1">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                                        <xsl:if test="rows/content/form_1/fields/tipo_funcionario">
                                                                                            <div class="col-md-6  gen-fields-holder" item-name="tipo_funcionario" item-type="radiolist">
                                                                                                <div class="form-group">
                                                                                                    <label>
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_funcionario/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/tipo_funcionario/list/option">
                                                                                                        <div class="radio">
                                                                                                            <label>
                                                                                                                <input type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                                                    <xsl:if test="@selected='true'">
                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                    </xsl:if>
                                                                                                                </input>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </xsl:for-each>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/dados_pessoais">
                                                                                            <div class="box-head subtitle gen-fields-holder">
                                                                                                <xsl:value-of select="rows/content/form_1/fields/dados_pessoais/label"/>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/nome_completo">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="nome_completo" item-type="text" required="required">
                                                                                                <label for="{rows/content/form_1/fields/nome_completo/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/nome_completo/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/nome_completo/value}" class="form-control " id="{rows/content/form_1/fields/nome_completo/@name}" name="{rows/content/form_1/fields/nome_completo/@name}" readonly="readonly" required="required" maxlength="100" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/sexo">
                                                                                            <div class="col-md-6  gen-fields-holder" item-name="sexo" item-type="radiolist" required="required">
                                                                                                <div class="form-group">
                                                                                                    <label>
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/sexo/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/sexo/list/option">
                                                                                                        <div class="radio">
                                                                                                            <label>
                                                                                                                <input required="required" type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                                                    <xsl:if test="@selected='true'">
                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                    </xsl:if>
                                                                                                                </input>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </xsl:for-each>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/situacao_atual">
                                                                                            <div class="col-md-6 form-group  gen-fields-holder" item-name="situacao_atual" item-type="select" required="required">
                                                                                                <label for="{rows/content/form_1/fields/situacao_atual/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/situacao_atual/label"/>
                                                                                                </label>
                                                                                                <select class="form-control select2 " id="form_1_situacao_atual" name="{rows/content/form_1/fields/situacao_atual/@name}" required="required">
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/situacao_atual/list/option">
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
                                                                                        <xsl:if test="rows/content/form_1/fields/estado_civil">
                                                                                            <div class="col-md-6 form-group  gen-fields-holder" item-name="estado_civil" item-type="select" required="required">
                                                                                                <label for="{rows/content/form_1/fields/estado_civil/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/estado_civil/label"/>
                                                                                                </label>
                                                                                                <select class="form-control select2 " id="form_1_estado_civil" name="{rows/content/form_1/fields/estado_civil/@name}" required="required">
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/estado_civil/list/option">
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
                                                                                        <xsl:if test="rows/content/form_1/fields/nascido_em">
                                                                                            <div class="form-group col-md-6  gen-fields-holder" item-name="nascido_em" item-type="date" required="required">
                                                                                                <label for="{rows/content/form_1/fields/nascido_em/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/nascido_em/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <div class="input-group">
                                                                                                    <input type="text" value="{rows/content/form_1/fields/nascido_em/value}" class="form-control gen-date " id="form_1-nascido_em" name="{rows/content/form_1/fields/nascido_em/@name}" required="required" format="IGRP_datePicker" maxlength="30"/>
                                                                                                    <span class="input-group-btn gen-date-icon">
                                                                                                        <span class="btn btn-default">
                                                                                                            <i class="fa fa-calendar"/>
                                                                                                        </span>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/local_de_residencia">
                                                                                            <div class="form-group col-md-6  gen-fields-holder" item-name="local_de_residencia" item-type="lookup" required="required">
                                                                                                <label for="{rows/content/form_1/fields/local_de_residencia/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/local_de_residencia/label"/>
                                                                                                </label>
                                                                                                <div class="input-group">
                                                                                                    <input type="text" value="{rows/content/form_1/fields/local_de_residencia/value}" class="form-control gen-lookup " id="form_1_local_de_residencia" name="{rows/content/form_1/fields/local_de_residencia/@name}" required="required" maxlength="30"/>
                                                                                                    <xsl:call-template name="lookup-tool">
                                                                                                        <xsl:with-param name="page" select="rows/page"/>
                                                                                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                                        <xsl:with-param name="name" select="rows/content/form_1/fields/local_de_residencia/@name"/>
                                                                                                        <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/local_de_residencia/lookup"/>
                                                                                                        <xsl:with-param name="input-id" select="'form_1_local_de_residencia'"/>
                                                                                                        <xsl:with-param name="btnClass" select="'default'"/>
                                                                                                    </xsl:call-template>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/nacionalidade">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="nacionalidade" item-type="text">
                                                                                                <label for="{rows/content/form_1/fields/nacionalidade/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/nacionalidade/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/nacionalidade/value}" class="form-control " id="{rows/content/form_1/fields/nacionalidade/@name}" name="{rows/content/form_1/fields/nacionalidade/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/naturalidade">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="naturalidade" item-type="text" required="required">
                                                                                                <label for="{rows/content/form_1/fields/naturalidade/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/naturalidade/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/naturalidade/value}" class="form-control " id="{rows/content/form_1/fields/naturalidade/@name}" name="{rows/content/form_1/fields/naturalidade/@name}" readonly="readonly" required="required" maxlength="30" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/mae">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="mae" item-type="text">
                                                                                                <label for="{rows/content/form_1/fields/mae/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/mae/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/mae/value}" class="form-control " id="{rows/content/form_1/fields/mae/@name}" name="{rows/content/form_1/fields/mae/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_1/fields/pai">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="pai" item-type="text">
                                                                                                <label for="{rows/content/form_1/fields/pai/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/pai/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/pai/value}" class="form-control " id="{rows/content/form_1/fields/pai/@name}" name="{rows/content/form_1/fields/pai/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/separatorlist_1">
                                                                            <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/separatorlist_1/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                                                    <div class="splist-form-holder">
                                                                                        <div class="splist-form" role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/tipo_de_contacto">
                                                                                                <div class="col-md-6 form-group  gen-fields-holder" item-name="tipo_de_contacto" item-type="select">
                                                                                                    <label for="{rows/content/separatorlist_1/fields/tipo_de_contacto/@name}">
                                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_de_contacto/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="separatorlist_1_tipo_de_contacto" name="{rows/content/separatorlist_1/fields/tipo_de_contacto/@name}">
                                                                                                        <xsl:for-each select="rows/content/separatorlist_1/fields/tipo_de_contacto/list/option">
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
                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/valor">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-name="valor" item-type="text">
                                                                                                    <label for="{rows/content/separatorlist_1/fields/valor/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/valor/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/separatorlist_1/fields/valor/value}" class="form-control " id="{rows/content/separatorlist_1/fields/valor/@name}" name="{rows/content/separatorlist_1/fields/valor/@name}" maxlength="100" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-box box-body box-table-contents splist-table">
                                                                                        <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/tipo_de_contacto">
                                                                                                        <xsl:if test="not(tipo_de_contacto/@visible)">
                                                                                                            <th align="" item-name="tipo_de_contacto">
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_de_contacto/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/valor">
                                                                                                        <xsl:if test="not(valor/@visible)">
                                                                                                            <th align="" item-name="valor">
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/valor/label"/>
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
                                                                                                        <xsl:if test="tipo_de_contacto">
                                                                                                            <xsl:choose>
                                                                                                                <xsl:when test="not(tipo_de_contacto/@visible)">
                                                                                                                    <td field="tipo_de_contacto" data-row="{position()}" data-title="{../../../fields/tipo_de_contacto/label}" class="select">
                                                                                                                        <span class="separator-list-td-val">
                                                                                                                            <xsl:value-of select="tipo_de_contacto_desc"/>
                                                                                                                        </span>
                                                                                                                        <input type="hidden" name="p_tipo_de_contacto_fk" value="{tipo_de_contacto}"/>
                                                                                                                        <input type="hidden" name="p_tipo_de_contacto_fk_desc" value="{tipo_de_contacto_desc}"/>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                <xsl:otherwise>
                                                                                                                    <input type="hidden" name="p_tipo_de_contacto_fk" value="{tipo_de_contacto}"/>
                                                                                                                    <input type="hidden" name="p_tipo_de_contacto_fk_desc" value="{tipo_de_contacto_desc}"/>
                                                                                                                </xsl:otherwise>
                                                                                                            </xsl:choose>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="valor">
                                                                                                            <xsl:choose>
                                                                                                                <xsl:when test="not(valor/@visible)">
                                                                                                                    <td field="valor" data-row="{position()}" data-title="{../../../fields/valor/label}" class="text">
                                                                                                                        <span class="separator-list-td-val">
                                                                                                                            <xsl:value-of select="valor_desc"/>
                                                                                                                        </span>
                                                                                                                        <input type="hidden" name="p_valor_fk" value="{valor}"/>
                                                                                                                        <input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                <xsl:otherwise>
                                                                                                                    <input type="hidden" name="p_valor_fk" value="{valor}"/>
                                                                                                                    <input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
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
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_2">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/form_2/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                                        <xsl:if test="rows/content/form_2/fields/banco">
                                                                                            <div class="col-md-6 form-group  gen-fields-holder" item-name="banco" item-type="select" required="required">
                                                                                                <label for="{rows/content/form_2/fields/banco/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_2/fields/banco/label"/>
                                                                                                </label>
                                                                                                <select class="form-control select2 " id="form_2_banco" name="{rows/content/form_2/fields/banco/@name}" required="required">
                                                                                                    <xsl:for-each select="rows/content/form_2/fields/banco/list/option">
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
                                                                                        <xsl:if test="rows/content/form_2/fields/nib">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="nib" item-type="number" required="required">
                                                                                                <label for="{rows/content/form_2/fields/nib/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_2/fields/nib/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="number" value="{rows/content/form_2/fields/nib/value}" class="form-control " id="{rows/content/form_2/fields/nib/@name}" name="{rows/content/form_2/fields/nib/@name}" required="required" maxlength="21" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_2/fields/numero_de_conta">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="numero_de_conta" item-type="number">
                                                                                                <label for="{rows/content/form_2/fields/numero_de_conta/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_2/fields/numero_de_conta/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="number" value="{rows/content/form_2/fields/numero_de_conta/value}" class="form-control " id="{rows/content/form_2/fields/numero_de_conta/@name}" name="{rows/content/form_2/fields/numero_de_conta/@name}" readonly="readonly" maxlength="15" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/separatorlist_2">
                                                                            <div class="box gen-container-item " gen-class="" item-name="separatorlist_2">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/separatorlist_2/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body IGRP-separatorlist" tag="separatorlist_2" dialog="false">
                                                                                    <div class="splist-form-holder">
                                                                                        <div class="splist-form" role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_2/fields"/>
                                                                                            <xsl:if test="rows/content/separatorlist_2/fields/tipo_de_documento">
                                                                                                <div class="col-md-6 form-group  gen-fields-holder" item-name="tipo_de_documento" item-type="select">
                                                                                                    <label for="{rows/content/separatorlist_2/fields/tipo_de_documento/@name}">
                                                                                                        <xsl:value-of select="rows/content/separatorlist_2/fields/tipo_de_documento/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="separatorlist_2_tipo_de_documento" name="{rows/content/separatorlist_2/fields/tipo_de_documento/@name}">
                                                                                                        <xsl:for-each select="rows/content/separatorlist_2/fields/tipo_de_documento/list/option">
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
                                                                                            <xsl:if test="rows/content/separatorlist_2/fields/emitido_em">
                                                                                                <div class="form-group col-md-6  gen-fields-holder" item-name="emitido_em" item-type="date">
                                                                                                    <label for="{rows/content/separatorlist_2/fields/emitido_em/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/emitido_em/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/separatorlist_2/fields/emitido_em/value}" class="form-control gen-date " id="separatorlist_2-emitido_em" name="{rows/content/separatorlist_2/fields/emitido_em/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/separatorlist_2/fields/local_de_emissao_do_bi">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-name="local_de_emissao_do_bi" item-type="text">
                                                                                                    <label for="{rows/content/separatorlist_2/fields/local_de_emissao_do_bi/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/local_de_emissao_do_bi/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/separatorlist_2/fields/local_de_emissao_do_bi/value}" class="form-control " id="{rows/content/separatorlist_2/fields/local_de_emissao_do_bi/@name}" name="{rows/content/separatorlist_2/fields/local_de_emissao_do_bi/@name}" maxlength="30" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/separatorlist_2/fields/valido_ate">
                                                                                                <div class="form-group col-md-6  gen-fields-holder" item-name="valido_ate" item-type="date">
                                                                                                    <label for="{rows/content/separatorlist_2/fields/valido_ate/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/valido_ate/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/separatorlist_2/fields/valido_ate/value}" class="form-control gen-date " id="separatorlist_2-valido_ate" name="{rows/content/separatorlist_2/fields/valido_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                                    <div class="table-box box-body box-table-contents splist-table">
                                                                                        <table rel="T_separatorlist_2" id="separatorlist_2" class="table table-striped gen-data-table">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/separatorlist_2/fields/tipo_de_documento">
                                                                                                        <xsl:if test="not(tipo_de_documento/@visible)">
                                                                                                            <th align="" item-name="tipo_de_documento">
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/tipo_de_documento/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_2/fields/emitido_em">
                                                                                                        <xsl:if test="not(emitido_em/@visible)">
                                                                                                            <th align="" item-name="emitido_em">
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/emitido_em/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_2/fields/local_de_emissao_do_bi">
                                                                                                        <xsl:if test="not(local_de_emissao_do_bi/@visible)">
                                                                                                            <th align="" item-name="local_de_emissao_do_bi">
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/local_de_emissao_do_bi/label"/>
                                                                                                                </span>
                                                                                                            </th>
                                                                                                        </xsl:if>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/separatorlist_2/fields/valido_ate">
                                                                                                        <xsl:if test="not(valido_ate/@visible)">
                                                                                                            <th align="" item-name="valido_ate">
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/valido_ate/label"/>
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
                                                                                                <xsl:for-each select="rows/content/separatorlist_2/table/value/row">
                                                                                                    <tr>
                                                                                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_2_id" value="{separatorlist_2_id}"/>
                                                                                                        <xsl:if test="tipo_de_documento">
                                                                                                            <xsl:choose>
                                                                                                                <xsl:when test="not(tipo_de_documento/@visible)">
                                                                                                                    <td field="tipo_de_documento" data-row="{position()}" data-title="{../../../fields/tipo_de_documento/label}" class="select">
                                                                                                                        <span class="separator-list-td-val">
                                                                                                                            <xsl:value-of select="tipo_de_documento_desc"/>
                                                                                                                        </span>
                                                                                                                        <input type="hidden" name="p_tipo_de_documento_fk" value="{tipo_de_documento}"/>
                                                                                                                        <input type="hidden" name="p_tipo_de_documento_fk_desc" value="{tipo_de_documento_desc}"/>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                <xsl:otherwise>
                                                                                                                    <input type="hidden" name="p_tipo_de_documento_fk" value="{tipo_de_documento}"/>
                                                                                                                    <input type="hidden" name="p_tipo_de_documento_fk_desc" value="{tipo_de_documento_desc}"/>
                                                                                                                </xsl:otherwise>
                                                                                                            </xsl:choose>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="emitido_em">
                                                                                                            <xsl:choose>
                                                                                                                <xsl:when test="not(emitido_em/@visible)">
                                                                                                                    <td field="emitido_em" data-row="{position()}" data-title="{../../../fields/emitido_em/label}" class="date">
                                                                                                                        <span class="separator-list-td-val">
                                                                                                                            <xsl:value-of select="emitido_em_desc"/>
                                                                                                                        </span>
                                                                                                                        <input type="hidden" name="p_emitido_em_fk" value="{emitido_em}"/>
                                                                                                                        <input type="hidden" name="p_emitido_em_fk_desc" value="{emitido_em_desc}"/>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                <xsl:otherwise>
                                                                                                                    <input type="hidden" name="p_emitido_em_fk" value="{emitido_em}"/>
                                                                                                                    <input type="hidden" name="p_emitido_em_fk_desc" value="{emitido_em_desc}"/>
                                                                                                                </xsl:otherwise>
                                                                                                            </xsl:choose>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="local_de_emissao_do_bi">
                                                                                                            <xsl:choose>
                                                                                                                <xsl:when test="not(local_de_emissao_do_bi/@visible)">
                                                                                                                    <td field="local_de_emissao_do_bi" data-row="{position()}" data-title="{../../../fields/local_de_emissao_do_bi/label}" class="text">
                                                                                                                        <span class="separator-list-td-val">
                                                                                                                            <xsl:value-of select="local_de_emissao_do_bi_desc"/>
                                                                                                                        </span>
                                                                                                                        <input type="hidden" name="p_local_de_emissao_do_bi_fk" value="{local_de_emissao_do_bi}"/>
                                                                                                                        <input type="hidden" name="p_local_de_emissao_do_bi_fk_desc" value="{local_de_emissao_do_bi_desc}"/>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                <xsl:otherwise>
                                                                                                                    <input type="hidden" name="p_local_de_emissao_do_bi_fk" value="{local_de_emissao_do_bi}"/>
                                                                                                                    <input type="hidden" name="p_local_de_emissao_do_bi_fk_desc" value="{local_de_emissao_do_bi_desc}"/>
                                                                                                                </xsl:otherwise>
                                                                                                            </xsl:choose>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="valido_ate">
                                                                                                            <xsl:choose>
                                                                                                                <xsl:when test="not(valido_ate/@visible)">
                                                                                                                    <td field="valido_ate" data-row="{position()}" data-title="{../../../fields/valido_ate/label}" class="date">
                                                                                                                        <span class="separator-list-td-val">
                                                                                                                            <xsl:value-of select="valido_ate_desc"/>
                                                                                                                        </span>
                                                                                                                        <input type="hidden" name="p_valido_ate_fk" value="{valido_ate}"/>
                                                                                                                        <input type="hidden" name="p_valido_ate_fk_desc" value="{valido_ate_desc}"/>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                <xsl:otherwise>
                                                                                                                    <input type="hidden" name="p_valido_ate_fk" value="{valido_ate}"/>
                                                                                                                    <input type="hidden" name="p_valido_ate_fk_desc" value="{valido_ate_desc}"/>
                                                                                                                </xsl:otherwise>
                                                                                                            </xsl:choose>
                                                                                                        </xsl:if>
                                                                                                        <td data-row="{position()}" class="table-btn">
                                                                                                            <xsl:if test="not(@noupdate)">
                                                                                                                <span class="table-row-edit btn btn-default " rel="separatorlist_2">
                                                                                                                    <i class="fa fa-pencil"/>
                                                                                                                </span>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="not(@nodelete)">
                                                                                                                <span class="table-row-remove btn btn-danger" rel="separatorlist_2">
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
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492088163479"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492088163479"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492088163479"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492088163479"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492088163479"/>
</xsl:stylesheet>