<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
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
                                    <div class="row" id="row-ce1da955">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/organica">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="organica" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}" required="required">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/organica"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/organica/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/objeto">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="objeto" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/objeto/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/objeto/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/objeto/value}" class="form-control " id="{rows/content/form_1/fields/objeto/@name}" name="{rows/content/form_1/fields/objeto/@name}" required="required" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/objeto"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/default_page">
                                                                    <div class="col-sm-3  gen-fields-holder" item-name="default_page" item-type="radiolist" required="required">
                                                                        <div class="form-group radiolist clear" required="required">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/default_page/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/default_page/list/option">
                                                                                <div class="radio col-md-12">
                                                                                    <label>
                                                                                        <input required="required" type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                            <xsl:call-template name="setAttributes">
                                                                                                <xsl:with-param name="field" select="//rows/content/form_1/fields/default_page"/>
                                                                                            </xsl:call-template>
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
                                                                <xsl:if test="rows/content/form_1/fields/preencher_automatico">
                                                                    <div class="col-sm-3  gen-fields-holder" item-name="preencher_automatico" item-type="radiolist" required="required">
                                                                        <div class="form-group radiolist clear" required="required">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/preencher_automatico/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/preencher_automatico/list/option">
                                                                                <div class="radio col-md-12">
                                                                                    <label>
                                                                                        <input required="required" type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                            <xsl:call-template name="setAttributes">
                                                                                                <xsl:with-param name="field" select="//rows/content/form_1/fields/preencher_automatico"/>
                                                                                            </xsl:call-template>
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
                                                                <xsl:if test="rows/content/form_1/fields/pagina">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="pagina" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/pagina/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pagina/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/pagina/value}" class="form-control " id="{rows/content/form_1/fields/pagina/@name}" name="{rows/content/form_1/fields/pagina/@name}" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/pagina"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/formato_output">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="formato_output" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/formato_output/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/formato_output/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_formato_output" name="{rows/content/form_1/fields/formato_output/@name}" required="required">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/formato_output"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/formato_output/list/option">
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
                                                <xsl:if test="rows/content/separatorlist_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/campo">
                                                                        <div class="form-group col-sm-3   gen-fields-holder" item-name="campo" item-type="text">
                                                                            <label for="{rows/content/separatorlist_1/fields/campo/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/campo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/separatorlist_1/fields/campo/value}" class="form-control " id="{rows/content/separatorlist_1/fields/campo/@name}" name="{rows/content/separatorlist_1/fields/campo/@name}" maxlength="50" placeholder="">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/campo"/>
                                                                                </xsl:call-template>
                                                                            </input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/campo">
                                                                                <xsl:if test="not(rows/content/separatorlist_1/fields/campo/@visible)">
                                                                                    <th align="" item-name="campo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/campo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                <input name="p_estado_fk" value="{estado}" type="hidden"/>
                                                                                <input name="p_estado_fk_desc" value="{estado_desc}" type="hidden"/>
                                                                                <xsl:if test="campo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(campo/@visible)">
                                                                                            <td field="campo" data-row="{position()}" data-title="{../../../fields/campo/label}" class="text" item-name="campo">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="campo_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                                                                                <input type="hidden" name="p_campo_fk_desc" value="{campo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                                                                            <input type="hidden" name="p_campo_fk_desc" value="{campo_desc}"/>
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
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1504608526534"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1504608526534"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1504608526534"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1504608526534"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1504608526534"/>
</xsl:stylesheet>
