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
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                        <xsl:if test="rows/content/form/label/codigo">
                          <div class="form-group col-md-3" item-name="codigo" item-type="text" required="required" maxlength="10">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/codigo/@name}">
                              <xsl:value-of select="rows/content/form/label/codigo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/codigo}" class="form-control " id="{rows/content/form/value/codigo/@name}" name="{rows/content/form/value/codigo/@name}" required="required" maxlength="10">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/descricao">
                          <div class="form-group col-md-3" item-name="descricao" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/descricao/@name}">
                              <xsl:value-of select="rows/content/form/label/descricao"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/descricao}" class="form-control " id="{rows/content/form/value/descricao/@name}" name="{rows/content/form/value/descricao/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/montante">
                          <div class="form-group col-md-3" item-name="montante" item-type="number" maxlength="22">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/montante"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/montante/@name}">
                              <xsl:value-of select="rows/content/form/label/montante"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/montante}" class="form-control " id="{rows/content/form/value/montante/@name}" name="{rows/content/form/value/montante/@name}" maxlength="22">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/montante"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado">
                          <div class="form-group col-md-3 " item-name="estado" item-type="select" required="required">
                            <label for="{rows/content/form/list/estado/@name}">
                              <xsl:value-of select="rows/content/form/label/estado"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/estado/@name}" name="{rows/content/form/list/estado/@name}" required="required" maxlength="22">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/estado/option">
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
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
