<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
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
                                    <div class="row " id="row-2d6ad011">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-left" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="gen-inner">
												<div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
						                            <xsl:call-template name="box-header">
						                              <xsl:with-param name="title" select="rows/content/form_1/@title"/>
						                              <xsl:with-param name="collapsible" select="'true'"/>
						                              <xsl:with-param name="collapsed" select="'false'"/>
						                            </xsl:call-template>
						                            <div class="box-body">
						                              <div role="form">
						                              	 <xsl:apply-templates mode="igrp-apps" select="document(rows/applications/@file)"/>
						                              </div>
						                            </div>
				                          		</div>
			                          		</div>
					                    </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1512583914728"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1512583914728"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1512583914728"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1512583914728"/>
	<xsl:include href="../../../xsl/tmpl/IGRP-apps.tmpl.xsl?v=1463090556312"/>
  	<xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1512602759423"/>
</xsl:stylesheet>
