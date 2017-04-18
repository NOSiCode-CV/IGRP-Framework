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
                <!-- TABLE CSS INCLUDES -->
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
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_documento">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_documento" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/tipo_documento/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_documento/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_tipo_documento" name="{rows/content/form_1/fields/tipo_documento/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_documento/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/bi">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="bi" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/bi/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/bi/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/bi/value}" class="form-control gen-lookup " id="form_1_bi" name="{rows/content/form_1/fields/bi/@name}" readonly="readonly" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/bi/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/bi/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_bi'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nif">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="nif" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/nif/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/nif/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/nif/value}" class="form-control gen-lookup " id="form_1_nif" name="{rows/content/form_1/fields/nif/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/nif/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/nif/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_nif'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/passaporte">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="passaporte" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/passaporte/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/passaporte/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/passaporte/value}" class="form-control " id="{rows/content/form_1/fields/passaporte/@name}" name="{rows/content/form_1/fields/passaporte/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_pedido">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_pedido" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/tipo_pedido/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_pedido/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_pedido" name="{rows/content/form_1/fields/tipo_pedido/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_pedido/list/option">
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
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_civil" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado_civil/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_civil/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado_civil" name="{rows/content/form_1/fields/estado_civil/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" maxlength="500" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sexo">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="sexo" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/sexo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/sexo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_sexo" name="{rows/content/form_1/fields/sexo/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/sexo/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/pai">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="pai" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/pai/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pai/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/pai/value}" class="form-control " id="{rows/content/form_1/fields/pai/@name}" name="{rows/content/form_1/fields/pai/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/mae">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="mae" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/mae/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/mae/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/mae/value}" class="form-control " id="{rows/content/form_1/fields/mae/@name}" name="{rows/content/form_1/fields/mae/@name}" maxlength="1000" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/naturalidade">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="naturalidade" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/naturalidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/naturalidade/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/naturalidade/value}" class="form-control " id="{rows/content/form_1/fields/naturalidade/@name}" name="{rows/content/form_1/fields/naturalidade/@name}" maxlength="200" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/residencia">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="residencia" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/residencia/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/residencia/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/residencia/value}" class="form-control gen-lookup " id="form_1_residencia" name="{rows/content/form_1/fields/residencia/@name}" required="required" readonly="readonly" maxlength="200"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/residencia/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/residencia/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_residencia'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/efeito">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="efeito" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/efeito/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/efeito/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/efeito/@name}" class="textarea form-control " maxlength="500">
                                                                            <xsl:value-of select="rows/content/form_1/fields/efeito/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/agregado_familiar">
                                                    <div class="box gen-container-item " gen-class="" item-name="agregado_familiar">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/agregado_familiar/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="agregado_familiar" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/agregado_familiar/fields"/>
                                                                    <xsl:if test="rows/content/agregado_familiar/fields/grau_parentesco">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="grau_parentesco" item-type="select">
                                                                            <label for="{rows/content/agregado_familiar/fields/grau_parentesco/@name}">
                                                                                <xsl:value-of select="rows/content/agregado_familiar/fields/grau_parentesco/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="agregado_familiar_grau_parentesco" name="{rows/content/agregado_familiar/fields/grau_parentesco/@name}">
                                                                                <xsl:for-each select="rows/content/agregado_familiar/fields/grau_parentesco/list/option">
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
                                                                    <xsl:if test="rows/content/agregado_familiar/fields/nome_agregado">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="nome_agregado" item-type="text">
                                                                            <label for="{rows/content/agregado_familiar/fields/nome_agregado/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/agregado_familiar/fields/nome_agregado/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/agregado_familiar/fields/nome_agregado/value}" class="form-control " id="{rows/content/agregado_familiar/fields/nome_agregado/@name}" name="{rows/content/agregado_familiar/fields/nome_agregado/@name}" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/agregado_familiar/fields/regime">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="regime" item-type="textarea">
                                                                            <label for="{rows/content/agregado_familiar/fields/regime/@name}">
                                                                                <xsl:value-of select="rows/content/agregado_familiar/fields/regime/label"/>
                                                                            </label>
                                                                            <textarea name="{rows/content/agregado_familiar/fields/regime/@name}" class="textarea form-control " maxlength="200">
                                                                                <xsl:value-of select="rows/content/agregado_familiar/fields/regime/value"/>
                                                                            </textarea>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_agregado_familiar" id="agregado_familiar" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/agregado_familiar/fields/grau_parentesco">
                                                                                <xsl:if test="not(grau_parentesco/@visible)">
                                                                                    <th align="" item-name="grau_parentesco">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/agregado_familiar/fields/grau_parentesco/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/agregado_familiar/fields/nome_agregado">
                                                                                <xsl:if test="not(nome_agregado/@visible)">
                                                                                    <th align="" item-name="nome_agregado">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/agregado_familiar/fields/nome_agregado/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/agregado_familiar/fields/regime">
                                                                                <xsl:if test="not(regime/@visible)">
                                                                                    <th align="" item-name="regime">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/agregado_familiar/fields/regime/label"/>
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
                                                                        <xsl:for-each select="rows/content/agregado_familiar/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_agregado_familiar_id" value="{agregado_familiar_id}"/>
                                                                                <xsl:if test="grau_parentesco">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(grau_parentesco/@visible)">
                                                                                            <td field="grau_parentesco" data-row="{position()}" data-title="{../../../fields/grau_parentesco/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="grau_parentesco_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_grau_parentesco_fk" value="{grau_parentesco}"/>
                                                                                                <input type="hidden" name="p_grau_parentesco_fk_desc" value="{grau_parentesco_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_grau_parentesco_fk" value="{grau_parentesco}"/>
                                                                                            <input type="hidden" name="p_grau_parentesco_fk_desc" value="{grau_parentesco_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nome_agregado">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(nome_agregado/@visible)">
                                                                                            <td field="nome_agregado" data-row="{position()}" data-title="{../../../fields/nome_agregado/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nome_agregado_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nome_agregado_fk" value="{nome_agregado}"/>
                                                                                                <input type="hidden" name="p_nome_agregado_fk_desc" value="{nome_agregado_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nome_agregado_fk" value="{nome_agregado}"/>
                                                                                            <input type="hidden" name="p_nome_agregado_fk_desc" value="{nome_agregado_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="regime">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(regime/@visible)">
                                                                                            <td field="regime" data-row="{position()}" data-title="{../../../fields/regime/label}" class="textarea">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="regime_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_regime_fk" value="{regime}"/>
                                                                                                <input type="hidden" name="p_regime_fk_desc" value="{regime_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_regime_fk" value="{regime}"/>
                                                                                            <input type="hidden" name="p_regime_fk_desc" value="{regime_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="agregado_familiar">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="agregado_familiar">
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
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
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
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491323635465"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491323635465"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491323635465"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491323635465"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491323635466"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1491323635466"/>
</xsl:stylesheet>