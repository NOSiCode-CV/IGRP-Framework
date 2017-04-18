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
                                                <xsl:if test="rows/content/tb_acao">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="tb_acao">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/tb_acao" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/frm">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="frm">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/frm/fields"/>
                                                                <xsl:if test="rows/content/frm/fields/aplicacao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select" required="required">
                                                                        <label for="{rows/content/frm/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/frm/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="frm_aplicacao" name="{rows/content/frm/fields/aplicacao/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/frm/fields/aplicacao/list/option">
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
                                                                <xsl:if test="rows/content/frm/fields/organica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="organica" item-type="select" required="required">
                                                                        <label for="{rows/content/frm/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/frm/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="frm_organica" name="{rows/content/frm/fields/organica/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/frm/fields/organica/list/option">
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
                                                                <xsl:if test="rows/content/frm/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/frm/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/frm/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/frm/fields/nome/value}" class="form-control" id="{rows/content/frm/fields/nome/@name}" name="{rows/content/frm/fields/nome/@name}" required="required" maxlength="50"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/frm/fields/imagem">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="imagem" item-type="file">
                                                                        <label for="{rows/content/frm/fields/imagem/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/frm/fields/imagem/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-success file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/frm/fields/imagem/@name}" name="{rows/content/frm/fields/imagem/@name}" value="{rows/content/frm/fields/imagem/value}" class="transparent" type="file" multiple=""/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/frm/fields/link">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="link" item-type="text">
                                                                        <label for="{rows/content/frm/fields/link/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/frm/fields/link/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/frm/fields/link/value}" class="form-control" id="{rows/content/frm/fields/link/@name}" name="{rows/content/frm/fields/link/@name}" maxlength="3000"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/frm/fields/estado">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select" required="required">
                                                                        <label for="{rows/content/frm/fields/estado/@name}">
                                                                            <xsl:value-of select="rows/content/frm/fields/estado/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="frm_estado" name="{rows/content/frm/fields/estado/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/frm/fields/estado/list/option">
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
                                                        <xsl:apply-templates select="rows/content/frm/tools-bar" mode="form-buttons"/>
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1486983364338"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1486983364338"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1486983364338"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1486983364338"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1486983364338"/>
</xsl:stylesheet>