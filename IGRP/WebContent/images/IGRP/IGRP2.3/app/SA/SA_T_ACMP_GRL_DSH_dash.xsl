<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- STATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/app/sa/css/apptv.css"/>
                <xsl:if test="rows/content/form_1/fields/hidden[@name='p_imagem_fundo'] != ''">
                <style>
                    body.apptv .container-fluid, body.apptv #igrp-contents .content{
                        background-image: url('<xsl:value-of select="rows/content/form_1/fields/hidden[@name='p_imagem_fundo']"/>');
                    }
                </style>
            </xsl:if>
            </head>
            <body class="{$bodyClass} sidebar-off apptv">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:if test="rows/content/page_title">
                                        <section class="content-header gen-container-item" style="background:{rows/content/form_1/fields/hidden[@name='p_cor_cabecalho']}" gen-class="" item-name="page_title">
                                            <h2>
                                                <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                            </h2>
                                        </section>
                                    </xsl:if>
                                    <section id="section-nav">
                                        <div class="row">
                                            <div class="gen-column col-md-12">
                                                <div class="gen-inner">
                                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="gen-column col-md-6" id="apptv-atend">
                                                <div class="gen-inner">
                                                    <xsl:if test="rows/content/media_classificacao">
                                                        <div class="statbox_container gen-container-item " gen-class="" item-name="media_classificacao">
                                                            <div class="statbox" style="background:{rows/content/media_classificacao/fields/media_classificacao_bg/value};border-color:{rows/content/media_classificacao/fields/media_classificacao_bg/value};">
                                                                <div class="col-md-3">
                                                                    <div class="row">
                                                                        <div class="sa-img">
                                                                            <xsl:if test="rows/content/form_1/fields/hidden[@name='p_link_img_media']">
                                                                                <img class="imgrating" src="{rows/content/form_1/fields/hidden[@name='p_link_img_media']}"/>
                                                                                <!--<xsl:attribute name="style">
                                                                                   <xsl:text>background-image: url('</xsl:text><xsl:value-of select="rows/content/form_1/fields/hidden[@name='p_link_img_media']"/><xsl:text>');</xsl:text>
                                                                                </xsl:attribute>-->
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <div class="row">
                                                                        <div class="sa-title">
                                                                            <xsl:value-of select="rows/content/media_classificacao/fields/media_classificacao_tit/value"/>
                                                                        </div>
                                                                        <div class="sa-number rating">
                                                                            <xsl:value-of select="rows/content/media_classificacao/fields/media_classificacao_val/value"/>
                                                                            <!--<i class="fa {rows/content/media_classificacao/fields/media_classificacao_icn/value}" aria-hidden="true"/>-->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </xsl:if>
                                                </div>
                                            </div>
                                            <div class="col-md-6" id="apptv-logo">
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="row item-logo">
                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                        <xsl:variable name="cont" select="count(rows/content/table_1/table/value/row)"/>
                                                        <xsl:variable name="col">
                                                            <xsl:choose>
                                                                <xsl:when test="$cont &gt;= 5">2</xsl:when>
                                                                <xsl:when test="$cont = 4 ">3</xsl:when>
                                                                <xsl:when test="$cont &gt;= 1 and $cont &lt; 3">6</xsl:when>
                                                                <xsl:when test="$cont = 3 ">4</xsl:when>
                                                            </xsl:choose>
                                                        </xsl:variable>
                                                        <xsl:for-each select="rows/content/table_1/table/value/row">
                                                            <xsl:if test="position() &lt; 7">
                                                                <xsl:if test="link_logo != ''">
                                                                    <div class="col-md-{$col}">
                                                                        <div class="logo">
                                                                            <img src="{link_logo}"/>
                                                                            <!--<xsl:attribute name="style">
                                                                               <xsl:text>background-image: url('</xsl:text><xsl:value-of select="link_logo"/><xsl:text>');</xsl:text>
                                                                            </xsl:attribute>-->
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="gen-column col-md-4">
                                                <div class="gen-inner apptv-atendimento">
                                                    <xsl:if test="rows/content/total_atendimento">
                                                        <div class="statbox_container gen-container-item " gen-class="" item-name="total_atendimento">
                                                            <div class="statbox" style="background:{rows/content/total_atendimento/fields/total_atendimento_bg/value};border-color:{rows/content/total_atendimento/fields/total_atendimento_bg/value};">
                                                                <div class="sa-title">
                                                                        <xsl:value-of select="rows/content/total_atendimento/fields/total_atendimento_tit/value"/>
                                                                    </div>
                                                                    <div class="sa-number">
                                                                        <span class="realizeService">
                                                                            <xsl:value-of select="rows/content/total_atendimento/fields/total_atendimento_val/value"/>
                                                                        </span>
                                                                        <i class="fa {rows/content/total_atendimento/fields/total_atendimento_icn/value}" aria-hidden="true"/>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                    </xsl:if>
                                                    
                                                </div>
                                            </div>
                                            <div class="gen-column col-md-4">
                                                <div class="gen-inner apptv-atendimento">
                                                    <xsl:if test="rows/content/total_avaliado">
                                                <div class="statbox_container gen-container-item " gen-class="" item-name="total_avaliado">
                                                    <div class="statbox" style="background:{rows/content/total_avaliado/fields/total_avaliado_bg/value};border-color:{rows/content/total_avaliado/fields/total_avaliado_bg/value};">
                                                        <div class="sa-title">
                                                                <xsl:value-of select="rows/content/total_avaliado/fields/total_avaliado_tit/value"/>
                                                            </div>
                                                            <div class="sa-number">
                                                                <span class="rateService">
                                                                    <xsl:value-of select="rows/content/total_avaliado/fields/total_avaliado_val/value"/>
                                                                </span>
                                                                <i class="fa {rows/content/total_avaliado/fields/total_avaliado_icn/value}" aria-hidden="true"/>
                                                            </div>
                                                    </div>
                                                </div>
                                            </xsl:if>
                                                </div>
                                            </div>
                                            <div class="gen-column col-md-4">
                                                <div class="gen-inner apptv-atendimento">
                                                    <xsl:if test="rows/content/media_tempo">
                                                        <div class="statbox_container gen-container-item " gen-class="" item-name="media_tempo">
                                                            <div class="statbox {rows/content/media_tempo/fields/media_tempo_bg/value}" style="background:{rows/content/media_tempo/fields/media_tempo_bg/value};border-color:{rows/content/media_tempo/fields/media_tempo_bg/value};">
                                                                <div class="sa-title">
                                                                    <xsl:value-of select="rows/content/media_tempo/fields/media_tempo_tit/value"/>
                                                                </div>
                                                                <div class="sa-number">
                                                                    <span class="timeService">
                                                                        <xsl:value-of select="rows/content/media_tempo/fields/media_tempo_val/value"/>
                                                                    </span>
                                                                    <i class="fa {rows/content/media_tempo/fields/media_tempo_icn/value}" aria-hidden="true"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </xsl:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="gen-column col-md-12">
                                                <div class="gen-inner">
                                                    <xsl:if test="rows/content/form_1">
                                                        <div class="box igrp-forms gen-container-item " id="form_hidden" gen-class="" item-name="form_1">
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
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <script type="text/javascript" src="{$path}/app/sa/js/jquery.fullscreen.min.js"/>
                <script type="text/javascript" src="{$path}/app/sa/js/apptv.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487165598984"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487165598984"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487165598984"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487165598984"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487165598984"/>
</xsl:stylesheet>