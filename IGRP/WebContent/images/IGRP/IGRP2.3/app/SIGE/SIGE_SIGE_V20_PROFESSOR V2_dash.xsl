<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- TABLE CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title" gen-class="">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/dados_pessoais">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/dados_pessoais/label" />
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="nome">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/nome/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/nome/@name}" value="{rows/content/form_1/fields/nome/value}" maxlength="200" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/dt_nascimento">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="dt_nascimento">
                                                                        <label for="{rows/content/form_1/fields/dt_nascimento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/dt_nascimento/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/dt_nascimento/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/dt_nascimento/@name}" value="{rows/content/form_1/fields/dt_nascimento/value}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/naturalidade">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="naturalidade">
                                                                        <label for="{rows/content/form_1/fields/naturalidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/naturalidade/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/naturalidade/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/naturalidade/@name}" value="{rows/content/form_1/fields/naturalidade/value}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nacionalidade">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="nacionalidade">
                                                                        <label for="{rows/content/form_1/fields/nacionalidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nacionalidade/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/nacionalidade/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/nacionalidade/@name}" value="{rows/content/form_1/fields/nacionalidade/value}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/morada">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="morada">
                                                                        <label for="{rows/content/form_1/fields/morada/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/morada/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/morada/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/morada/@name}" value="{rows/content/form_1/fields/morada/value}" maxlength="200" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/concelho">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="concelho">
                                                                        <label for="{rows/content/form_1/fields/concelho/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/concelho/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/concelho/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/concelho/@name}" value="{rows/content/form_1/fields/concelho/value}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/email">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="email" item-name="email">
                                                                        <label for="{rows/content/form_1/fields/email/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/email/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="form-control " id="{rows/content/form_1/fields/email/@name}" type="email" readonly="readonly" name="{rows/content/form_1/fields/email/@name}" value="{rows/content/form_1/fields/email/value}" maxlength="200" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/anoletivo_sep">
                                                    <div class="box box-table-contents gen-container-item " item-name="anoletivo_sep" gen-class="">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/anoletivo_sep/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/anoletivo_sep/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="anoletivo_sep" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/anoletivo_sep/fields/ano_curricular">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/anoletivo_sep/fields/ano_curricular/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/anoletivo_sep/fields/turma">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/anoletivo_sep/fields/turma/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/anoletivo_sep/fields/disciplina">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/anoletivo_sep/fields/disciplina/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/anoletivo_sep/fields/nr_alunos">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/anoletivo_sep/fields/nr_alunos/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/anoletivo_sep/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                            <xsl:if test="ano_curricular">
                                                                                <td class="text" align="left" data-title="{../../fields/ano_curricular/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="ano_curricular" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="turma">
                                                                                <td class="text" align="left" data-title="{../../fields/turma/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="turma" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="disciplina">
                                                                                <td class="text" align="left" data-title="{../../fields/disciplina/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="disciplina" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nr_alunos">
                                                                                <td class="text" align="left" data-title="{../../fields/nr_alunos/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nr_alunos" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table" gen-class="">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/gen_table/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="gen_table" exports="">
                                                                <thead>
                                                                    <tr></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490198498509" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490198498509" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490198498509" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490198498509" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490198498509" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1490198498509" />
</xsl:stylesheet>