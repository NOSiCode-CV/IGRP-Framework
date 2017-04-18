<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
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
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style>#h_textarea textarea{  height: 240px;}</style>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder btn-group-lg pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
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
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_conteudo_f">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="tipo_conteudo_f" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_conteudo_f/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_conteudo_f/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " disabled="disabled" id="form_1_tipo_conteudo_f" name="{rows/content/form_1/fields/tipo_conteudo_f/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_conteudo_f/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/id_registo_f">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="id_registo_f" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/id_registo_f/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/id_registo_f/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/id_registo_f/value}" class="form-control" id="{rows/content/form_1/fields/id_registo_f/@name}" name="{rows/content/form_1/fields/id_registo_f/@name}" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/status_f">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="status_f" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/status_f/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/status_f/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/status_f/value}" class="form-control" id="{rows/content/form_1/fields/status_f/@name}" name="{rows/content/form_1/fields/status_f/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/user_name_f">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="user_name_f" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/user_name_f/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/user_name_f/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/user_name_f/value}" class="form-control" id="{rows/content/form_1/fields/user_name_f/@name}" name="{rows/content/form_1/fields/user_name_f/@name}" readonly="readonly" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_registo_f">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_registo_f" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_registo_f/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_registo_f/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_registo_f/value}" class="form-control gen-date" id="form_1-data_registo_f" name="{rows/content/form_1/fields/data_registo_f/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/conteudo_xml">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="conteudo_xml" item-type="textarea" id="h_textarea">
                                                                        <label for="{rows/content/form_1/fields/conteudo_xml/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/conteudo_xml/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/conteudo_xml/@name}" class="textarea form-control" maxlength="4000">
                                                                            <xsl:value-of select="rows/content/form_1/fields/conteudo_xml/value"/>
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
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484820848752"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484820848752"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484820848752"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484820848752"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1484820848752"/>
</xsl:stylesheet>