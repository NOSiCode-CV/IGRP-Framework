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
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
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
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
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
                                                                <xsl:if test="rows/content/form_1/fields/id_organica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="id_organica" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/id_organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/id_organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_id_organica" name="{rows/content/form_1/fields/id_organica/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/id_organica/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/titulo">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="titulo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/titulo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/titulo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/titulo/value}" class="form-control" id="{rows/content/form_1/fields/titulo/@name}" name="{rows/content/form_1/fields/titulo/@name}" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/subtitulo">
                                                                    <div class="form-group col-md-5   gen-fields-holder" item-name="subtitulo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/subtitulo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/subtitulo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/subtitulo/value}" class="form-control" id="{rows/content/form_1/fields/subtitulo/@name}" name="{rows/content/form_1/fields/subtitulo/@name}" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/logo_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="logo_inicio" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/logo_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/logo_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-info file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/logo_inicio/@name}" name="{rows/content/form_1/fields/logo_inicio/@name}" value="{rows/content/form_1/fields/logo_inicio/value}" class="transparent" type="file" multiple=""/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/link_logotipo">
                                                                    <div class="form-group col-md-1  gen-fields-holder" item-name="link_logotipo" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/link_logotipo/value}" class="link btn btn-success form-link" target="_blank">
                                                                            <i class="fa fa-image"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/link_logotipo/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/imagem_fundo">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="imagem_fundo" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/imagem_fundo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/imagem_fundo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-info file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/imagem_fundo/@name}" name="{rows/content/form_1/fields/imagem_fundo/@name}" value="{rows/content/form_1/fields/imagem_fundo/value}" class="transparent" type="file" multiple=""/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/link_imagem_fundo">
                                                                    <div class="form-group col-md-1  gen-fields-holder" item-name="link_imagem_fundo" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/link_imagem_fundo/value}" class="link btn btn-success form-link" target="_blank">
                                                                            <i class="fa fa-image"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/link_imagem_fundo/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/icon_logo">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="icon_logo" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/icon_logo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/icon_logo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-info file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/icon_logo/@name}" name="{rows/content/form_1/fields/icon_logo/@name}" value="{rows/content/form_1/fields/icon_logo/value}" class="transparent" type="file" multiple=""/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/link_icon_logotipo">
                                                                    <div class="form-group col-md-1  gen-fields-holder" item-name="link_icon_logotipo" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/link_icon_logotipo/value}" class="link btn btn-success form-link" target="_blank">
                                                                            <i class="fa fa-image"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/link_icon_logotipo/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/cor_rodape">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="cor_rodape" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/cor_rodape/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/cor_rodape/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_cor_rodape_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/cor_rodape/value}" format="hex" class="form-control" id="form_1_cor_rodape" name="{rows/content/form_1/fields/cor_rodape/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/cor_cabecalho">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="cor_cabecalho" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/cor_cabecalho/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/cor_cabecalho/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_cor_cabecalho_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/cor_cabecalho/value}" format="hex" class="form-control" id="form_1_cor_cabecalho" name="{rows/content/form_1/fields/cor_cabecalho/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
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
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- COLOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485538938150"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485538938150"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485538938150"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485538938150"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485538938151"/>
</xsl:stylesheet>