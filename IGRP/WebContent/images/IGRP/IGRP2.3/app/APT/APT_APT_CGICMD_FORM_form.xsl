<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <section class="content-header gen-container-item">
                    <h1>
                      <xsl:value-of select="rows/content/title"/>
                    </h1>
                  </section>
                  <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                  <xsl:if test="rows/content/form/tools-bar/item">
                    <div class="toolsbar-holder boxed gen-container-item clearfix">
                      <div class="btns-holder clearfix pull-right" role="group">
                        <xsl:apply-templates select="rows/content/form/tools-bar" mode="gen-buttons">
                          <xsl:with-param name="use-fa" select="'false'"/>
                          <xsl:with-param name="vertical" select="'true'"/>
                          <xsl:with-param name="type" select="'tools-bar'"/>
                        </xsl:apply-templates>
                      </div>
                    </div>
                  </xsl:if>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/description">
                          <div class="form-group col-md-3" item-name="description" item-type="text" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/description"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/description/@name}">
                              <xsl:value-of select="rows/content/form/label/description"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/description}" class="form-control " id="{rows/content/form/value/description/@name}" name="{rows/content/form/value/description/@name}" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/description"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/report_alias">
                          <div class="form-group col-md-3" item-name="report_alias" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/report_alias"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/report_alias/@name}">
                              <xsl:value-of select="rows/content/form/label/report_alias"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/report_alias}" class="form-control " id="{rows/content/form/value/report_alias/@name}" name="{rows/content/form/value/report_alias/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/report_alias"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/report_url">
                          <div class="form-group col-md-3" item-name="report_url" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/report_url"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/report_url/@name}">
                              <xsl:value-of select="rows/content/form/label/report_url"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/report_url}" class="form-control " id="{rows/content/form/value/report_url/@name}" name="{rows/content/form/value/report_url/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/report_url"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/userid">
                          <div class="form-group col-md-3" item-name="userid" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/userid"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/userid/@name}">
                              <xsl:value-of select="rows/content/form/label/userid"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/userid}" class="form-control " id="{rows/content/form/value/userid/@name}" name="{rows/content/form/value/userid/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/userid"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/password">
                          <div class="form-group col-md-3" item-name="password" item-type="password" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/password"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/password/@name}">
                              <xsl:value-of select="rows/content/form/label/password"/>
                            </label>
                            <input type="password" value="{rows/content/form/value/password}" class="form-control " id="{rows/content/form/value/password/@name}" name="{rows/content/form/value/password/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/password"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/host">
                          <div class="form-group col-md-3" item-name="host" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/host"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/host/@name}">
                              <xsl:value-of select="rows/content/form/label/host"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/host}" class="form-control " id="{rows/content/form/value/host/@name}" name="{rows/content/form/value/host/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/host"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/destype">
                          <div class="form-group col-md-3" item-name="destype" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/destype"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/destype/@name}">
                              <xsl:value-of select="rows/content/form/label/destype"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/destype}" class="form-control " id="{rows/content/form/value/destype/@name}" name="{rows/content/form/value/destype/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/destype"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/desformat">
                          <div class="form-group col-md-3" item-name="desformat" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/desformat"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/desformat/@name}">
                              <xsl:value-of select="rows/content/form/label/desformat"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/desformat}" class="form-control " id="{rows/content/form/value/desformat/@name}" name="{rows/content/form/value/desformat/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/desformat"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/server">
                          <div class="form-group col-md-3" item-name="server" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/server"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/server/@name}">
                              <xsl:value-of select="rows/content/form/label/server"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/server}" class="form-control " id="{rows/content/form/value/server/@name}" name="{rows/content/form/value/server/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/server"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/parameter">
                          <div class="form-group col-md-3" item-name="parameter" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/parameter"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/parameter/@name}">
                              <xsl:value-of select="rows/content/form/label/parameter"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/parameter}" class="form-control " id="{rows/content/form/value/parameter/@name}" name="{rows/content/form/value/parameter/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/parameter"/>
                              </xsl:call-template>
                            </input>
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
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
