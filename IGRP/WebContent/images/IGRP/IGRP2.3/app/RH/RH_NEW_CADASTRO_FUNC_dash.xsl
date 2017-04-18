<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/dados_gerais">
                                                            <li item-name="dados_gerais" class="active gen-fields-holder" rel="tab-tabcontent_1-dados_gerais">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-dados_gerais">
                                                                    <i class="fa fa-cog"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/dados_gerais/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/mobilidades">
                                                            <li item-name="mobilidades" class=" gen-fields-holder" rel="tab-tabcontent_1-mobilidades">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-mobilidades">
                                                                    <i class="fa fa-spinner"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/mobilidades/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/formacao">
                                                            <li item-name="formacao" class=" gen-fields-holder" rel="tab-tabcontent_1-formacao">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-formacao">
                                                                    <i class="fa fa-graduation-cap"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/formacao/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/avaliacao">
                                                            <li item-name="avaliacao" class=" gen-fields-holder" rel="tab-tabcontent_1-avaliacao">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-avaliacao">
                                                                    <i class="fa fa-smile-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/avaliacao/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/rendenc">
                                                            <li item-name="rendenc" class=" gen-fields-holder" rel="tab-tabcontent_1-rendenc">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-rendenc">
                                                                    <i class="fa fa-dollar"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/rendenc/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/relatorios">
                                                            <li item-name="relatorios" class=" gen-fields-holder" rel="tab-tabcontent_1-relatorios">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-relatorios">
                                                                    <i class="fa fa-file-pdf-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/relatorios/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/dados_gerais">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-dados_gerais" rel="tab-tabcontent_1-dados_gerais">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_1">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                                                    <div class="btns-holder  pull-right" role="group">
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
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/mobilidades">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-mobilidades" rel="tab-tabcontent_1-mobilidades">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_2">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_2">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_2" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/formacao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-formacao" rel="tab-tabcontent_1-formacao">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_3">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_3">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_3" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/avaliacao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-avaliacao" rel="tab-tabcontent_1-avaliacao">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_4">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_4">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_4" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/rendenc">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-rendenc" rel="tab-tabcontent_1-rendenc">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_5">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_5">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_5" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/relatorios">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-relatorios" rel="tab-tabcontent_1-relatorios">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_6">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_6">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_6" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                    </div>
                                                </div>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
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
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/toolsbar_7">
                                                                            <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_7">
                                                                                <div class="btns-holder  pull-right" role="group">
                                                                                    <xsl:apply-templates select="rows/content/toolsbar_7" mode="gen-buttons">
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/view_onli">
                                                    <div class="box clearfix view-block gen-container-item " has-img="true" gen-class="" item-name="view_onli">
                                                        <div class="box-body">
                                                            <xsl:if test="rows/content/view_onli/fields/view_img">
                                                                <img src="{rows/content/view_onli/fields/view_img}"/>
                                                            </xsl:if>
                                                            <div class="view-body clearfix ">
                                                                <xsl:if test="rows/content/view_onli/fields/nome_completo">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/nome_completo/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/nome_completo/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_onli/fields/nascido_em">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/nascido_em/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/nascido_em/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_onli/fields/estado_civil">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/estado_civil/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/estado_civil/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_onli/fields/sexo">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/sexo/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_onli/fields/sexo/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
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
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="naturalidade" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/naturalidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/naturalidade/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/naturalidade/value}" class="form-control " id="{rows/content/form_1/fields/naturalidade/@name}" name="{rows/content/form_1/fields/naturalidade/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/situacao_atual">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="situacao_atual" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/situacao_atual/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/situacao_atual/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/situacao_atual/value}" class="form-control " id="{rows/content/form_1/fields/situacao_atual/@name}" name="{rows/content/form_1/fields/situacao_atual/@name}" maxlength="30" placeholder=""></input>
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
                                                            <xsl:with-param name="collapsible" select="'false'"/>
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
                                                                            <input type="text" value="{rows/content/separatorlist_1/fields/valor/value}" class="form-control " id="{rows/content/separatorlist_1/fields/valor/@name}" name="{rows/content/separatorlist_1/fields/valor/@name}" maxlength="30" placeholder=""></input>
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
                                                <xsl:if test="rows/content/form_3">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_3">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_3/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_3/fields"/>
                                                                <xsl:if test="rows/content/form_3/fields/banco">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="banco" item-type="select">
                                                                        <label for="{rows/content/form_3/fields/banco/@name}">
                                                                            <xsl:value-of select="rows/content/form_3/fields/banco/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_3_banco" name="{rows/content/form_3/fields/banco/@name}">
                                                                            <xsl:for-each select="rows/content/form_3/fields/banco/list/option">
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
                                                                <xsl:if test="rows/content/form_3/fields/nib">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nib" item-type="number">
                                                                        <label for="{rows/content/form_3/fields/nib/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_3/fields/nib/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_3/fields/nib/value}" class="form-control " id="{rows/content/form_3/fields/nib/@name}" name="{rows/content/form_3/fields/nib/@name}" maxlength="21" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_3/fields/numero_de_conta">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="numero_de_conta" item-type="number">
                                                                        <label for="{rows/content/form_3/fields/numero_de_conta/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_3/fields/numero_de_conta/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_3/fields/numero_de_conta/value}" class="form-control " id="{rows/content/form_3/fields/numero_de_conta/@name}" name="{rows/content/form_3/fields/numero_de_conta/@name}" readonly="readonly" maxlength="15" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_3/tools-bar" mode="form-buttons"/>
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
                                                                    <xsl:if test="rows/content/separatorlist_2/fields/emitido_em_pass">
                                                                        <div class="form-group col-md-6  gen-fields-holder" item-name="emitido_em_pass" item-type="date">
                                                                            <label for="{rows/content/separatorlist_2/fields/emitido_em_pass/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/emitido_em_pass/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_2/fields/emitido_em_pass/value}" class="form-control gen-date " id="separatorlist_2-emitido_em_pass" name="{rows/content/separatorlist_2/fields/emitido_em_pass/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                    <xsl:if test="rows/content/separatorlist_2/fields/valido_ate_pass">
                                                                        <div class="form-group col-md-6  gen-fields-holder" item-name="valido_ate_pass" item-type="date">
                                                                            <label for="{rows/content/separatorlist_2/fields/valido_ate_pass/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/valido_ate_pass/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_2/fields/valido_ate_pass/value}" class="form-control gen-date " id="separatorlist_2-valido_ate_pass" name="{rows/content/separatorlist_2/fields/valido_ate_pass/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                            <xsl:if test="rows/content/separatorlist_2/fields/emitido_em_pass">
                                                                                <xsl:if test="not(emitido_em_pass/@visible)">
                                                                                    <th align="" item-name="emitido_em_pass">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/emitido_em_pass/label"/>
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
                                                                            <xsl:if test="rows/content/separatorlist_2/fields/valido_ate_pass">
                                                                                <xsl:if test="not(valido_ate_pass/@visible)">
                                                                                    <th align="" item-name="valido_ate_pass">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/valido_ate_pass/label"/>
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
                                                                                <xsl:if test="emitido_em_pass">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(emitido_em_pass/@visible)">
                                                                                            <td field="emitido_em_pass" data-row="{position()}" data-title="{../../../fields/emitido_em_pass/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="emitido_em_pass_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_emitido_em_pass_fk" value="{emitido_em_pass}"/>
                                                                                                <input type="hidden" name="p_emitido_em_pass_fk_desc" value="{emitido_em_pass_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_emitido_em_pass_fk" value="{emitido_em_pass}"/>
                                                                                            <input type="hidden" name="p_emitido_em_pass_fk_desc" value="{emitido_em_pass_desc}"/>
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
                                                                                <xsl:if test="valido_ate_pass">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(valido_ate_pass/@visible)">
                                                                                            <td field="valido_ate_pass" data-row="{position()}" data-title="{../../../fields/valido_ate_pass/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="valido_ate_pass_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_valido_ate_pass_fk" value="{valido_ate_pass}"/>
                                                                                                <input type="hidden" name="p_valido_ate_pass_fk_desc" value="{valido_ate_pass_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_valido_ate_pass_fk" value="{valido_ate_pass}"/>
                                                                                            <input type="hidden" name="p_valido_ate_pass_fk_desc" value="{valido_ate_pass_desc}"/>
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
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492443167183"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492443167183"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492443167183"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492443167183"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492443167184"/>
</xsl:stylesheet>