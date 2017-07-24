<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/user">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="user" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/user/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/user/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/user/value}" class="form-control " id="{rows/content/form_1/fields/user/@name}" name="{rows/content/form_1/fields/user/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/password">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="password" item-type="password">
                                                                        <label for="{rows/content/form_1/fields/password/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/password/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="password" value="{rows/content/form_1/fields/password/value}" class="form-control " id="{rows/content/form_1/fields/password/@name}" name="{rows/content/form_1/fields/password/@name}" maxlength="200" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/button">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="button" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/button/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/button/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/button/value}" class="form-control " id="{rows/content/form_1/fields/button/@name}" name="{rows/content/form_1/fields/button/@name}" maxlength="50" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/buttontoken">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="buttontoken" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/buttontoken/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/buttontoken/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/buttontoken/value}" class="form-control " id="{rows/content/form_1/fields/buttontoken/@name}" name="{rows/content/form_1/fields/buttontoken/@name}" maxlength="100" placeholder=""></input>
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
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1493293164302"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1493293164302"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1493293164302"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1493293164302"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1493293164302"/>
</xsl:stylesheet>
