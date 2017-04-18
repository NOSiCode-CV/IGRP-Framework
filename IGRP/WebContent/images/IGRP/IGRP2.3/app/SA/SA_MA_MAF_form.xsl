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
                                                <xsl:if test="rows/content/tool_operacoes">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="tool_operacoes">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/tool_operacoes" mode="gen-buttons">
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control" id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" required="required" maxlength="300"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/descricao">
                                                                    <div class="form-group col-md-5   gen-fields-holder" item-name="descricao" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/descricao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/descricao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/descricao/value}" class="form-control" id="{rows/content/form_1/fields/descricao/@name}" name="{rows/content/form_1/fields/descricao/@name}" maxlength="300"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/sep_modelo">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_modelo">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_modelo/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_modelo" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_modelo/fields"/>
                                                                    <xsl:if test="rows/content/sep_modelo/fields/nome_modelo">
                                                                        <div class="form-group col-md-4   gen-fields-holder" item-name="nome_modelo" item-type="text" required="required">
                                                                            <label for="{rows/content/sep_modelo/fields/nome_modelo/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_modelo/fields/nome_modelo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_modelo/fields/nome_modelo/value}" class="form-control" id="{rows/content/sep_modelo/fields/nome_modelo/@name}" name="{rows/content/sep_modelo/fields/nome_modelo/@name}" required="required" maxlength="100"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_modelo/fields/descricao_modelo">
                                                                        <div class="form-group col-md-5   gen-fields-holder" item-name="descricao_modelo" item-type="text">
                                                                            <label for="{rows/content/sep_modelo/fields/descricao_modelo/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_modelo/fields/descricao_modelo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_modelo/fields/descricao_modelo/value}" class="form-control" id="{rows/content/sep_modelo/fields/descricao_modelo/@name}" name="{rows/content/sep_modelo/fields/descricao_modelo/@name}" maxlength="200"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_modelo" id="sep_modelo" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_modelo/fields/nome_modelo">
                                                                                <xsl:if test="not(nome_modelo/@visible)">
                                                                                    <th align="" item-name="nome_modelo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_modelo/fields/nome_modelo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_modelo/fields/descricao_modelo">
                                                                                <xsl:if test="not(descricao_modelo/@visible)">
                                                                                    <th align="" item-name="descricao_modelo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_modelo/fields/descricao_modelo/label"/>
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
                                                                        <xsl:for-each select="rows/content/sep_modelo/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_modelo_id" value="{sep_modelo_id}"/>
                                                                                <xsl:if test="nome_modelo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(nome_modelo/@visible)">
                                                                                            <td field="nome_modelo" data-row="{position()}" data-title="{../../../fields/nome_modelo/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nome_modelo_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nome_modelo_fk" value="{nome_modelo}"/>
                                                                                                <input type="hidden" name="p_nome_modelo_fk_desc" value="{nome_modelo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nome_modelo_fk" value="{nome_modelo}"/>
                                                                                            <input type="hidden" name="p_nome_modelo_fk_desc" value="{nome_modelo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="descricao_modelo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(descricao_modelo/@visible)">
                                                                                            <td field="descricao_modelo" data-row="{position()}" data-title="{../../../fields/descricao_modelo/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="descricao_modelo_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_descricao_modelo_fk" value="{descricao_modelo}"/>
                                                                                                <input type="hidden" name="p_descricao_modelo_fk_desc" value="{descricao_modelo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_descricao_modelo_fk" value="{descricao_modelo}"/>
                                                                                            <input type="hidden" name="p_descricao_modelo_fk_desc" value="{descricao_modelo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_modelo">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_modelo">
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487246970424"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487246970424"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487246970424"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487246970424"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487246970424"/>
</xsl:stylesheet>