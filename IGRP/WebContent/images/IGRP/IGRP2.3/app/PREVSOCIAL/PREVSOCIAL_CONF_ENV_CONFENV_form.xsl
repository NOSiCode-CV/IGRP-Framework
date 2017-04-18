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
                        <xsl:if test="rows/content/form/label/tipo_banco_dados">
                          <div class="form-group col-md-3 " item-name="tipo_banco_dados" item-type="select" required="required">
                            <label for="{rows/content/form/list/tipo_banco_dados/@name}">
                              <xsl:value-of select="rows/content/form/label/tipo_banco_dados"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/list/tipo_banco_dados/@name}" name="{rows/content/form/list/tipo_banco_dados/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/tipo_banco_dados"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/tipo_banco_dados/option">
                                <option value="{value}">
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
                        <xsl:if test="rows/content/form/label/porta_coneccao">
                          <div class="form-group col-md-3" item-name="porta_coneccao" item-type="number" required="required" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/porta_coneccao"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/porta_coneccao/@name}">
                              <xsl:value-of select="rows/content/form/label/porta_coneccao"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/porta_coneccao}" class="form-control " id="{rows/content/form/value/porta_coneccao/@name}" name="{rows/content/form/value/porta_coneccao/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/porta_coneccao"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_base_dados">
                          <div class="form-group col-md-3" item-name="nome_base_dados" item-type="text" required="required" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nome_base_dados"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nome_base_dados/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_base_dados"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome_base_dados}" class="form-control " id="{rows/content/form/value/nome_base_dados/@name}" name="{rows/content/form/value/nome_base_dados/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nome_base_dados"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/username">
                          <div class="form-group col-md-3" item-name="username" item-type="text" required="required" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/username"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/username/@name}">
                              <xsl:value-of select="rows/content/form/label/username"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/username}" class="form-control " id="{rows/content/form/value/username/@name}" name="{rows/content/form/value/username/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/username"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/password">
                          <div class="form-group col-md-3" item-name="password" item-type="password" required="required" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/password"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/password/@name}">
                              <xsl:value-of select="rows/content/form/label/password"/>
                            </label>
                            <input type="password" value="{rows/content/form/value/password}" class="form-control " id="{rows/content/form/value/password/@name}" name="{rows/content/form/value/password/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/password"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/host">
                          <div class="form-group col-md-3" item-name="host" item-type="text" required="required" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/host"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/host/@name}">
                              <xsl:value-of select="rows/content/form/label/host"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/host}" class="form-control " id="{rows/content/form/value/host/@name}" name="{rows/content/form/value/host/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/host"/>
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
