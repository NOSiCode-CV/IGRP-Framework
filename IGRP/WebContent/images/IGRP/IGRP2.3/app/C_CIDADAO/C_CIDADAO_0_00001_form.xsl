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
                        <xsl:if test="rows/content/form/label/separador_lista">
                          <div class="box-head subtitle clearfix" item-name="separador_lista" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/separador_lista"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="text" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control " id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/idade">
                          <div class="form-group col-md-3" item-name="idade" item-type="text" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/idade/@name}">
                              <xsl:value-of select="rows/content/form/label/idade"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/idade}" class="form-control " id="{rows/content/form/value/idade/@name}" name="{rows/content/form/value/idade/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/separador_dia">
                          <div class="box gen-container-item gen-item-boxed" item-name="separador_dia">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/separador_dia"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="separador_dia" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'separador_dia'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/nome">
                                    <div class="form-group col-md-3" item-name="nome" item-type="text" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/nome/@name}">
                                        <xsl:value-of select="rows/content/form/label/nome"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/nome}" class="form-control no-validation" id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/idade">
                                    <div class="form-group col-md-3" item-name="idade" item-type="text" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/idade/@name}">
                                        <xsl:value-of select="rows/content/form/label/idade"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/idade}" class="form-control no-validation" id="{rows/content/form/value/idade/@name}" name="{rows/content/form/value/idade/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_separador_dia" id="separador_dia" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/separador_dia/label/nome">
                                        <xsl:if test="not(rows/content/form/table/separador_dia/label/nome/@visible)">
                                          <th align="" item-name="nome">
                                            <xsl:value-of select="rows/content/form/table/separador_dia/label/nome"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/separador_dia/label/idade">
                                        <xsl:if test="not(rows/content/form/table/separador_dia/label/idade/@visible)">
                                          <th align="" item-name="idade">
                                            <xsl:value-of select="rows/content/form/table/separador_dia/label/idade"/>
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
                                    <xsl:for-each select="rows/content/form/table/separador_dia/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="nome">
                                          <xsl:if test="not(nome/@visible)">
                                            <td field="nome" item-name="nome" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                              <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="idade">
                                          <xsl:if test="not(idade/@visible)">
                                            <td field="idade" item-name="idade" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="idade_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_idade_fk" value="{idade}"/>
                                              <input type="hidden" name="p_idade_fk_desc" value="{idade_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="separador_dia">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="separador_dia">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_separador_dia_id" value="{separador_dia_id}"/>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/separador_dialog">
                          <div class="box gen-container-item gen-item-boxed" item-name="separador_dialog">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/separador_dialog"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="separador_dialog" dialog="true">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'separador_dialog'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/nome">
                                    <div class="form-group col-md-3" item-name="nome" item-type="text" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/nome/@name}">
                                        <xsl:value-of select="rows/content/form/label/nome"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/nome}" class="form-control no-validation" id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/idade">
                                    <div class="form-group col-md-3" item-name="idade" item-type="text" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/idade/@name}">
                                        <xsl:value-of select="rows/content/form/label/idade"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/idade}" class="form-control no-validation" id="{rows/content/form/value/idade/@name}" name="{rows/content/form/value/idade/@name}" maxlength="30">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_separador_dialog" id="separador_dialog" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/separador_dialog/label/nome">
                                        <xsl:if test="not(rows/content/form/table/separador_dialog/label/nome/@visible)">
                                          <th align="" item-name="nome">
                                            <xsl:value-of select="rows/content/form/table/separador_dialog/label/nome"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/separador_dialog/label/idade">
                                        <xsl:if test="not(rows/content/form/table/separador_dialog/label/idade/@visible)">
                                          <th align="" item-name="idade">
                                            <xsl:value-of select="rows/content/form/table/separador_dialog/label/idade"/>
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
                                    <xsl:for-each select="rows/content/form/table/separador_dialog/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="nome">
                                          <xsl:if test="not(nome/@visible)">
                                            <td field="nome" item-name="nome" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                              <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="idade">
                                          <xsl:if test="not(idade/@visible)">
                                            <td field="idade" item-name="idade" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="idade_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_idade_fk" value="{idade}"/>
                                              <input type="hidden" name="p_idade_fk_desc" value="{idade_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="separador_dialog">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="separador_dialog">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_separador_dialog_id" value="{separador_dialog_id}"/>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/bio">
                          <div class="form-group col-md-3" item-name="bio" item-type="biometric" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/bio"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/bio/@name}">
                              <xsl:value-of select="rows/content/form/label/bio"/>
                            </label>
                            <input type="biometric" value="{rows/content/form/value/bio}" class="form-control " id="{rows/content/form/value/bio/@name}" name="{rows/content/form/value/bio/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/bio"/>
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
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
