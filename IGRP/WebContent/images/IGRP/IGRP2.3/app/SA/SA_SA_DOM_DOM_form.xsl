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
                                                <xsl:if test="rows/content/peracoes">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="peracoes">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/peracoes" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_d">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_d">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_d/fields"/>
                                                                <xsl:if test="rows/content/form_d/fields/dominio">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="dominio" item-type="text" required="required">
                                                                        <label for="{rows/content/form_d/fields/dominio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_d/fields/dominio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_d/fields/dominio/value}" class="form-control" id="{rows/content/form_d/fields/dominio/@name}" name="{rows/content/form_d/fields/dominio/@name}" required="required" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_d/fields/valor">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="valor" item-type="text" required="required">
                                                                        <label for="{rows/content/form_d/fields/valor/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_d/fields/valor/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_d/fields/valor/value}" class="form-control" id="{rows/content/form_d/fields/valor/@name}" name="{rows/content/form_d/fields/valor/@name}" required="required" maxlength="240"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_d/fields/significado">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="significado" item-type="text" required="required">
                                                                        <label for="{rows/content/form_d/fields/significado/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_d/fields/significado/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_d/fields/significado/value}" class="form-control" id="{rows/content/form_d/fields/significado/@name}" name="{rows/content/form_d/fields/significado/@name}" required="required" maxlength="240"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_d/fields/orden">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="orden" item-type="number">
                                                                        <label for="{rows/content/form_d/fields/orden/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_d/fields/orden/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_d/fields/orden/value}" class="form-control" id="{rows/content/form_d/fields/orden/@name}" name="{rows/content/form_d/fields/orden/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_d/tools-bar" mode="form-buttons"/>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487068707635"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487068707635"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487068707635"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487068707635"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487068707635"/>
</xsl:stylesheet>