<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
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
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/processo_info">
                                                            <li item-name="processo_info" class="active gen-fields-holder" rel="tab-tabcontent_1-processo_info">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-processo_info">
                                                                    <i class="fa fa-angle-right"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/processo_info/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/documentos_auxiliares">
                                                            <li item-name="documentos_auxiliares" class=" gen-fields-holder" rel="tab-tabcontent_1-documentos_auxiliares">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-documentos_auxiliares">
                                                                    <i class="fa fa-angle-right"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/documentos_auxiliares/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/processo_info">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-processo_info" rel="tab-tabcontent_1-processo_info">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_1">
                                                                                <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                                            <xsl:if test="rows/content/form_1/fields/area_fk">
                                                                                                <div class="col-md-3 form-group  gen-fields-holder" item-name="area_fk" item-type="select" required="required">
                                                                                                    <label for="{rows/content/form_1/fields/area_fk/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/area_fk/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 IGRP_change" id="form_1_area_fk" name="{rows/content/form_1/fields/area_fk/@name}" required="required">
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/area_fk/list/option">
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
                                                                                            <xsl:if test="rows/content/form_1/fields/sep_proc">
                                                                                                <div class="box-head subtitle gen-fields-holder">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/sep_proc/label"/>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/code">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-name="code" item-type="text" required="required">
                                                                                                    <label for="{rows/content/form_1/fields/code/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/code/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_1/fields/code/value}" class="form-control " id="{rows/content/form_1/fields/code/@name}" name="{rows/content/form_1/fields/code/@name}" readonly="readonly" required="required" maxlength="20" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/name">
                                                                                                <div class="form-group col-md-9   gen-fields-holder" item-name="name" item-type="text" required="required">
                                                                                                    <label for="{rows/content/form_1/fields/name/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/name/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_1/fields/name/value}" class="form-control " id="{rows/content/form_1/fields/name/@name}" name="{rows/content/form_1/fields/name/@name}" required="required" maxlength="100" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/descr">
                                                                                                <div class="form-group col-md-12  gen-fields-holder" item-name="descr" item-type="textarea">
                                                                                                    <label for="{rows/content/form_1/fields/descr/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/descr/label"/>
                                                                                                    </label>
                                                                                                    <textarea name="{rows/content/form_1/fields/descr/@name}" class="textarea form-control " maxlength="4000">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/descr/value"/>
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/start_mod">
                                                                                                <div class="col-md-3  gen-fields-holder" item-name="start_mod" item-type="checkbox">
                                                                                                    <div class="form-group">
                                                                                                        <div class="checkbox form-check-offset">
                                                                                                            <label>
                                                                                                                <input type="checkbox" name="{rows/content/form_1/fields/start_mod/@name}" value="1" class="checkbox " label="{rows/content/form_1/fields/start_mod/label}">
                                                                                                                    <xsl:if test="rows/content/form_1/fields/start_mod/value = '1'">
                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                    </xsl:if>
                                                                                                                </input>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/form_1/fields/start_mod/label"/>
                                                                                                                </span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/flg_adhoc">
                                                                                                <div class="col-md-3  gen-fields-holder" item-name="flg_adhoc" item-type="checkbox">
                                                                                                    <div class="form-group">
                                                                                                        <div class="checkbox form-check-offset">
                                                                                                            <label>
                                                                                                                <input type="checkbox" name="{rows/content/form_1/fields/flg_adhoc/@name}" value="1" class="checkbox IGRP_change" label="{rows/content/form_1/fields/flg_adhoc/label}">
                                                                                                                    <xsl:if test="rows/content/form_1/fields/flg_adhoc/value = '1'">
                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                    </xsl:if>
                                                                                                                </input>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="rows/content/form_1/fields/flg_adhoc/label"/>
                                                                                                                </span>
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/acti_start">
                                                                                                <div class="col-md-3 form-group  gen-fields-holder" item-name="acti_start" item-type="select">
                                                                                                    <label for="{rows/content/form_1/fields/acti_start/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/acti_start/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_1_acti_start" name="{rows/content/form_1/fields/acti_start/@name}">
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/acti_start/list/option">
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
                                                                                            <xsl:if test="rows/content/form_1/fields/bpmn_diag">
                                                                                                <div class="box-head subtitle gen-fields-holder">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/bpmn_diag/label"/>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/file">
                                                                                                <div class="form-group col-md-3  gen-fields-holder" item-name="file" item-type="file">
                                                                                                    <label for="{rows/content/form_1/fields/file/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/file/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" class="form-control not-form" readonly=""/>
                                                                                                        <span class="input-group-btn">
                                                                                                            <span class="btn btn-default file-btn-holder">
                                                                                                                <i class="fa fa-upload"/>
                                                                                                                <input id="{rows/content/form_1/fields/file/@name}" name="{rows/content/form_1/fields/file/@name}" value="{rows/content/form_1/fields/file/value}" class="transparent" type="file" multiple=""/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/param_exec">
                                                                                                <div class="box-head subtitle gen-fields-holder">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/param_exec/label"/>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/time_unity">
                                                                                                <div class="col-md-3 form-group  gen-fields-holder" item-name="time_unity" item-type="select">
                                                                                                    <label for="{rows/content/form_1/fields/time_unity/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/time_unity/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_1_time_unity" name="{rows/content/form_1/fields/time_unity/@name}">
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/time_unity/list/option">
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
                                                                                            <xsl:if test="rows/content/form_1/fields/work_time">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-name="work_time" item-type="number">
                                                                                                    <label for="{rows/content/form_1/fields/work_time/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/work_time/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="number" value="{rows/content/form_1/fields/work_time/value}" class="form-control " id="{rows/content/form_1/fields/work_time/@name}" name="{rows/content/form_1/fields/work_time/@name}" maxlength="22" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/limit_time">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-name="limit_time" item-type="number">
                                                                                                    <label for="{rows/content/form_1/fields/limit_time/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/limit_time/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="number" value="{rows/content/form_1/fields/limit_time/value}" class="form-control " id="{rows/content/form_1/fields/limit_time/@name}" name="{rows/content/form_1/fields/limit_time/@name}" maxlength="22" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/warn_time">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-name="warn_time" item-type="number">
                                                                                                    <label for="{rows/content/form_1/fields/warn_time/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/warn_time/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="number" value="{rows/content/form_1/fields/warn_time/value}" class="form-control " id="{rows/content/form_1/fields/warn_time/@name}" name="{rows/content/form_1/fields/warn_time/@name}" maxlength="22" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/clone">
                                                                                                <div class="box-head subtitle gen-fields-holder">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/clone/label"/>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/aplicacao_origem">
                                                                                                <div class="col-md-4 form-group  gen-fields-holder" item-name="aplicacao_origem" item-type="select">
                                                                                                    <label for="{rows/content/form_1/fields/aplicacao_origem/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/aplicacao_origem/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 IGRP_change" id="form_1_aplicacao_origem" name="{rows/content/form_1/fields/aplicacao_origem/@name}">
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/aplicacao_origem/list/option">
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
                                                                                            <xsl:if test="rows/content/form_1/fields/processo">
                                                                                                <div class="col-md-8 form-group  gen-fields-holder" item-name="processo" item-type="select">
                                                                                                    <label for="{rows/content/form_1/fields/processo/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/processo/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_1_processo" name="{rows/content/form_1/fields/processo/@name}">
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/processo/list/option">
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
                                                                                            <xsl:if test="rows/content/form_1/fields/incluir">
                                                                                                <div class="col-md-6 form-group  gen-fields-holder" item-name="incluir" item-type="select">
                                                                                                    <label for="{rows/content/form_1/fields/incluir/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/incluir/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_1_incluir" name="{rows/content/form_1/fields/incluir/@name}" multiple="multiple">
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/incluir/list/option">
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
                                                                                    <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/documentos_auxiliares">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-documentos_auxiliares" rel="tab-tabcontent_1-documentos_auxiliares">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/docs_aux">
                                                                                <div class="box gen-container-item " gen-class="" item-name="docs_aux">
                                                                                    <div class="box-body IGRP-separatorlist" tag="docs_aux" dialog="false">
                                                                                        <div class="splist-form-holder">
                                                                                            <div class="splist-form" role="form">
                                                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/docs_aux/fields"/>
                                                                                                <xsl:if test="rows/content/docs_aux/fields/type_aux">
                                                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="type_aux" item-type="select">
                                                                                                        <label for="{rows/content/docs_aux/fields/type_aux/@name}">
                                                                                                            <xsl:value-of select="rows/content/docs_aux/fields/type_aux/label"/>
                                                                                                        </label>
                                                                                                        <select class="form-control select2 " id="docs_aux_type_aux" name="{rows/content/docs_aux/fields/type_aux/@name}">
                                                                                                            <xsl:for-each select="rows/content/docs_aux/fields/type_aux/list/option">
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
                                                                                                <xsl:if test="rows/content/docs_aux/fields/file_aux">
                                                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="file_aux" item-type="file">
                                                                                                        <label for="{rows/content/docs_aux/fields/file_aux/@name}">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/docs_aux/fields/file_aux/label"/>
                                                                                                            </span>
                                                                                                        </label>
                                                                                                        <div class="input-group">
                                                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                                                            <span class="input-group-btn">
                                                                                                                <span class="btn btn-default file-btn-holder">
                                                                                                                    <i class="fa fa-upload"/>
                                                                                                                    <input id="{rows/content/docs_aux/fields/file_aux/@name}" name="{rows/content/docs_aux/fields/file_aux/@name}" value="{rows/content/docs_aux/fields/file_aux/value}" class="transparent" type="file" multiple=""/>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </xsl:if>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="table-box box-body box-table-contents splist-table">
                                                                                            <table rel="T_docs_aux" id="docs_aux" class="table table-striped gen-data-table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <xsl:if test="rows/content/docs_aux/fields/type_aux">
                                                                                                            <xsl:if test="not(type_aux/@visible)">
                                                                                                                <th align="" item-name="type_aux">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/docs_aux/fields/type_aux/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/docs_aux/fields/file_aux">
                                                                                                            <xsl:if test="not(file_aux/@visible)">
                                                                                                                <th align="" item-name="file_aux">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/docs_aux/fields/file_aux/label"/>
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
                                                                                                    <xsl:for-each select="rows/content/docs_aux/table/value/row">
                                                                                                        <tr>
                                                                                                            <input type="hidden" class="sl-row-id" name="p_docs_aux_id" value="{docs_aux_id}"/>
                                                                                                            <xsl:if test="type_aux">
                                                                                                                <xsl:choose>
                                                                                                                    <xsl:when test="not(type_aux/@visible)">
                                                                                                                        <td field="type_aux" data-row="{position()}" data-title="{../../../fields/type_aux/label}" class="select">
                                                                                                                            <span class="separator-list-td-val">
                                                                                                                                <xsl:value-of select="type_aux_desc"/>
                                                                                                                            </span>
                                                                                                                            <input type="hidden" name="p_type_aux_fk" value="{type_aux}"/>
                                                                                                                            <input type="hidden" name="p_type_aux_fk_desc" value="{type_aux_desc}"/>
                                                                                                                        </td>
                                                                                                                    </xsl:when>
                                                                                                                    <xsl:otherwise>
                                                                                                                        <input type="hidden" name="p_type_aux_fk" value="{type_aux}"/>
                                                                                                                        <input type="hidden" name="p_type_aux_fk_desc" value="{type_aux_desc}"/>
                                                                                                                    </xsl:otherwise>
                                                                                                                </xsl:choose>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="file_aux">
                                                                                                                <xsl:choose>
                                                                                                                    <xsl:when test="not(file_aux/@visible)">
                                                                                                                        <td data-row="{position()}" data-title="{../../fields/file_aux/label}" class="file">
                                                                                                                            <xsl:choose>
                                                                                                                                <xsl:when test="file_aux != ''">
                                                                                                                                    <a href="{file_aux}" class="link bClick" target="_blank" name="file_aux">
                                                                                                                                        <xsl:value-of select="file_aux_desc"/>
                                                                                                                                    </a>
                                                                                                                                </xsl:when>
                                                                                                                                <xsl:otherwise>
                                                                                                                                    <xsl:value-of select="file_aux_desc"/>
                                                                                                                                </xsl:otherwise>
                                                                                                                            </xsl:choose>
                                                                                                                            <input type="hidden" name="p_file_aux_fk" value="{file_aux}"/>
                                                                                                                            <input type="hidden" name="p_file_aux_fk_desc" value="{file_aux_desc}"/>
                                                                                                                        </td>
                                                                                                                    </xsl:when>
                                                                                                                    <xsl:otherwise>
                                                                                                                        <input type="hidden" name="p_file_aux_fk" value="{file_aux}"/>
                                                                                                                        <input type="hidden" name="p_file_aux_fk_desc" value="{file_aux_desc}"/>
                                                                                                                    </xsl:otherwise>
                                                                                                                </xsl:choose>
                                                                                                            </xsl:if>
                                                                                                            <td data-row="{position()}" class="table-btn">
                                                                                                                <xsl:if test="not(@noupdate)">
                                                                                                                    <span class="table-row-edit btn btn-default " rel="docs_aux">
                                                                                                                        <i class="fa fa-pencil"/>
                                                                                                                    </span>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="not(@nodelete)">
                                                                                                                    <span class="table-row-remove btn btn-danger" rel="docs_aux">
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
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491225026569"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491225026569"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491225026569"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491225026569"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491225026570"/>
</xsl:stylesheet>