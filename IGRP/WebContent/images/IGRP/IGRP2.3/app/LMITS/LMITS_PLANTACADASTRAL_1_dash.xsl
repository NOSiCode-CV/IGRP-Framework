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
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
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
                  <xsl:if test="rows/content/view">
                    <xsl:variable name="viewImg" select="rows/content/view/value/view_foto"/>
                    <xsl:variable name="hasImg">
                      <xsl:if test="$viewImg">true</xsl:if>
                    </xsl:variable>
                    <div class="box clearfix view-block gen-container-item" has-img="{$hasImg}" item-name="gen_view">
                      <div class="box-body">
                        <xsl:if test="$hasImg = 'true'">
                          <img src="{$viewImg}"/>
                        </xsl:if>
                        <div class="view-body clearfix " gen-id="drop-zone">
                          <xsl:if test="rows/content/view/label/tipo_predio">
                            <div class="view-item">
                              <span class="view-label">
                                <xsl:value-of select="rows/content/view/label/tipo_predio"/>
                              </span>
                              <span class="view-value">
                                <xsl:value-of select="rows/content/view/value/tipo_predio"/>
                              </span>
                            </div>
                          </xsl:if>
                          <xsl:if test="rows/content/view/label/numero">
                            <div class="view-item">
                              <span class="view-label">
                                <xsl:value-of select="rows/content/view/label/numero"/>
                              </span>
                              <span class="view-value">
                                <xsl:value-of select="rows/content/view/value/numero"/>
                              </span>
                            </div>
                          </xsl:if>
                          <xsl:if test="rows/content/view/label/poligono">
                            <div class="view-item">
                              <span class="view-label">
                                <xsl:value-of select="rows/content/view/label/poligono"/>
                              </span>
                              <span class="view-value">
                                <xsl:value-of select="rows/content/view/value/poligono"/>
                              </span>
                            </div>
                          </xsl:if>
                        </div>
                      </div>
                    </div>
                  </xsl:if>
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
                        <xsl:if test="rows/content/form/label/poligno">
                          <div class="form-group col-md-3" item-name="poligno" item-type="number" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/poligno"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/poligno/@name}">
                              <xsl:value-of select="rows/content/form/label/poligno"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/poligno}" class="form-control " id="{rows/content/form/value/poligno/@name}" name="{rows/content/form/value/poligno/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/poligno"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tipo_imagem">
                          <div class="form-group col-md-3 " item-name="tipo_imagem" item-type="select">
                            <label for="{rows/content/form/list/tipo_imagem/@name}">
                              <xsl:value-of select="rows/content/form/label/tipo_imagem"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/tipo_imagem/@name}" name="{rows/content/form/list/tipo_imagem/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/tipo_imagem"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/tipo_imagem/option">
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
                        <xsl:if test="rows/content/form/label/escala">
                          <div class="form-group col-md-3" item-name="escala" item-type="number" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/escala"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/escala/@name}">
                              <xsl:value-of select="rows/content/form/label/escala"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/escala}" class="form-control " id="{rows/content/form/value/escala/@name}" name="{rows/content/form/value/escala/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/escala"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/usar_automatico">
                          <div class="col-md-3" item-name="usar_automatico" item-type="checkbox">
                            <div class="form-group">
                              <div class="checkbox form-check-offset">
                                <label>
                                  <input type="checkbox" name="{rows/content/form/value/usar_automatico/@name}" value="1" class="checkbox " maxlength="30">
                                    <xsl:call-template name="igrp-fields-validation">
                                      <xsl:with-param name="field" select="rows/content/form/label/usar_automatico"/>
                                    </xsl:call-template>
                                    <xsl:if test="rows/content/form/value/usar_automatico = '1'">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                  <xsl:value-of select="rows/content/form/label/usar_automatico"/>
                                </label>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/imagem">
                          <div class="form-group col-md-3" item-name="imagem" item-type="image">
                            <img style="height:auto;width:100%;position:relative;display:block;" src="{rows/content/form/value/imagem}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
