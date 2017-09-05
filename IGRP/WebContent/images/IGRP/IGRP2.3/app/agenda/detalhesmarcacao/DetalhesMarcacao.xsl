<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
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
                                    <div class="row" id="row-5acef602">
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
                                                <xsl:if test="rows/content/view_1">
                                                    <div class="box clearfix view-block gen-container-item " has-img="true" gen-class="" item-name="view_1">
                                                        <div class="box-body">
                                                            <xsl:if test="rows/content/view_1/fields/view_1_img">
                                                                <img src="{rows/content/view_1/fields/view_1_img/value}"/>
                                                            </xsl:if>
                                                            <div class="view-body clearfix ">
                                                                <xsl:if test="rows/content/view_1/fields/nome">
                                                                    <div class="view-item gen-fields-holder" item-name="nome">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/requerente">
                                                                    <div class="view-item gen-fields-holder" item-name="requerente">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/requerente/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/requerente/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/contato">
                                                                    <div class="view-item view-separator gen-fields-holder" item-name="contato">
                                                                        <span class="view">
                                                                            <xsl:value-of select="rows/content/view_1/fields/contato/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/email">
                                                                    <div class="view-item gen-fields-holder" item-name="email">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/email/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/email/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/telemovel">
                                                                    <div class="view-item gen-fields-holder" item-name="telemovel">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telemovel/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telemovel/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/telefone">
                                                                    <div class="view-item gen-fields-holder" item-name="telefone">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telefone/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/telefone/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/detalhes_agenda">
                                                                    <div class="view-item view-separator gen-fields-holder" item-name="detalhes_agenda">
                                                                        <span class="view">
                                                                            <xsl:value-of select="rows/content/view_1/fields/detalhes_agenda/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/servico">
                                                                    <div class="view-item gen-fields-holder" item-name="servico">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/servico/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/servico/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/balcao">
                                                                    <div class="view-item gen-fields-holder" item-name="balcao">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/balcao/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/balcao/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/data">
                                                                    <div class="view-item gen-fields-holder" item-name="data">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/data/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/data/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/hora">
                                                                    <div class="view-item gen-fields-holder" item-name="hora">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/hora/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/hora/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/tipo_documento">
                                                                    <div class="view-item gen-fields-holder" item-name="tipo_documento">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/tipo_documento/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/tipo_documento/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/n_documento">
                                                                    <div class="view-item gen-fields-holder" item-name="n_documento">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/n_documento/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/n_documento/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1504259141432"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1504259141432"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1504259141432"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1504259141432"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1504259141432"/>
</xsl:stylesheet>
