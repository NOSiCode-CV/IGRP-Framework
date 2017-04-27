<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
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
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/view_1">
                                                    <div class="box clearfix view-block gen-container-item " has-img="true" gen-class="" item-name="view_1">
                                                        <div class="box-body">
                                                            <xsl:if test="rows/content/view_1/fields/view_img">
                                                                <img src="{rows/content/view_1/fields/view_img}"/>
                                                            </xsl:if>
                                                            <div class="view-body clearfix ">
                                                                <xsl:if test="rows/content/view_1/fields/nome">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/email">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/email/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/email/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/username">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/username/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/username/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/telefone">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telefone/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telefone/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/telemovel">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telemovel/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telemovel/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/ultimo_acesso_igrp">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_igrp/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_igrp/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/ultimo_acesso_rede_estado">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_rede_estado/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_rede_estado/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/password_expira_em">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/password_expira_em/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/password_expira_em/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/organica">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="organica" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/organica/value}" class="form-control " id="{rows/content/form_1/fields/organica/@name}" name="{rows/content/form_1/fields/organica/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/perfil">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="perfil" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/perfil/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/perfil/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/perfil/value}" class="form-control " id="{rows/content/form_1/fields/perfil/@name}" name="{rows/content/form_1/fields/perfil/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/janela_inicil">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="janela_inicil" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/janela_inicil/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/janela_inicil/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_janela_inicil" name="{rows/content/form_1/fields/janela_inicil/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/janela_inicil/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/idioma">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="idioma" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/idioma/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/idioma/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_idioma" name="{rows/content/form_1/fields/idioma/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/idioma/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/auto_complete">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="auto_complete" item-type="checkbox">
                                                                        <div class="form-group">
                                                                            <div class="checkbox form-check-offset">
                                                                                <label>
                                                                                    <input type="checkbox" name="{rows/content/form_1/fields/auto_complete/@name}" value="1" class="checkbox " label="{rows/content/form_1/fields/auto_complete/label}">
                                                                                        <xsl:if test="rows/content/form_1/fields/auto_complete/value = '1'">
                                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                        </xsl:if>
                                                                                    </input>
                                                                                    <span>
                                                                                        <xsl:value-of select="rows/content/form_1/fields/auto_complete/label"/>
                                                                                    </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/notificacao">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/notificacao/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/receber_notificacao">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="receber_notificacao" item-type="checkbox">
                                                                        <div class="form-group">
                                                                            <div class="checkbox form-check-offset">
                                                                                <label>
                                                                                    <input type="checkbox" name="{rows/content/form_1/fields/receber_notificacao/@name}" value="1" class="checkbox " label="{rows/content/form_1/fields/receber_notificacao/label}">
                                                                                        <xsl:if test="rows/content/form_1/fields/receber_notificacao/value = '1'">
                                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                        </xsl:if>
                                                                                    </input>
                                                                                    <span>
                                                                                        <xsl:value-of select="rows/content/form_1/fields/receber_notificacao/label"/>
                                                                                    </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/email">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="email" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/email/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/email/value}" class="form-control " id="{rows/content/form_1/fields/email/@name}" name="{rows/content/form_1/fields/email/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/telemovel">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="telemovel" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/telemovel/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/telemovel/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/telemovel/value}" class="form-control " id="{rows/content/form_1/fields/telemovel/@name}" name="{rows/content/form_1/fields/telemovel/@name}" maxlength="30" placeholder=""></input>
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-functions.tmpl.xsl?v=1493306579239"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-variables.tmpl.xsl?v=1493306579239"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1493306579239"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-utils.tmpl.xsl?v=1493306579239"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1493306579241"/>
</xsl:stylesheet>
