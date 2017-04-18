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
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/list/id_organica/@name}" name="{rows/content/form/list/id_organica/@name}" required="required" maxlength="30">
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
                          <div class="form-group col-md-3" item-name="nome" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control " id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nome"/>
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
                        <xsl:if test="rows/content/form/label/descricao">
                          <div class="form-group col-md-3" item-name="descricao" item-type="textarea_g" maxlength="500">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/descricao/@name}">
                              <xsl:value-of select="rows/content/form/label/descricao"/>
                            </label>
                            <input type="textarea_g" value="{rows/content/form/value/descricao}" class="form-control " id="{rows/content/form/value/descricao/@name}" name="{rows/content/form/value/descricao/@name}" maxlength="500">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ordem_requisito">
                          <div class="form-group col-md-3" item-name="ordem_requisito" item-type="number" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/ordem_requisito"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/ordem_requisito/@name}">
                              <xsl:value-of select="rows/content/form/label/ordem_requisito"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/ordem_requisito}" class="form-control " id="{rows/content/form/value/ordem_requisito/@name}" name="{rows/content/form/value/ordem_requisito/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/ordem_requisito"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/sep_motivograu">
                          <div class="box gen-container-item gen-item-boxed" item-name="sep_motivograu">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/sep_motivograu"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="sep_motivograu" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'sep_motivograu'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/grau">
                                    <div class="form-group col-md-3 " item-name="grau" item-type="select" required="required">
                                      <label for="{rows/content/form/list/grau/@name}">
                                        <xsl:value-of select="rows/content/form/label/grau"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/list/grau/@name}" name="{rows/content/form/list/grau/@name}" required="required" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/grau"/>
                                        </xsl:call-template>
                                        <xsl:for-each select="rows/content/form/list/grau/option">
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
                                  <xsl:if test="rows/content/form/label/pontuacao">
                                    <div class="form-group col-md-3" item-name="pontuacao" item-type="number" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/pontuacao"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/pontuacao/@name}">
                                        <xsl:value-of select="rows/content/form/label/pontuacao"/>
                                      </label>
                                      <input type="number" value="{rows/content/form/value/pontuacao}" class="form-control no-validation" id="{rows/content/form/value/pontuacao/@name}" name="{rows/content/form/value/pontuacao/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/pontuacao"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/orden">
                                    <div class="form-group col-md-3" item-name="orden" item-type="number" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/orden"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/orden/@name}">
                                        <xsl:value-of select="rows/content/form/label/orden"/>
                                      </label>
                                      <input type="number" value="{rows/content/form/value/orden}" class="form-control no-validation" id="{rows/content/form/value/orden/@name}" name="{rows/content/form/value/orden/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/orden"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_sep_motivograu" id="sep_motivograu" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/sep_motivograu/label/grau">
                                        <xsl:if test="not(rows/content/form/table/sep_motivograu/label/grau/@visible)">
                                          <th align="" item-name="grau">
                                            <xsl:value-of select="rows/content/form/table/sep_motivograu/label/grau"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/sep_motivograu/label/pontuacao">
                                        <xsl:if test="not(rows/content/form/table/sep_motivograu/label/pontuacao/@visible)">
                                          <th align="" item-name="pontuacao">
                                            <xsl:value-of select="rows/content/form/table/sep_motivograu/label/pontuacao"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/sep_motivograu/label/orden">
                                        <xsl:if test="not(rows/content/form/table/sep_motivograu/label/orden/@visible)">
                                          <th align="" item-name="orden">
                                            <xsl:value-of select="rows/content/form/table/sep_motivograu/label/orden"/>
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
                                    <xsl:for-each select="rows/content/form/table/sep_motivograu/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="grau">
                                          <xsl:if test="not(grau/@visible)">
                                            <td field="grau" item-name="grau" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="grau_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_grau_fk" value="{grau}"/>
                                              <input type="hidden" name="p_grau_fk_desc" value="{grau_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="pontuacao">
                                          <xsl:if test="not(pontuacao/@visible)">
                                            <td field="pontuacao" item-name="pontuacao" data-row="{position()}" class="number">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="pontuacao_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_pontuacao_fk" value="{pontuacao}"/>
                                              <input type="hidden" name="p_pontuacao_fk_desc" value="{pontuacao_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="orden">
                                          <xsl:if test="not(orden/@visible)">
                                            <td field="orden" item-name="orden" data-row="{position()}" class="number">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="orden_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_orden_fk" value="{orden}"/>
                                              <input type="hidden" name="p_orden_fk_desc" value="{orden_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="sep_motivograu">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="sep_motivograu">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_sep_motivograu_id" value="{sep_motivograu_id}"/>
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
