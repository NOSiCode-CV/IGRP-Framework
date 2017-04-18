<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                    <h3>
                      <xsl:value-of select="rows/content/title"/>
                    </h3>
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
                        <xsl:if test="rows/content/form/label/area_negocio">
                          <div class="form-group col-sm-3 " item-name="area_negocio" item-type="select">
                            <label for="{rows/content/form/list/area_negocio/@name}">
                              <xsl:value-of select="rows/content/form/label/area_negocio"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/area_negocio/@name}" name="{rows/content/form/list/area_negocio/@name}" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/area_negocio"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/area_negocio/option">
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
                        <xsl:if test="rows/content/form/label/produto">
                          <div class="form-group col-sm-3" item-name="produto" item-type="text" maxlength="500">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/produto"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/produto/@name}">
                              <xsl:value-of select="rows/content/form/label/produto"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/produto}" class="form-control " id="{rows/content/form/value/produto/@name}" name="{rows/content/form/value/produto/@name}" maxlength="500">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/produto"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/sigla">
                          <div class="form-group col-sm-3" item-name="sigla" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/sigla"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/sigla/@name}">
                              <xsl:value-of select="rows/content/form/label/sigla"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/sigla}" class="form-control " id="{rows/content/form/value/sigla/@name}" name="{rows/content/form/value/sigla/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/sigla"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/entidade">
                          <div class="form-group col-sm-3" item-name="entidade" item-type="text" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/entidade"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/entidade/@name}">
                              <xsl:value-of select="rows/content/form/label/entidade"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/entidade}" class="form-control " id="{rows/content/form/value/entidade/@name}" name="{rows/content/form/value/entidade/@name}" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/entidade"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/recurso">
                          <div class="form-group col-sm-3" item-name="recurso" item-type="text" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/recurso"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/recurso/@name}">
                              <xsl:value-of select="rows/content/form/label/recurso"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/recurso}" class="form-control " id="{rows/content/form/value/recurso/@name}" name="{rows/content/form/value/recurso/@name}" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/recurso"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado">
                          <div class="form-group col-sm-3 " item-name="estado" item-type="select">
                            <label for="{rows/content/form/list/estado/@name}">
                              <xsl:value-of select="rows/content/form/label/estado"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/estado/@name}" name="{rows/content/form/list/estado/@name}" maxlength="50">
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
                  <xsl:if test="rows/content/table/tools-bar/item">
                    <div class="toolsbar-holder boxed gen-container-item clearfix">
                      <div class="btns-holder pull-right clearfix" role="group">
                        <xsl:apply-templates select="rows/content/table/tools-bar" mode="gen-buttons">
                          <xsl:with-param name="use-fa" select="'false'"/>
                          <xsl:with-param name="type" select="'tools-bar'"/>
                          <xsl:with-param name="vertical" select="'true'"/>
                        </xsl:apply-templates>
                      </div>
                    </div>
                  </xsl:if>
                  <div class="box box-table-contents  gen-container-item" item-name="table">
                    <div class="box-body table-box">
                      <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                        <xsl:with-param name="rel" select="'table'"/>
                      </xsl:apply-templates>
                      <table id="table" class="table table-striped gen-data-table IGRP_contextmenu ">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/sigla">
                              <xsl:if test="not(rows/content/table/label/sigla/@visible)">
                                <th item-name="sigla" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/sigla"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/produto">
                              <xsl:if test="not(rows/content/table/label/produto/@visible)">
                                <th item-name="produto" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/produto"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/area">
                              <xsl:if test="not(rows/content/table/label/area/@visible)">
                                <th item-name="area" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/area"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/dt_inicio">
                              <xsl:if test="not(rows/content/table/label/dt_inicio/@visible)">
                                <th item-name="dt_inicio" item-type="date">
                                  <xsl:value-of select="rows/content/table/label/dt_inicio"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/dt_fim">
                              <xsl:if test="not(rows/content/table/label/dt_fim/@visible)">
                                <th item-name="dt_fim" item-type="date">
                                  <xsl:value-of select="rows/content/table/label/dt_fim"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/estado">
                              <xsl:if test="not(rows/content/table/label/estado/@visible)">
                                <th item-name="estado" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/estado"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="sigla">
                                <xsl:if test="not(sigla/@visible)">
                                  <td item-name="sigla" item-type="text" data-row="{position()}" data-title="{../../label/sigla}">
                                    <span>
                                      <xsl:value-of select="sigla"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="sigla/@visible = 'false'">
                                  <input type="hidden" name="p_sigla_fk" value="sigla"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="produto">
                                <xsl:if test="not(produto/@visible)">
                                  <td item-name="produto" item-type="text" data-row="{position()}" data-title="{../../label/produto}">
                                    <span>
                                      <xsl:value-of select="produto"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="produto/@visible = 'false'">
                                  <input type="hidden" name="p_produto_fk" value="produto"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="area">
                                <xsl:if test="not(area/@visible)">
                                  <td item-name="area" item-type="text" data-row="{position()}" data-title="{../../label/area}">
                                    <span>
                                      <xsl:value-of select="area"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="area/@visible = 'false'">
                                  <input type="hidden" name="p_area_fk" value="area"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="dt_inicio">
                                <xsl:if test="not(dt_inicio/@visible)">
                                  <td item-name="dt_inicio" item-type="date" data-row="{position()}" data-title="{../../label/dt_inicio}">
                                    <span>
                                      <xsl:value-of select="dt_inicio"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="dt_inicio/@visible = 'false'">
                                  <input type="hidden" name="p_dt_inicio_fk" value="dt_inicio"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="dt_fim">
                                <xsl:if test="not(dt_fim/@visible)">
                                  <td item-name="dt_fim" item-type="date" data-row="{position()}" data-title="{../../label/dt_fim}">
                                    <span>
                                      <xsl:value-of select="dt_fim"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="dt_fim/@visible = 'false'">
                                  <input type="hidden" name="p_dt_fim_fk" value="dt_fim"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="estado">
                                <xsl:if test="not(estado/@visible)">
                                  <td item-name="estado" item-type="text" data-row="{position()}" data-title="{../../label/estado}">
                                    <span>
                                      <xsl:value-of select="estado"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="estado/@visible = 'false'">
                                  <input type="hidden" name="p_estado_fk" value="estado"/>
                                </xsl:if>
                              </xsl:if>
                              <input type="hidden" name="p_id_objeto_fk" value="{id_objeto}"/>
                              <input type="hidden" name="p_id_objeto_fk_desc" value="{id_objeto_desc}"/>
                            </tr>
                          </xsl:for-each>
                        </tbody>
                      </table>
                    </div>
                    <xsl:apply-templates mode="table-context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="use-fa" select="'false'"/>
                    </xsl:apply-templates>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
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
