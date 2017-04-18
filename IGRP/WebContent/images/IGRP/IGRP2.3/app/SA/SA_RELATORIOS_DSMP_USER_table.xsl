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
                        <xsl:if test="rows/content/form/label/organica">
                          <div class="form-group col-md-3 " item-name="organica" item-type="select" required="required">
                            <label for="{rows/content/form/list/organica/@name}">
                              <xsl:value-of select="rows/content/form/label/organica"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/organica/@name}" name="{rows/content/form/list/organica/@name}" required="required" maxlength="300">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/organica"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/organica/option">
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
                        <xsl:if test="rows/content/form/label/utlizador">
                          <div class="form-group col-md-3 " item-name="utlizador" item-type="select" required="required">
                            <label for="{rows/content/form/list/utlizador/@name}">
                              <xsl:value-of select="rows/content/form/label/utlizador"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/utlizador/@name}" name="{rows/content/form/list/utlizador/@name}" required="required" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/utlizador"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/utlizador/option">
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
                        <xsl:if test="rows/content/form/label/data_inicio">
                          <div class="form-group col-md-3" item-name="data_inicio" item-type="date">
                            <label for="{rows/content/form/value/data_inicio/@name}">
                              <xsl:value-of select="rows/content/form/label/data_inicio"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_inicio}" class="form-control gen-date " id="{rows/content/form/value/data_inicio/@name}" name="{rows/content/form/value/data_inicio/@name}" format="IGRP_datePicker" maxlength="30">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
                                </xsl:call-template>
                              </input>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_fim">
                          <div class="form-group col-md-3" item-name="data_fim" item-type="date">
                            <label for="{rows/content/form/value/data_fim/@name}">
                              <xsl:value-of select="rows/content/form/label/data_fim"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_fim}" class="form-control gen-date " id="{rows/content/form/value/data_fim/@name}" name="{rows/content/form/value/data_fim/@name}" format="IGRP_datePicker" maxlength="30">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_fim"/>
                                </xsl:call-template>
                              </input>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/classificacao">
                          <div class="form-group col-md-3 " item-name="classificacao" item-type="select">
                            <label for="{rows/content/form/list/classificacao/@name}">
                              <xsl:value-of select="rows/content/form/label/classificacao"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/classificacao/@name}" name="{rows/content/form/list/classificacao/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/classificacao"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/classificacao/option">
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
                        <xsl:if test="rows/content/form/label/n_registos">
                          <div class="form-group col-md-3" item-name="n_registos" item-type="number" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/n_registos"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/n_registos/@name}">
                              <xsl:value-of select="rows/content/form/label/n_registos"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/n_registos}" class="form-control " id="{rows/content/form/value/n_registos/@name}" name="{rows/content/form/value/n_registos/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/n_registos"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="box box-table-contents  gen-container-item" item-name="table">
                    <div class="box-body table-box">
                      <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                        <xsl:with-param name="rel" select="'table'"/>
                      </xsl:apply-templates>
                      <table id="table" class="table table-striped gen-data-table  ">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/utilizador">
                              <xsl:if test="not(rows/content/table/label/utilizador/@visible)">
                                <th item-name="utilizador" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/utilizador"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/organica">
                              <xsl:if test="not(rows/content/table/label/organica/@visible)">
                                <th item-name="organica" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/organica"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/n_atendimentos">
                              <xsl:if test="not(rows/content/table/label/n_atendimentos/@visible)">
                                <th item-name="n_atendimentos" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/n_atendimentos"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/tempo_medio_atendimento">
                              <xsl:if test="not(rows/content/table/label/tempo_medio_atendimento/@visible)">
                                <th item-name="tempo_medio_atendimento" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/tempo_medio_atendimento"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/classificacao">
                              <xsl:if test="not(rows/content/table/label/classificacao/@visible)">
                                <th item-name="classificacao" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/classificacao"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/media_classificacao">
                              <xsl:if test="not(rows/content/table/label/media_classificacao/@visible)">
                                <th item-name="media_classificacao" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/media_classificacao"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/n_registos">
                              <xsl:if test="not(rows/content/table/label/n_registos/@visible)">
                                <th item-name="n_registos" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/n_registos"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="utilizador">
                                <xsl:if test="not(utilizador/@visible)">
                                  <td item-name="utilizador" item-type="text" data-row="{position()}" data-title="{../../label/utilizador}">
                                    <span>
                                      <xsl:value-of select="utilizador"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="utilizador/@visible = 'false'">
                                  <input type="hidden" name="p_utilizador_fk" value="utilizador"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="organica">
                                <xsl:if test="not(organica/@visible)">
                                  <td item-name="organica" item-type="text" data-row="{position()}" data-title="{../../label/organica}">
                                    <span>
                                      <xsl:value-of select="organica"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="organica/@visible = 'false'">
                                  <input type="hidden" name="p_organica_fk" value="organica"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="n_atendimentos">
                                <xsl:if test="not(n_atendimentos/@visible)">
                                  <td item-name="n_atendimentos" item-type="text" data-row="{position()}" data-title="{../../label/n_atendimentos}">
                                    <span>
                                      <xsl:value-of select="n_atendimentos"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="n_atendimentos/@visible = 'false'">
                                  <input type="hidden" name="p_n_atendimentos_fk" value="n_atendimentos"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="tempo_medio_atendimento">
                                <xsl:if test="not(tempo_medio_atendimento/@visible)">
                                  <td item-name="tempo_medio_atendimento" item-type="text" data-row="{position()}" data-title="{../../label/tempo_medio_atendimento}">
                                    <span>
                                      <xsl:value-of select="tempo_medio_atendimento"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="tempo_medio_atendimento/@visible = 'false'">
                                  <input type="hidden" name="p_tempo_medio_atendimento_fk" value="tempo_medio_atendimento"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="classificacao">
                                <xsl:if test="not(classificacao/@visible)">
                                  <td item-name="classificacao" item-type="text" data-row="{position()}" data-title="{../../label/classificacao}">
                                    <span>
                                      <xsl:value-of select="classificacao"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="classificacao/@visible = 'false'">
                                  <input type="hidden" name="p_classificacao_fk" value="classificacao"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="media_classificacao">
                                <xsl:if test="not(media_classificacao/@visible)">
                                  <td item-name="media_classificacao" item-type="text" data-row="{position()}" data-title="{../../label/media_classificacao}">
                                    <span>
                                      <xsl:value-of select="media_classificacao"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="media_classificacao/@visible = 'false'">
                                  <input type="hidden" name="p_media_classificacao_fk" value="media_classificacao"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="n_registos">
                                <xsl:if test="not(n_registos/@visible)">
                                  <td item-name="n_registos" item-type="text" data-row="{position()}" data-title="{../../label/n_registos}">
                                    <span>
                                      <xsl:value-of select="n_registos"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="n_registos/@visible = 'false'">
                                  <input type="hidden" name="p_n_registos_fk" value="n_registos"/>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </xsl:for-each>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
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
