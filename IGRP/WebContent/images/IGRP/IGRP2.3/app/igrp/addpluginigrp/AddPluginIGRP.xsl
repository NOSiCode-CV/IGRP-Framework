<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
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
                                    <div class="row row-msg">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-2d51238b">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/import_plugin_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="import_plugin_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/import_plugin_title/fields/import_plugin_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/file">
                                                                    <div class="form-group col-sm-9  gen-fields-holder" item-name="file" item-type="file" required="required">
                                                                        <label for="{rows/content/form_1/fields/file/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/file/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-default file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/file/@name}" name="{rows/content/form_1/fields/file/@name}" required="required" value="{rows/content/form_1/fields/file/value}" target-rend="" class="transparent " type="file" multiple="multiple" accept="">
                                                                                        <xsl:call-template name="setAttributes">
                                                                                            <xsl:with-param name="field" select="rows/content/form_1/fields/file"/>
                                                                                        </xsl:call-template>
                                                                                    </input>
                                                                                </span>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1510676556725"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1510676556725"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1510676556725"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1510676556725"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1510676556725"/>
</xsl:stylesheet>
