<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_1/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/view_1">
                                                                            <div class="box clearfix view-block gen-container-item " has-img="false" gen-class="" item-name="view_1">
                                                                                <div class="box-body">
                                                                                    <xsl:if test="rows/content/view_1/fields/view_img">
                                                                                        <img src="{rows/content/view_1/fields/view_img}"/>
                                                                                    </xsl:if>
                                                                                    <div class="view-body clearfix ">
                                                                                        <xsl:if test="rows/content/view_1/fields/numero_de_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/numero_de_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/numero_de_pedido/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/id_det_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/id_det_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/id_det_pedido/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/tipo__de_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/tipo__de_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/tipo__de_pedido/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                    <!-- <div class="view-buttons clearfix"  gen-id="drop-zone" gen-only-type="button" gen-field-template="button"></div> -->
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/view_2">
                                                                            <div class="box clearfix view-block gen-container-item " has-img="false" gen-class="" item-name="view_2">
                                                                                <div class="box-body">
                                                                                    <xsl:if test="rows/content/view_2/fields/view_img">
                                                                                        <img src="{rows/content/view_2/fields/view_img}"/>
                                                                                    </xsl:if>
                                                                                    <div class="view-body clearfix ">
                                                                                        <xsl:if test="rows/content/view_2/fields/predio">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/predio/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/predio/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_2/fields/data_de_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/data_de_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/data_de_pedido/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_2/fields/estado">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/estado/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/estado/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                    <!-- <div class="view-buttons clearfix"  gen-id="drop-zone" gen-only-type="button" gen-field-template="button"></div> -->
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
                                                                <xsl:if test="rows/content/form_1/fields/atencao">
                                                                    <div class="col-md-12  form-group  gen-fields-holder" item-name="atencao" item-type="plaintext">
                                                                        <xsl:value-of select="rows/content/form_1/fields/atencao/value"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ato_de">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="ato_de" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/ato_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/ato_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/ato_de/value}" class="form-control " id="{rows/content/form_1/fields/ato_de/@name}" name="{rows/content/form_1/fields/ato_de/@name}" disabled="disabled" required="required" maxlength="200" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ato_para">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="ato_para" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/ato_para/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ato_para/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_ato_para" name="{rows/content/form_1/fields/ato_para/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ato_para/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/notas">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="notas" item-type="textarea" required="required">
                                                                        <label for="{rows/content/form_1/fields/notas/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/notas/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/notas/@name}" required="required" class="textarea form-control " maxlength="4000">
                                                                            <xsl:value-of select="rows/content/form_1/fields/notas/value"/>
                                                                        </textarea>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489418336327"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489418336327"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489418336327"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489418336327"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1489418336328"/>
</xsl:stylesheet>