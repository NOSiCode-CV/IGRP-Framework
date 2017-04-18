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
                                                <xsl:if test="rows/content/tool_operacao">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="tool_operacao">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/tool_operacao" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_req">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_req">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_req/fields"/>
                                                                <xsl:if test="rows/content/form_req/fields/nome">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/form_req/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_req/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_req/fields/nome/value}" class="form-control" id="{rows/content/form_req/fields/nome/@name}" name="{rows/content/form_req/fields/nome/@name}" required="required" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_req/fields/estado">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select" required="required">
                                                                        <label for="{rows/content/form_req/fields/estado/@name}">
                                                                            <xsl:value-of select="rows/content/form_req/fields/estado/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_req_estado" name="{rows/content/form_req/fields/estado/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_req/fields/estado/list/option">
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
                                                                <xsl:if test="rows/content/form_req/fields/ordem_requisito">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="ordem_requisito" item-type="number">
                                                                        <label for="{rows/content/form_req/fields/ordem_requisito/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_req/fields/ordem_requisito/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_req/fields/ordem_requisito/value}" class="form-control" id="{rows/content/form_req/fields/ordem_requisito/@name}" name="{rows/content/form_req/fields/ordem_requisito/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_req/fields/descricao">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="descricao" item-type="textarea">
                                                                        <label for="{rows/content/form_req/fields/descricao/@name}">
                                                                            <xsl:value-of select="rows/content/form_req/fields/descricao/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_req/fields/descricao/@name}" class="textarea form-control" maxlength="500">
                                                                            <xsl:value-of select="rows/content/form_req/fields/descricao/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_req/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/sep_associar_organica">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_associar_organica">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_associar_organica/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_associar_organica" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_associar_organica/fields"/>
                                                                    <xsl:if test="rows/content/sep_associar_organica/fields/organica_req">
                                                                        <div class="col-md-4 form-group  gen-fields-holder" item-name="organica_req" item-type="select" required="required">
                                                                            <label for="{rows/content/sep_associar_organica/fields/organica_req/@name}">
                                                                                <xsl:value-of select="rows/content/sep_associar_organica/fields/organica_req/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_associar_organica_organica_req" name="{rows/content/sep_associar_organica/fields/organica_req/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_associar_organica/fields/organica_req/list/option">
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
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_associar_organica" id="sep_associar_organica" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_associar_organica/fields/organica_req">
                                                                                <xsl:if test="not(organica_req/@visible)">
                                                                                    <th align="" item-name="organica_req">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_associar_organica/fields/organica_req/label"/>
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
                                                                        <xsl:for-each select="rows/content/sep_associar_organica/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_associar_organica_id" value="{sep_associar_organica_id}"/>
                                                                                <xsl:if test="organica_req">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(organica_req/@visible)">
                                                                                            <td field="organica_req" data-row="{position()}" data-title="{../../../fields/organica_req/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="organica_req_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_organica_req_fk" value="{organica_req}"/>
                                                                                                <input type="hidden" name="p_organica_req_fk_desc" value="{organica_req_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_organica_req_fk" value="{organica_req}"/>
                                                                                            <input type="hidden" name="p_organica_req_fk_desc" value="{organica_req_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_associar_organica">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_associar_organica">
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
                                                <xsl:if test="rows/content/sep_motivograu">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_motivograu">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_motivograu/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_motivograu" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_motivograu/fields"/>
                                                                    <xsl:if test="rows/content/sep_motivograu/fields/grau">
                                                                        <div class="col-md-4 form-group  gen-fields-holder" item-name="grau" item-type="select" required="required">
                                                                            <label for="{rows/content/sep_motivograu/fields/grau/@name}">
                                                                                <xsl:value-of select="rows/content/sep_motivograu/fields/grau/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_motivograu_grau" name="{rows/content/sep_motivograu/fields/grau/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_motivograu/fields/grau/list/option">
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
                                                                    <xsl:if test="rows/content/sep_motivograu/fields/pontuacao">
                                                                        <div class="form-group col-md-4   gen-fields-holder" item-name="pontuacao" item-type="number">
                                                                            <label for="{rows/content/sep_motivograu/fields/pontuacao/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_motivograu/fields/pontuacao/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_motivograu/fields/pontuacao/value}" class="form-control" id="{rows/content/sep_motivograu/fields/pontuacao/@name}" name="{rows/content/sep_motivograu/fields/pontuacao/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_motivograu/fields/orden">
                                                                        <div class="form-group col-md-4   gen-fields-holder" item-name="orden" item-type="number">
                                                                            <label for="{rows/content/sep_motivograu/fields/orden/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_motivograu/fields/orden/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_motivograu/fields/orden/value}" class="form-control" id="{rows/content/sep_motivograu/fields/orden/@name}" name="{rows/content/sep_motivograu/fields/orden/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_motivograu" id="sep_motivograu" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_motivograu/fields/grau">
                                                                                <xsl:if test="not(grau/@visible)">
                                                                                    <th align="" item-name="grau">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_motivograu/fields/grau/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_motivograu/fields/pontuacao">
                                                                                <xsl:if test="not(pontuacao/@visible)">
                                                                                    <th align="" item-name="pontuacao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_motivograu/fields/pontuacao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_motivograu/fields/orden">
                                                                                <xsl:if test="not(orden/@visible)">
                                                                                    <th align="" item-name="orden">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_motivograu/fields/orden/label"/>
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
                                                                        <xsl:for-each select="rows/content/sep_motivograu/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_motivograu_id" value="{sep_motivograu_id}"/>
                                                                                <xsl:if test="grau">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(grau/@visible)">
                                                                                            <td field="grau" data-row="{position()}" data-title="{../../../fields/grau/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="grau_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_grau_fk" value="{grau}"/>
                                                                                                <input type="hidden" name="p_grau_fk_desc" value="{grau_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_grau_fk" value="{grau}"/>
                                                                                            <input type="hidden" name="p_grau_fk_desc" value="{grau_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pontuacao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(pontuacao/@visible)">
                                                                                            <td field="pontuacao" data-row="{position()}" data-title="{../../../fields/pontuacao/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pontuacao_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pontuacao_fk" value="{pontuacao}"/>
                                                                                                <input type="hidden" name="p_pontuacao_fk_desc" value="{pontuacao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pontuacao_fk" value="{pontuacao}"/>
                                                                                            <input type="hidden" name="p_pontuacao_fk_desc" value="{pontuacao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="orden">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(orden/@visible)">
                                                                                            <td field="orden" data-row="{position()}" data-title="{../../../fields/orden/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="orden_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_orden_fk" value="{orden}"/>
                                                                                                <input type="hidden" name="p_orden_fk_desc" value="{orden_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_orden_fk" value="{orden}"/>
                                                                                            <input type="hidden" name="p_orden_fk_desc" value="{orden_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_motivograu">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_motivograu">
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487247238020"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487247238020"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487247238020"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487247238020"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487247238020"/>
</xsl:stylesheet>