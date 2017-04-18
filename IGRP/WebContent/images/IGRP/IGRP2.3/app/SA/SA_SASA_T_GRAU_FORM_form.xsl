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
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
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
                    <div class="box-body" first-type-container="" last-type-container="true">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/id_aplicacao">
                          <div class="form-group col-md-3 " item-name="id_aplicacao" item-type="select" required="required">
                            <label for="{rows/content/form/list/id_aplicacao/@name}">
                              <xsl:value-of select="rows/content/form/label/id_aplicacao"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/list/id_aplicacao/@name}" name="{rows/content/form/list/id_aplicacao/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/id_aplicacao"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/id_aplicacao/option">
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
                        <xsl:if test="rows/content/form/label/id_organica">
                          <div class="form-group col-md-3 " item-name="id_organica" item-type="select" required="required">
                            <label for="{rows/content/form/list/id_organica/@name}">
                              <xsl:value-of select="rows/content/form/label/id_organica"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/id_organica/@name}" name="{rows/content/form/list/id_organica/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/id_organica"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/id_organica/option">
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
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="text" required="required" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control " id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" required="required" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/imagem">
                          <div class="form-group col-md-3" item-name="imagem" item-type="file" maxlength="3000">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/imagem"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/imagem/@name}">
                              <xsl:value-of select="rows/content/form/label/imagem"/>
                            </label>
                            <div class="input-group">
                              <input type="text" class="form-control not-form " readonly=""/>
                              <span class="input-group-btn">
                                <span class="btn btn-default file-btn-holder">
                                  <i class="fa fa-upload"/>
                                  <input id="{rows/content/form/value/imagem/@name}" name="{rows/content/form/value/imagem/@name}" value="{rows/content/form/value/imagem}" class="transparent " type="file" multiple="" maxlength="3000">
                                    <xsl:call-template name="igrp-fields-validation">
                                      <xsl:with-param name="field" select="rows/content/form/label/imagem"/>
                                    </xsl:call-template>
                                  </input>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/link">
                          <div class="form-group col-md-3" item-name="link" item-type="text" maxlength="3000">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/link"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/link/@name}">
                              <xsl:value-of select="rows/content/form/label/link"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/link}" class="form-control " id="{rows/content/form/value/link/@name}" name="{rows/content/form/value/link/@name}" maxlength="3000">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/link"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado">
                          <div class="form-group col-md-3 " item-name="estado" item-type="select" required="required">
                            <label for="{rows/content/form/list/estado/@name}">
                              <xsl:value-of select="rows/content/form/label/estado"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/estado/@name}" name="{rows/content/form/list/estado/@name}" required="required" maxlength="20">
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
                        <xsl:if test="rows/content/form/label/associar_motivo">
                          <div class="box gen-container-item gen-item-boxed" item-name="associar_motivo">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/associar_motivo"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="associar_motivo" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'associar_motivo'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/motivo">
                                    <div class="form-group col-md-3 " item-name="motivo" item-type="select">
                                      <label for="{rows/content/form/list/motivo/@name}">
                                        <xsl:value-of select="rows/content/form/label/motivo"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/list/motivo/@name}" name="{rows/content/form/list/motivo/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/motivo"/>
                                        </xsl:call-template>
                                        <xsl:for-each select="rows/content/form/list/motivo/option">
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
                                  <xsl:if test="rows/content/form/label/ordem_mot">
                                    <div class="form-group col-md-3" item-name="ordem_mot" item-type="number" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/ordem_mot"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/ordem_mot/@name}">
                                        <xsl:value-of select="rows/content/form/label/ordem_mot"/>
                                      </label>
                                      <input type="number" value="{rows/content/form/value/ordem_mot}" class="form-control no-validation" id="{rows/content/form/value/ordem_mot/@name}" name="{rows/content/form/value/ordem_mot/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/ordem_mot"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/pontuacao_mot">
                                    <div class="form-group col-md-3" item-name="pontuacao_mot" item-type="number" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/pontuacao_mot"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/pontuacao_mot/@name}">
                                        <xsl:value-of select="rows/content/form/label/pontuacao_mot"/>
                                      </label>
                                      <input type="number" value="{rows/content/form/value/pontuacao_mot}" class="form-control no-validation" id="{rows/content/form/value/pontuacao_mot/@name}" name="{rows/content/form/value/pontuacao_mot/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/pontuacao_mot"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/estado_motivo">
                                    <div class="form-group col-md-3 " item-name="estado_motivo" item-type="select">
                                      <label for="{rows/content/form/list/estado_motivo/@name}">
                                        <xsl:value-of select="rows/content/form/label/estado_motivo"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/list/estado_motivo/@name}" name="{rows/content/form/list/estado_motivo/@name}" maxlength="100">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/estado_motivo"/>
                                        </xsl:call-template>
                                        <xsl:for-each select="rows/content/form/list/estado_motivo/option">
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
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_associar_motivo" id="associar_motivo" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/associar_motivo/label/motivo">
                                        <xsl:if test="not(rows/content/form/table/associar_motivo/label/motivo/@visible)">
                                          <th align="" item-name="motivo">
                                            <xsl:value-of select="rows/content/form/table/associar_motivo/label/motivo"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/associar_motivo/label/ordem_mot">
                                        <xsl:if test="not(rows/content/form/table/associar_motivo/label/ordem_mot/@visible)">
                                          <th align="" item-name="ordem_mot">
                                            <xsl:value-of select="rows/content/form/table/associar_motivo/label/ordem_mot"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/associar_motivo/label/pontuacao_mot">
                                        <xsl:if test="not(rows/content/form/table/associar_motivo/label/pontuacao_mot/@visible)">
                                          <th align="" item-name="pontuacao_mot">
                                            <xsl:value-of select="rows/content/form/table/associar_motivo/label/pontuacao_mot"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/associar_motivo/label/estado_motivo">
                                        <xsl:if test="not(rows/content/form/table/associar_motivo/label/estado_motivo/@visible)">
                                          <th align="" item-name="estado_motivo">
                                            <xsl:value-of select="rows/content/form/table/associar_motivo/label/estado_motivo"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <a class="table-row-add btn">
                                          <i class="fa fa-plus"/>
                                        </a>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/form/table/associar_motivo/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="motivo">
                                          <xsl:if test="not(motivo/@visible)">
                                            <td field="motivo" item-name="motivo" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="motivo_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_motivo_fk" value="{motivo}"/>
                                              <input type="hidden" name="p_motivo_fk_desc" value="{motivo_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="ordem_mot">
                                          <xsl:if test="not(ordem_mot/@visible)">
                                            <td field="ordem_mot" item-name="ordem_mot" data-row="{position()}" class="number">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="ordem_mot_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_ordem_mot_fk" value="{ordem_mot}"/>
                                              <input type="hidden" name="p_ordem_mot_fk_desc" value="{ordem_mot_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="pontuacao_mot">
                                          <xsl:if test="not(pontuacao_mot/@visible)">
                                            <td field="pontuacao_mot" item-name="pontuacao_mot" data-row="{position()}" class="number">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="pontuacao_mot_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_pontuacao_mot_fk" value="{pontuacao_mot}"/>
                                              <input type="hidden" name="p_pontuacao_mot_fk_desc" value="{pontuacao_mot_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="estado_motivo">
                                          <xsl:if test="not(estado_motivo/@visible)">
                                            <td field="estado_motivo" item-name="estado_motivo" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="estado_motivo_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_estado_motivo_fk" value="{estado_motivo}"/>
                                              <input type="hidden" name="p_estado_motivo_fk_desc" value="{estado_motivo_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="associar_motivo">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="associar_motivo">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_associar_motivo_id" value="{associar_motivo_id}"/>
                                        <input type="hidden" name="p_id_motivo_fk" value="{id_motivo}"/>
                                        <input type="hidden" name="p_id_motivo_fk_desc" value="{id_motivo_desc}"/>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
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
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
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
