<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
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
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/sectionheader_1">
                                                                            <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                                                <h2>
                                                                                    <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                                                </h2>
                                                                            </section>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
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
                                                                                        <xsl:if test="rows/content/form_1/fields/nome">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="nome" item-type="text">
                                                                                                <label for="{rows/content/form_1/fields/nome/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_2">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                                        <xsl:if test="rows/content/form_2/fields/vinculo">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="vinculo" item-type="text">
                                                                                                <label for="{rows/content/form_2/fields/vinculo/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_2/fields/vinculo/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_2/fields/vinculo/value}" class="form-control " id="{rows/content/form_2/fields/vinculo/@name}" name="{rows/content/form_2/fields/vinculo/@name}" readonly="readonly" maxlength="50" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/anexo">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="anexo" item-type="select">
                                                                            <label for="{rows/content/separatorlist_1/fields/anexo/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/anexo/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_anexo" name="{rows/content/separatorlist_1/fields/anexo/@name}">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/anexo/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/ficheiro">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="ficheiro" item-type="file">
                                                                            <label for="{rows/content/separatorlist_1/fields/ficheiro/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/ficheiro/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control not-form" readonly=""/>
                                                                                <span class="input-group-btn">
                                                                                    <span class="btn btn-default file-btn-holder">
                                                                                        <i class="fa fa-upload"/>
                                                                                        <input id="{rows/content/separatorlist_1/fields/ficheiro/@name}" name="{rows/content/separatorlist_1/fields/ficheiro/@name}" value="{rows/content/separatorlist_1/fields/ficheiro/value}" class="transparent" type="file" accept="file_extension"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/data_de_insercao">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="data_de_insercao" item-type="date">
                                                                            <label for="{rows/content/separatorlist_1/fields/data_de_insercao/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/data_de_insercao/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/data_de_insercao/value}" class="form-control gen-date " id="separatorlist_1-data_de_insercao" name="{rows/content/separatorlist_1/fields/data_de_insercao/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/anexo">
                                                                                <xsl:if test="not(anexo/@visible)">
                                                                                    <th align="" item-name="anexo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/anexo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/ficheiro">
                                                                                <xsl:if test="not(ficheiro/@visible)">
                                                                                    <th align="" item-name="ficheiro">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/ficheiro/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/data_de_insercao">
                                                                                <xsl:if test="not(data_de_insercao/@visible)">
                                                                                    <th align="" item-name="data_de_insercao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/data_de_insercao/label"/>
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
                                                                                <xsl:if test="anexo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(anexo/@visible)">
                                                                                            <td field="anexo" data-row="{position()}" data-title="{../../../fields/anexo/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="anexo_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                                                                                <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                                                                            <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="ficheiro">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(ficheiro/@visible)">
                                                                                            <td data-row="{position()}" data-title="{../../fields/ficheiro/label}" class="file">
                                                                                                <xsl:choose>
                                                                                                    <xsl:when test="ficheiro != ''">
                                                                                                        <a href="{ficheiro}" class="link bClick" target="_blank" name="ficheiro">
                                                                                                            <xsl:value-of select="ficheiro_desc"/>
                                                                                                        </a>
                                                                                                    </xsl:when>
                                                                                                    <xsl:otherwise>
                                                                                                        <xsl:value-of select="ficheiro_desc"/>
                                                                                                    </xsl:otherwise>
                                                                                                </xsl:choose>
                                                                                                <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                                                                                <input type="hidden" name="p_ficheiro_fk_desc" value="{ficheiro_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                                                                            <input type="hidden" name="p_ficheiro_fk_desc" value="{ficheiro_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="data_de_insercao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(data_de_insercao/@visible)">
                                                                                            <td field="data_de_insercao" data-row="{position()}" data-title="{../../../fields/data_de_insercao/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="data_de_insercao_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_data_de_insercao_fk" value="{data_de_insercao}"/>
                                                                                                <input type="hidden" name="p_data_de_insercao_fk_desc" value="{data_de_insercao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_data_de_insercao_fk" value="{data_de_insercao}"/>
                                                                                            <input type="hidden" name="p_data_de_insercao_fk_desc" value="{data_de_insercao_desc}"/>
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
                <!-- FORM JS INCLUDES -->
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492435807046"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492435807046"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492435807046"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492435807046"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492435807046"/>
</xsl:stylesheet>