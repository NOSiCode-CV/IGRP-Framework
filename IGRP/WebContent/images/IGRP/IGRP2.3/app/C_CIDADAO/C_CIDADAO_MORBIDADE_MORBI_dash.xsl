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
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
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
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_1/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-12">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_1">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                                        <xsl:if test="rows/content/form_1/fields/grupo">
                                                                                            <div class="col-md-3 form-group  gen-fields-holder" item-name="grupo" item-type="select" required="required">
                                                                                                <label for="{rows/content/form_1/fields/grupo/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/grupo/label"/>
                                                                                                </label>
                                                                                                <select class="form-control select2 " id="form_1_grupo" name="{rows/content/form_1/fields/grupo/@name}" required="required">
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/grupo/list/option">
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
                                                                                        <xsl:if test="rows/content/form_1/fields/subgrupo">
                                                                                            <div class="col-md-3 form-group  gen-fields-holder" item-name="subgrupo" item-type="select" required="required">
                                                                                                <label for="{rows/content/form_1/fields/subgrupo/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/subgrupo/label"/>
                                                                                                </label>
                                                                                                <select class="form-control select2 " id="form_1_subgrupo" name="{rows/content/form_1/fields/subgrupo/@name}" required="required">
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/subgrupo/list/option">
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
                                                                                        <xsl:if test="rows/content/form_1/fields/categoria">
                                                                                            <div class="col-md-3 form-group  gen-fields-holder" item-name="categoria" item-type="select" required="required">
                                                                                                <label for="{rows/content/form_1/fields/categoria/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/categoria/label"/>
                                                                                                </label>
                                                                                                <select class="form-control select2 " id="form_1_categoria" name="{rows/content/form_1/fields/categoria/@name}" required="required">
                                                                                                    <xsl:for-each select="rows/content/form_1/fields/categoria/list/option">
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
                                                                                        <xsl:if test="rows/content/form_1/fields/ano">
                                                                                            <div class="form-group col-md-3   gen-fields-holder" item-name="ano" item-type="number" required="required">
                                                                                                <label for="{rows/content/form_1/fields/ano/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/ano/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="number" value="{rows/content/form_1/fields/ano/value}" class="form-control " id="{rows/content/form_1/fields/ano/@name}" name="{rows/content/form_1/fields/ano/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                        <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                                            <div class="box-body" gen-preserve-content="true">
                                                                                <div>
                                                                                    <div class="row">
                                                                                        <div class="gen-column col-md-12">
                                                                                            <div class="gen-inner">
                                                                                                <xsl:if test="rows/content/separatorlist_1">
                                                                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                                                                            <div class="splist-form-holder">
                                                                                                                <div class="splist-form" role="form">
                                                                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/area_geografica">
                                                                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="area_geografica" item-type="lookup" required="required">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/area_geografica/@name}">
                                                                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/area_geografica/label"/>
                                                                                                                            </label>
                                                                                                                            <div class="input-group">
                                                                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/area_geografica/value}" class="form-control gen-lookup " id="separatorlist_1_area_geografica" name="{rows/content/separatorlist_1/fields/area_geografica/@name}" required="required" maxlength="30"/>
                                                                                                                                <xsl:call-template name="lookup-tool">
                                                                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                                                                    <xsl:with-param name="name" select="rows/content/separatorlist_1/fields/area_geografica/@name"/>
                                                                                                                                    <xsl:with-param name="js_lookup" select="rows/content/separatorlist_1/fields/area_geografica/lookup"/>
                                                                                                                                    <xsl:with-param name="input-id" select="'separatorlist_1_area_geografica'"/>
                                                                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                                                                </xsl:call-template>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </xsl:if>
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/numero_de_casos">
                                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="numero_de_casos" item-type="number">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/numero_de_casos/@name}">
                                                                                                                                <span>
                                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_casos/label"/>
                                                                                                                                </span>
                                                                                                                            </label>
                                                                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/numero_de_casos/value}" class="form-control " id="{rows/content/separatorlist_1/fields/numero_de_casos/@name}" name="{rows/content/separatorlist_1/fields/numero_de_casos/@name}" maxlength="30" placeholder=""></input>
                                                                                                                        </div>
                                                                                                                    </xsl:if>
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/sexo">
                                                                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="sexo" item-type="select" required="required">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/sexo/@name}">
                                                                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/sexo/label"/>
                                                                                                                            </label>
                                                                                                                            <select class="form-control select2 " id="separatorlist_1_sexo" name="{rows/content/separatorlist_1/fields/sexo/@name}" required="required">
                                                                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/sexo/list/option">
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
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/faixa_etaria">
                                                                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="faixa_etaria" item-type="select" required="required">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/faixa_etaria/@name}">
                                                                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/faixa_etaria/label"/>
                                                                                                                            </label>
                                                                                                                            <select class="form-control select2 " id="separatorlist_1_faixa_etaria" name="{rows/content/separatorlist_1/fields/faixa_etaria/@name}" required="required">
                                                                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/faixa_etaria/list/option">
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
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/incedencia">
                                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="incedencia" item-type="number" required="required">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/incedencia/@name}">
                                                                                                                                <span>
                                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/incedencia/label"/>
                                                                                                                                </span>
                                                                                                                            </label>
                                                                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/incedencia/value}" class="form-control " id="{rows/content/separatorlist_1/fields/incedencia/@name}" name="{rows/content/separatorlist_1/fields/incedencia/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                                                                        </div>
                                                                                                                    </xsl:if>
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/prevalencia">
                                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="prevalencia" item-type="number" required="required">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/prevalencia/@name}">
                                                                                                                                <span>
                                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/prevalencia/label"/>
                                                                                                                                </span>
                                                                                                                            </label>
                                                                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/prevalencia/value}" class="form-control " id="{rows/content/separatorlist_1/fields/prevalencia/@name}" name="{rows/content/separatorlist_1/fields/prevalencia/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                                                                        </div>
                                                                                                                    </xsl:if>
                                                                                                                    <xsl:if test="rows/content/separatorlist_1/fields/numero_de_obito">
                                                                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="numero_de_obito" item-type="number">
                                                                                                                            <label for="{rows/content/separatorlist_1/fields/numero_de_obito/@name}">
                                                                                                                                <span>
                                                                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_obito/label"/>
                                                                                                                                </span>
                                                                                                                            </label>
                                                                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/numero_de_obito/value}" class="form-control " id="{rows/content/separatorlist_1/fields/numero_de_obito/@name}" name="{rows/content/separatorlist_1/fields/numero_de_obito/@name}" maxlength="30" placeholder=""></input>
                                                                                                                        </div>
                                                                                                                    </xsl:if>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                                                                    <thead>
                                                                                                                        <tr>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/area_geografica">
                                                                                                                                <xsl:if test="not(area_geografica/@visible)">
                                                                                                                                    <th align="" item-name="area_geografica">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/area_geografica/label"/>
                                                                                                                                        </span>
                                                                                                                                    </th>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/numero_de_casos">
                                                                                                                                <xsl:if test="not(numero_de_casos/@visible)">
                                                                                                                                    <th align="" item-name="numero_de_casos">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_casos/label"/>
                                                                                                                                        </span>
                                                                                                                                    </th>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/sexo">
                                                                                                                                <xsl:if test="not(sexo/@visible)">
                                                                                                                                    <th align="" item-name="sexo">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/sexo/label"/>
                                                                                                                                        </span>
                                                                                                                                    </th>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/faixa_etaria">
                                                                                                                                <xsl:if test="not(faixa_etaria/@visible)">
                                                                                                                                    <th align="" item-name="faixa_etaria">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/faixa_etaria/label"/>
                                                                                                                                        </span>
                                                                                                                                    </th>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/incedencia">
                                                                                                                                <xsl:if test="not(incedencia/@visible)">
                                                                                                                                    <th align="" item-name="incedencia">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/incedencia/label"/>
                                                                                                                                        </span>
                                                                                                                                    </th>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/prevalencia">
                                                                                                                                <xsl:if test="not(prevalencia/@visible)">
                                                                                                                                    <th align="" item-name="prevalencia">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/prevalencia/label"/>
                                                                                                                                        </span>
                                                                                                                                    </th>
                                                                                                                                </xsl:if>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:if test="rows/content/separatorlist_1/fields/numero_de_obito">
                                                                                                                                <xsl:if test="not(numero_de_obito/@visible)">
                                                                                                                                    <th align="" item-name="numero_de_obito">
                                                                                                                                        <span>
                                                                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/numero_de_obito/label"/>
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
                                                                                                                                <xsl:if test="area_geografica">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(area_geografica/@visible)">
                                                                                                                                            <td field="area_geografica" data-row="{position()}" data-title="{../../../fields/area_geografica/label}" class="lookup">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="area_geografica_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_area_geografica_fk" value="{area_geografica}"/>
                                                                                                                                                <input type="hidden" name="p_area_geografica_fk_desc" value="{area_geografica_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_area_geografica_fk" value="{area_geografica}"/>
                                                                                                                                            <input type="hidden" name="p_area_geografica_fk_desc" value="{area_geografica_desc}"/>
                                                                                                                                        </xsl:otherwise>
                                                                                                                                    </xsl:choose>
                                                                                                                                </xsl:if>
                                                                                                                                <xsl:if test="numero_de_casos">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(numero_de_casos/@visible)">
                                                                                                                                            <td field="numero_de_casos" data-row="{position()}" data-title="{../../../fields/numero_de_casos/label}" class="number">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="numero_de_casos_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_numero_de_casos_fk" value="{numero_de_casos}"/>
                                                                                                                                                <input type="hidden" name="p_numero_de_casos_fk_desc" value="{numero_de_casos_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_numero_de_casos_fk" value="{numero_de_casos}"/>
                                                                                                                                            <input type="hidden" name="p_numero_de_casos_fk_desc" value="{numero_de_casos_desc}"/>
                                                                                                                                        </xsl:otherwise>
                                                                                                                                    </xsl:choose>
                                                                                                                                </xsl:if>
                                                                                                                                <xsl:if test="sexo">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(sexo/@visible)">
                                                                                                                                            <td field="sexo" data-row="{position()}" data-title="{../../../fields/sexo/label}" class="select">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="sexo_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_sexo_fk" value="{sexo}"/>
                                                                                                                                                <input type="hidden" name="p_sexo_fk_desc" value="{sexo_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_sexo_fk" value="{sexo}"/>
                                                                                                                                            <input type="hidden" name="p_sexo_fk_desc" value="{sexo_desc}"/>
                                                                                                                                        </xsl:otherwise>
                                                                                                                                    </xsl:choose>
                                                                                                                                </xsl:if>
                                                                                                                                <xsl:if test="faixa_etaria">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(faixa_etaria/@visible)">
                                                                                                                                            <td field="faixa_etaria" data-row="{position()}" data-title="{../../../fields/faixa_etaria/label}" class="select">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="faixa_etaria_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_faixa_etaria_fk" value="{faixa_etaria}"/>
                                                                                                                                                <input type="hidden" name="p_faixa_etaria_fk_desc" value="{faixa_etaria_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_faixa_etaria_fk" value="{faixa_etaria}"/>
                                                                                                                                            <input type="hidden" name="p_faixa_etaria_fk_desc" value="{faixa_etaria_desc}"/>
                                                                                                                                        </xsl:otherwise>
                                                                                                                                    </xsl:choose>
                                                                                                                                </xsl:if>
                                                                                                                                <xsl:if test="incedencia">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(incedencia/@visible)">
                                                                                                                                            <td field="incedencia" data-row="{position()}" data-title="{../../../fields/incedencia/label}" class="number">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="incedencia_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_incedencia_fk" value="{incedencia}"/>
                                                                                                                                                <input type="hidden" name="p_incedencia_fk_desc" value="{incedencia_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_incedencia_fk" value="{incedencia}"/>
                                                                                                                                            <input type="hidden" name="p_incedencia_fk_desc" value="{incedencia_desc}"/>
                                                                                                                                        </xsl:otherwise>
                                                                                                                                    </xsl:choose>
                                                                                                                                </xsl:if>
                                                                                                                                <xsl:if test="prevalencia">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(prevalencia/@visible)">
                                                                                                                                            <td field="prevalencia" data-row="{position()}" data-title="{../../../fields/prevalencia/label}" class="number">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="prevalencia_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_prevalencia_fk" value="{prevalencia}"/>
                                                                                                                                                <input type="hidden" name="p_prevalencia_fk_desc" value="{prevalencia_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_prevalencia_fk" value="{prevalencia}"/>
                                                                                                                                            <input type="hidden" name="p_prevalencia_fk_desc" value="{prevalencia_desc}"/>
                                                                                                                                        </xsl:otherwise>
                                                                                                                                    </xsl:choose>
                                                                                                                                </xsl:if>
                                                                                                                                <xsl:if test="numero_de_obito">
                                                                                                                                    <xsl:choose>
                                                                                                                                        <xsl:when test="not(numero_de_obito/@visible)">
                                                                                                                                            <td field="numero_de_obito" data-row="{position()}" data-title="{../../../fields/numero_de_obito/label}" class="number">
                                                                                                                                                <span class="separator-list-td-val">
                                                                                                                                                    <xsl:value-of select="numero_de_obito_desc"/>
                                                                                                                                                </span>
                                                                                                                                                <input type="hidden" name="p_numero_de_obito_fk" value="{numero_de_obito}"/>
                                                                                                                                                <input type="hidden" name="p_numero_de_obito_fk_desc" value="{numero_de_obito_desc}"/>
                                                                                                                                            </td>
                                                                                                                                        </xsl:when>
                                                                                                                                        <xsl:otherwise>
                                                                                                                                            <input type="hidden" name="p_numero_de_obito_fk" value="{numero_de_obito}"/>
                                                                                                                                            <input type="hidden" name="p_numero_de_obito_fk_desc" value="{numero_de_obito_desc}"/>
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
                                                                                                <xsl:if test="rows/content/form_2">
                                                                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                                                                        <div class="box-body">
                                                                                                            <div role="form">
                                                                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491908152148"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491908152148"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491908152148"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491908152148"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491908152149"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1491908152149"/>
</xsl:stylesheet>