<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TOOLSBAR CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css" rel="stylesheet" />
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
                <!-- SELECT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/select2/select2.min.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/plugins/select2/select2.style.css" rel="stylesheet" />
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
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_form_toolsbar">
                                                    <div class="toolsbar-holder default gen-container-item " gen-fields=".btns-holder a.btn" item-name="gen_form_toolsbar" gen-structure="toolsbar">
                                                        <div role="group" class="btns-holder  pull-right">
                                                            <xsl:apply-templates select="rows/content/gen_form_toolsbar" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'" />
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="gen_form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/gen_form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/gen_form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="nome">
                                                                        <label for="{rows/content/gen_form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/nome/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/gen_form_1/fields/nome/@name}" value="{rows/content/gen_form_1/fields/nome/value}" id="{rows/content/gen_form_1/fields/nome/@name}" maxlength="250" required="required"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/gen_form_1/fields/data_nascimento">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="date" item-name="data_nascimento">
                                                                        <label for="{rows/content/gen_form_1/fields/data_nascimento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/data_nascimento/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-date" name="{rows/content/gen_form_1/fields/data_nascimento/@name}" value="{rows/content/gen_form_1/fields/data_nascimento/value}" id="gen_form_1-data_nascimento" maxlength="30" required="required" format="IGRP_datePicker" />
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar" />
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/gen_form_1/fields/idade">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="number" item-name="idade">
                                                                        <label for="{rows/content/gen_form_1/fields/idade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/idade/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" class="form-control" readonly="readonly" name="{rows/content/gen_form_1/fields/idade/@name}" value="{rows/content/gen_form_1/fields/idade/value}" id="{rows/content/gen_form_1/fields/idade/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/gen_form_1/fields/nome_pai">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="lookup" item-name="nome_pai">
                                                                        <label for="{rows/content/gen_form_1/fields/nome_pai/@name}">
                                                                            <xsl:value-of select="rows/content/gen_form_1/fields/nome_pai/label" />
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-lookup" name="{rows/content/gen_form_1/fields/nome_pai/@name}" value="{rows/content/gen_form_1/fields/nome_pai/value}" id="gen_form_1_nome_pai" />
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page" />
                                                                                <xsl:with-param name="ad_hoc" select="'1'" />
                                                                                <xsl:with-param name="action" select="'LOOKUP'" />
                                                                                <xsl:with-param name="name" select="rows/content/gen_form_1/fields/nome_pai/@name" />
                                                                                <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/nome_pai/lookup" />
                                                                                <xsl:with-param name="input-id" select="'gen_form_1_nome_pai'" />
                                                                                <xsl:with-param name="btnClass" select="'default'" />
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/gen_form_1/fields/nome_mae">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="lookup" item-name="nome_mae">
                                                                        <label for="{rows/content/gen_form_1/fields/nome_mae/@name}">
                                                                            <xsl:value-of select="rows/content/gen_form_1/fields/nome_mae/label" />
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-lookup" name="{rows/content/gen_form_1/fields/nome_mae/@name}" value="{rows/content/gen_form_1/fields/nome_mae/value}" id="gen_form_1_nome_mae" />
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page" />
                                                                                <xsl:with-param name="ad_hoc" select="'1'" />
                                                                                <xsl:with-param name="action" select="'LOOKUP'" />
                                                                                <xsl:with-param name="name" select="rows/content/gen_form_1/fields/nome_mae/@name" />
                                                                                <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/nome_mae/lookup" />
                                                                                <xsl:with-param name="input-id" select="'gen_form_1_nome_mae'" />
                                                                                <xsl:with-param name="btnClass" select="'default'" />
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/gen_form_1/fields/genero">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="genero">
                                                                        <label for="{rows/content/gen_form_1/fields/genero/@name}">
                                                                            <xsl:value-of select="rows/content/gen_form_1/fields/genero/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/gen_form_1/fields/genero/@name}" id="gen_form_1_genero">
                                                                            <xsl:for-each select="rows/content/gen_form_1/fields/genero/list/option">
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
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/gen_form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/filhos">
                                                    <div class="box gen-container-item " item-name="filhos">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/filhos/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" dialog="false" tag="filhos">
                                                            <div class="splist-form-holder">
                                                                <div role="form" class="splist-form">
                                                                    <xsl:apply-templates select="rows/content/filhos/fields" mode="form-hidden-fields" />
                                                                    <xsl:if test="rows/content/filhos/fields/nome_filho">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="nome_filho">
                                                                            <label for="{rows/content/filhos/fields/nome_filho/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/filhos/fields/nome_filho/label" />
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" class="form-control" name="{rows/content/filhos/fields/nome_filho/@name}" value="{rows/content/filhos/fields/nome_filho/value}" id="{rows/content/filhos/fields/nome_filho/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/filhos/fields/data_nascimento_filho">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-type="date" item-name="data_nascimento_filho">
                                                                            <label for="{rows/content/filhos/fields/data_nascimento_filho/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/filhos/fields/data_nascimento_filho/label" />
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control gen-date" name="{rows/content/filhos/fields/data_nascimento_filho/@name}" value="{rows/content/filhos/fields/data_nascimento_filho/value}" id="filhos-data_nascimento_filho" maxlength="30" format="IGRP_datePicker" />
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar" />
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/filhos/fields/mae_filho">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-type="lookup" item-name="mae_filho">
                                                                            <label for="{rows/content/filhos/fields/mae_filho/@name}">
                                                                                <xsl:value-of select="rows/content/filhos/fields/mae_filho/label" />
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control gen-lookup" name="{rows/content/filhos/fields/mae_filho/@name}" value="{rows/content/filhos/fields/mae_filho/value}" id="filhos_mae_filho" />
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page" />
                                                                                    <xsl:with-param name="ad_hoc" select="'1'" />
                                                                                    <xsl:with-param name="action" select="'LOOKUP'" />
                                                                                    <xsl:with-param name="name" select="rows/content/filhos/fields/mae_filho/@name" />
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/filhos/fields/mae_filho/lookup" />
                                                                                    <xsl:with-param name="input-id" select="'filhos_mae_filho'" />
                                                                                    <xsl:with-param name="btnClass" select="'default'" />
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/filhos/fields/pai_filho">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-type="lookup" item-name="pai_filho">
                                                                            <label for="{rows/content/filhos/fields/pai_filho/@name}">
                                                                                <xsl:value-of select="rows/content/filhos/fields/pai_filho/label" />
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control gen-lookup" name="{rows/content/filhos/fields/pai_filho/@name}" value="{rows/content/filhos/fields/pai_filho/value}" id="filhos_pai_filho" />
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page" />
                                                                                    <xsl:with-param name="ad_hoc" select="'1'" />
                                                                                    <xsl:with-param name="action" select="'LOOKUP'" />
                                                                                    <xsl:with-param name="name" select="rows/content/filhos/fields/pai_filho/@name" />
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/filhos/fields/pai_filho/lookup" />
                                                                                    <xsl:with-param name="input-id" select="'filhos_pai_filho'" />
                                                                                    <xsl:with-param name="btnClass" select="'default'" />
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/filhos/fields/genero_filho">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="genero_filho">
                                                                            <label for="{rows/content/filhos/fields/genero_filho/@name}">
                                                                                <xsl:value-of select="rows/content/filhos/fields/genero_filho/label" />
                                                                            </label>
                                                                            <select class="form-control select2 " name="{rows/content/filhos/fields/genero_filho/@name}" id="filhos_genero_filho">
                                                                                <xsl:for-each select="rows/content/filhos/fields/genero_filho/list/option">
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
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table class="table table-striped gen-data-table" rel="T_filhos" id="filhos">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/filhos/fields/nome_filho">
                                                                                <xsl:if test="//rows/content/filhos/fields/nome_filho/@table='true'">
                                                                                    <th item-name="nome_filho" align="">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/filhos/fields/nome_filho/label" />
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/filhos/fields/data_nascimento_filho">
                                                                                <xsl:if test="//rows/content/filhos/fields/data_nascimento_filho/@table='true'">
                                                                                    <th item-name="data_nascimento_filho" align="">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/filhos/fields/data_nascimento_filho/label" />
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/filhos/fields/mae_filho">
                                                                                <xsl:if test="//rows/content/filhos/fields/mae_filho/@table='true'">
                                                                                    <th item-name="mae_filho" align="">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/filhos/fields/mae_filho/label" />
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/filhos/fields/pai_filho">
                                                                                <xsl:if test="//rows/content/filhos/fields/pai_filho/@table='true'">
                                                                                    <th item-name="pai_filho" align="">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/filhos/fields/pai_filho/label" />
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/filhos/fields/genero_filho">
                                                                                <xsl:if test="//rows/content/filhos/fields/genero_filho/@table='true'">
                                                                                    <th item-name="genero_filho" align="">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/filhos/fields/genero_filho/label" />
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn btn-link">
                                                                                    <i class="fa fa-plus" />
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/filhos/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_filhos_id" value="{filhos_id}" />
                                                                                <input type="hidden" name="p_mae_filho_id_fk" value="{mae_filho_id}" />
                                                                                <input type="hidden" name="p_mae_filho_id_fk_desc" value="{mae_filho_id_desc}" />
                                                                                <input type="hidden" name="p_pai_filho_id_fk" value="{pai_filho_id}" />
                                                                                <input type="hidden" name="p_pai_filho_id_fk_desc" value="{pai_filho_id_desc}" />
                                                                                <input type="hidden" name="p_hidden_pp_fk" value="{hidden_pp}" />
                                                                                <input type="hidden" name="p_hidden_pp_fk_desc" value="{hidden_pp_desc}" />
                                                                                <xsl:if test="nome_filho">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/filhos/fields/nome_filho/@table='true'">
                                                                                            <td class="text" data-row="{position()}" data-title="{../../../fields/nome_filho/label}" field="nome_filho">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nome_filho_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nome_filho_fk" value="{nome_filho}" />
                                                                                                <input type="hidden" name="p_nome_filho_fk_desc" value="{nome_filho_desc}" />
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nome_filho_fk" value="{nome_filho}" />
                                                                                            <input type="hidden" name="p_nome_filho_fk_desc" value="{nome_filho_desc}" />
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="data_nascimento_filho">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/filhos/fields/data_nascimento_filho/@table='true'">
                                                                                            <td class="date" data-row="{position()}" data-title="{../../../fields/data_nascimento_filho/label}" field="data_nascimento_filho">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="data_nascimento_filho_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                                <input type="hidden" name="p_data_nascimento_filho_fk" value="{data_nascimento_filho}" />
                                                                                                <input type="hidden" name="p_data_nascimento_filho_fk_desc" value="{data_nascimento_filho_desc}" />
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_data_nascimento_filho_fk" value="{data_nascimento_filho}" />
                                                                                            <input type="hidden" name="p_data_nascimento_filho_fk_desc" value="{data_nascimento_filho_desc}" />
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="mae_filho">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/filhos/fields/mae_filho/@table='true'">
                                                                                            <td class="lookup" data-row="{position()}" data-title="{../../../fields/mae_filho/label}" field="mae_filho">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="mae_filho_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                                <input type="hidden" name="p_mae_filho_fk" value="{mae_filho}" />
                                                                                                <input type="hidden" name="p_mae_filho_fk_desc" value="{mae_filho_desc}" />
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_mae_filho_fk" value="{mae_filho}" />
                                                                                            <input type="hidden" name="p_mae_filho_fk_desc" value="{mae_filho_desc}" />
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pai_filho">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/filhos/fields/pai_filho/@table='true'">
                                                                                            <td class="lookup" data-row="{position()}" data-title="{../../../fields/pai_filho/label}" field="pai_filho">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pai_filho_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pai_filho_fk" value="{pai_filho}" />
                                                                                                <input type="hidden" name="p_pai_filho_fk_desc" value="{pai_filho_desc}" />
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pai_filho_fk" value="{pai_filho}" />
                                                                                            <input type="hidden" name="p_pai_filho_fk_desc" value="{pai_filho_desc}" />
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="genero_filho">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/filhos/fields/genero_filho/@table='true'">
                                                                                            <td class="select" data-row="{position()}" data-title="{../../../fields/genero_filho/label}" field="genero_filho">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="genero_filho_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                                <input type="hidden" name="p_genero_filho_fk" value="{genero_filho}" />
                                                                                                <input type="hidden" name="p_genero_filho_fk_desc" value="{genero_filho_desc}" />
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_genero_filho_fk" value="{genero_filho}" />
                                                                                            <input type="hidden" name="p_genero_filho_fk_desc" value="{genero_filho_desc}" />
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td class="table-btn" data-row="{position()}">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="filhos">
                                                                                            <i class="fa fa-pencil" />
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="filhos">
                                                                                            <i class="fa fa-times" />
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js" />
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js" />
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1481800913878" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1481800913878" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1481800913878" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1481800913878" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1481800913878" />
</xsl:stylesheet>