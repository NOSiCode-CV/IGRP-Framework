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
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/id">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="id" item-type="number" required="required">
                                                                        <label for="{rows/content/form_1/fields/id/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/id/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/id/value}" class="form-control " id="{rows/content/form_1/fields/id/@name}" name="{rows/content/form_1/fields/id/@name}" required="required" maxlength="30" placeholder=""></input>
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-functions.tmpl.xsl?v=1497012136601"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-variables.tmpl.xsl?v=1497012136601"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1497012136601"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-utils.tmpl.xsl?v=1497012136601"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1497012136601"/>
</xsl:stylesheet>
