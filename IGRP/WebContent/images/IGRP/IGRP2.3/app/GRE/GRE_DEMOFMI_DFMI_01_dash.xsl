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
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/campo_1">
                          <div class="form-group col-md-3" item-name="campo_1" item-type="text" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/campo_1"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/campo_1/@name}">
                              <xsl:value-of select="rows/content/form/label/campo_1"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/campo_1}" class="form-control " id="{rows/content/form/value/campo_1/@name}" name="{rows/content/form/value/campo_1/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/campo_1"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/reparticao">
                          <div class="form-group col-md-3 " item-name="reparticao" item-type="select" required="required">
                            <label for="{rows/content/filter/list/reparticao/@name}">
                              <xsl:value-of select="rows/content/filter/label/reparticao"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/reparticao/@name}" name="{rows/content/filter/list/reparticao/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/reparticao"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/reparticao/option">
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
                        <xsl:if test="rows/content/filter/label/ano">
                          <div class="form-group col-md-3 " item-name="ano" item-type="select" required="required">
                            <label for="{rows/content/filter/list/ano/@name}">
                              <xsl:value-of select="rows/content/filter/label/ano"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/ano/@name}" name="{rows/content/filter/list/ano/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/ano"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/ano/option">
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
                        <xsl:if test="rows/content/filter/label/mes">
                          <div class="form-group col-md-3 " item-name="mes" item-type="select">
                            <label for="{rows/content/filter/list/mes/@name}">
                              <xsl:value-of select="rows/content/filter/label/mes"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/mes/@name}" name="{rows/content/filter/list/mes/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/mes"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/mes/option">
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
                    <xsl:apply-templates select="rows/content/filter/tools-bar" mode="form-buttons">
                      <xsl:with-param name="use-fa" select="'false'"/>
                      <xsl:with-param name="fixed-target" select="'submit'"/>
                    </xsl:apply-templates>
                  </div>
                  <div class="box box-table-contents  gen-container-item" item-name="table">
                    <div class="box-body table-box">
                      <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                        <xsl:with-param name="rel" select="'table'"/>
                      </xsl:apply-templates>
                      <table id="table" class="table table-striped gen-data-table  ">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/reparticao">
                              <xsl:if test="not(rows/content/table/label/reparticao/@visible)">
                                <th item-name="reparticao" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/reparticao"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/ano">
                              <xsl:if test="not(rows/content/table/label/ano/@visible)">
                                <th item-name="ano" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/ano"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/mes">
                              <xsl:if test="not(rows/content/table/label/mes/@visible)">
                                <th item-name="mes" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/mes"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="reparticao">
                                <xsl:if test="not(reparticao/@visible)">
                                  <td item-name="reparticao" item-type="text" data-row="{position()}" data-title="{../../label/reparticao}">
                                    <span>
                                      <xsl:value-of select="reparticao"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="reparticao/@visible = 'false'">
                                  <input type="hidden" name="p_reparticao_fk" value="reparticao"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="ano">
                                <xsl:if test="not(ano/@visible)">
                                  <td item-name="ano" item-type="text" data-row="{position()}" data-title="{../../label/ano}">
                                    <span>
                                      <xsl:value-of select="ano"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="ano/@visible = 'false'">
                                  <input type="hidden" name="p_ano_fk" value="ano"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="mes">
                                <xsl:if test="not(mes/@visible)">
                                  <td item-name="mes" item-type="text" data-row="{position()}" data-title="{../../label/mes}">
                                    <span>
                                      <xsl:value-of select="mes"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="mes/@visible = 'false'">
                                  <input type="hidden" name="p_mes_fk" value="mes"/>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </xsl:for-each>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <xsl:if test="rows/content/analise">
                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="analise">
                      <xsl:call-template name="box-header">
                        <xsl:with-param name="title" select="rows/content/analise/@title"/>
                        <xsl:with-param name="collapsible" select="'true'"/>
                      </xsl:call-template>
                      <div class="box-body">
                        <xsl:call-template name="igrp-graph">
                          <xsl:with-param name="table" select="rows/content/analise"/>
                          <xsl:with-param name="chart_type" select="rows/content/analise/chart_type"/>
                          <xsl:with-param name="height" select="150"/>
                          <xsl:with-param name="title" select="rows/content/analise/caption"/>
                          <xsl:with-param name="url" select="rows/content/analise/url"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1484053507318"/>
</xsl:stylesheet>
