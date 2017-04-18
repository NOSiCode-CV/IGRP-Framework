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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_de_seguranca_social">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="tipo_de_seguranca_social" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/tipo_de_seguranca_social/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/tipo_de_seguranca_social/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/tipo_de_seguranca_social/value}" class="form-control " id="{rows/content/form_1/fields/tipo_de_seguranca_social/@name}" name="{rows/content/form_1/fields/tipo_de_seguranca_social/@name}" readonly="readonly" maxlength="50" placeholder=""></input>
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/tipo_de_abono">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_de_abono" item-type="select">
                                                                            <label for="{rows/content/separatorlist_1/fields/tipo_de_abono/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_de_abono/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_tipo_de_abono" name="{rows/content/separatorlist_1/fields/tipo_de_abono/@name}">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/tipo_de_abono/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/inicio_de_beneficio">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="inicio_de_beneficio" item-type="date">
                                                                            <label for="{rows/content/separatorlist_1/fields/inicio_de_beneficio/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/inicio_de_beneficio/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/inicio_de_beneficio/value}" class="form-control gen-date " id="separatorlist_1-inicio_de_beneficio" name="{rows/content/separatorlist_1/fields/inicio_de_beneficio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/fim_de_beneficio">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="fim_de_beneficio" item-type="date">
                                                                            <label for="{rows/content/separatorlist_1/fields/fim_de_beneficio/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/fim_de_beneficio/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/fim_de_beneficio/value}" class="form-control gen-date " id="separatorlist_1-fim_de_beneficio" name="{rows/content/separatorlist_1/fields/fim_de_beneficio/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/tipo_de_abono">
                                                                                <xsl:if test="not(tipo_de_abono/@visible)">
                                                                                    <th align="" item-name="tipo_de_abono">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_de_abono/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/inicio_de_beneficio">
                                                                                <xsl:if test="not(inicio_de_beneficio/@visible)">
                                                                                    <th align="" item-name="inicio_de_beneficio">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/inicio_de_beneficio/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/fim_de_beneficio">
                                                                                <xsl:if test="not(fim_de_beneficio/@visible)">
                                                                                    <th align="" item-name="fim_de_beneficio">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/fim_de_beneficio/label"/>
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
                                                                                <xsl:if test="tipo_de_abono">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(tipo_de_abono/@visible)">
                                                                                            <td field="tipo_de_abono" data-row="{position()}" data-title="{../../../fields/tipo_de_abono/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tipo_de_abono_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tipo_de_abono_fk" value="{tipo_de_abono}"/>
                                                                                                <input type="hidden" name="p_tipo_de_abono_fk_desc" value="{tipo_de_abono_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tipo_de_abono_fk" value="{tipo_de_abono}"/>
                                                                                            <input type="hidden" name="p_tipo_de_abono_fk_desc" value="{tipo_de_abono_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="inicio_de_beneficio">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(inicio_de_beneficio/@visible)">
                                                                                            <td field="inicio_de_beneficio" data-row="{position()}" data-title="{../../../fields/inicio_de_beneficio/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="inicio_de_beneficio_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_inicio_de_beneficio_fk" value="{inicio_de_beneficio}"/>
                                                                                                <input type="hidden" name="p_inicio_de_beneficio_fk_desc" value="{inicio_de_beneficio_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_inicio_de_beneficio_fk" value="{inicio_de_beneficio}"/>
                                                                                            <input type="hidden" name="p_inicio_de_beneficio_fk_desc" value="{inicio_de_beneficio_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="fim_de_beneficio">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(fim_de_beneficio/@visible)">
                                                                                            <td field="fim_de_beneficio" data-row="{position()}" data-title="{../../../fields/fim_de_beneficio/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="fim_de_beneficio_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_fim_de_beneficio_fk" value="{fim_de_beneficio}"/>
                                                                                                <input type="hidden" name="p_fim_de_beneficio_fk_desc" value="{fim_de_beneficio_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_fim_de_beneficio_fk" value="{fim_de_beneficio}"/>
                                                                                            <input type="hidden" name="p_fim_de_beneficio_fk_desc" value="{fim_de_beneficio_desc}"/>
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
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492433793429"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492433793429"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492433793429"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492433793429"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492433793429"/>
</xsl:stylesheet>