<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FINGERPRINT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/fingerprint/fingerprint.css"/>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/fingerprint_1">
                                                    <div class="fingerprint box gen-container-item " gen-structure="fingerprint" gen-class="" item-name="fingerprint_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/fingerprint_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'false'"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="fingerprint">
                                                            <xsl:with-param name="fp" select="rows/content/fingerprint_1/fields"/>
                                                        </xsl:call-template>
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
                <!-- FINGERPRINT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/fingerprint/fingerprint.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489425581313"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489425581313"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489425581313"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489425581313"/>
    <xsl:include href="../../xsl/tmpl/IGRP-fingerprint.tmpl.xsl?v=1489425581313"/>
</xsl:stylesheet>