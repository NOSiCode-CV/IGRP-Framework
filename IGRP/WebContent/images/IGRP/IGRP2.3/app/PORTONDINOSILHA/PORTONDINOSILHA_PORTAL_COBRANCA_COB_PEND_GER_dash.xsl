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
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/table-colors.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
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
                  <div class="gen-menu-wrapper">
                    <xsl:if test="rows/content/menu/item">
                      <div class="toolsbar-holder boxed gen-container-item clearfix">
                        <div class="btns-holder clearfix" role="group">
                          <xsl:apply-templates select="rows/content/menu" mode="gen-buttons">
                            <xsl:with-param name="use-fa" select="'false'"/>
                            <xsl:with-param name="vertical" select="'false'"/>
                          </xsl:apply-templates>
                        </div>
                      </div>
                    </xsl:if>
                  </div>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/tipo_cobranca">
                          <div class="form-group col-sm-3 " item-name="tipo_cobranca" item-type="select">
                            <label for="{rows/content/filter/list/tipo_cobranca/@name}">
                              <xsl:value-of select="rows/content/filter/label/tipo_cobranca"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/tipo_cobranca/@name}" name="{rows/content/filter/list/tipo_cobranca/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/tipo_cobranca"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/tipo_cobranca/option">
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
                        <xsl:if test="rows/content/filter/label/nr_cliente_pesq">
                          <div class="form-group col-sm-3 " item-name="nr_cliente_pesq" item-type="select">
                            <label for="{rows/content/filter/list/nr_cliente_pesq/@name}">
                              <xsl:value-of select="rows/content/filter/label/nr_cliente_pesq"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/nr_cliente_pesq/@name}" name="{rows/content/filter/list/nr_cliente_pesq/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/nr_cliente_pesq"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/nr_cliente_pesq/option">
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
                      <xsl:apply-templates mode="table-legend" select="rows/content/table/legend_color"/>
                      <table id="table" class="table table-striped gen-data-table  ">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/id">
                              <xsl:if test="not(rows/content/table/label/id/@visible)">
                                <th item-name="id" item-type="checkbox" align="center" class="bs-checkbox">
                                  <input type="checkbox" class="IGRP_checkall no-validation" title="{rows/content/table/label/id}" check-rel="id"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/descricao">
                              <xsl:if test="not(rows/content/table/label/descricao/@visible)">
                                <th item-name="descricao" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/descricao"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/entidade">
                              <xsl:if test="not(rows/content/table/label/entidade/@visible)">
                                <th item-name="entidade" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/entidade"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/referencia">
                              <xsl:if test="not(rows/content/table/label/referencia/@visible)">
                                <th item-name="referencia" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/referencia"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/valor">
                              <xsl:if test="not(rows/content/table/label/valor/@visible)">
                                <th item-name="valor" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/valor"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/data_emissao">
                              <xsl:if test="not(rows/content/table/label/data_emissao/@visible)">
                                <th item-name="data_emissao" item-type="date">
                                  <xsl:value-of select="rows/content/table/label/data_emissao"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/data_limite">
                              <xsl:if test="not(rows/content/table/label/data_limite/@visible)">
                                <th item-name="data_limite" item-type="date">
                                  <xsl:value-of select="rows/content/table/label/data_limite"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/obs">
                              <xsl:if test="not(rows/content/table/label/obs/@visible)">
                                <th item-name="obs" item-type="color_td" class="color-th">
                                  <xsl:value-of select="rows/content/table/label/obs"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="id">
                                <xsl:if test="not(id/@visible)">
                                  <td item-name="id" item-type="checkbox" data-row="{position()}" data-title="{../../label/id}" align="center">
                                    <xsl:if test="id != '-0'">
                                      <input type="checkbox" name="p_id" value="{name()}" check-rel="id">
                                        <xsl:if test="id_check=id">
                                          <xsl:attribute name="checked">checked</xsl:attribute>
                                        </xsl:if>
                                      </input>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <xsl:if test="id/@visible = 'false'">
                                  <input type="hidden" name="p_id_fk" value="id"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="descricao">
                                <xsl:if test="not(descricao/@visible)">
                                  <td item-name="descricao" item-type="text" data-row="{position()}" data-title="{../../label/descricao}">
                                    <span>
                                      <xsl:value-of select="descricao"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="descricao/@visible = 'false'">
                                  <input type="hidden" name="p_descricao_fk" value="descricao"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="entidade">
                                <xsl:if test="not(entidade/@visible)">
                                  <td item-name="entidade" item-type="text" data-row="{position()}" data-title="{../../label/entidade}">
                                    <span>
                                      <xsl:value-of select="entidade"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="entidade/@visible = 'false'">
                                  <input type="hidden" name="p_entidade_fk" value="entidade"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="referencia">
                                <xsl:if test="not(referencia/@visible)">
                                  <td item-name="referencia" item-type="text" data-row="{position()}" data-title="{../../label/referencia}">
                                    <span>
                                      <xsl:value-of select="referencia"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="referencia/@visible = 'false'">
                                  <input type="hidden" name="p_referencia_fk" value="referencia"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="valor">
                                <xsl:if test="not(valor/@visible)">
                                  <td item-name="valor" item-type="text" data-row="{position()}" data-title="{../../label/valor}">
                                    <span>
                                      <xsl:value-of select="valor"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="valor/@visible = 'false'">
                                  <input type="hidden" name="p_valor_fk" value="valor"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="data_emissao">
                                <xsl:if test="not(data_emissao/@visible)">
                                  <td item-name="data_emissao" item-type="date" data-row="{position()}" data-title="{../../label/data_emissao}">
                                    <span>
                                      <xsl:value-of select="data_emissao"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="data_emissao/@visible = 'false'">
                                  <input type="hidden" name="p_data_emissao_fk" value="data_emissao"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="data_limite">
                                <xsl:if test="not(data_limite/@visible)">
                                  <td item-name="data_limite" item-type="date" data-row="{position()}" data-title="{../../label/data_limite}">
                                    <span>
                                      <xsl:value-of select="data_limite"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="data_limite/@visible = 'false'">
                                  <input type="hidden" name="p_data_limite_fk" value="data_limite"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="obs">
                                <xsl:if test="not(obs/@visible)">
                                  <td item-name="obs" item-type="color_td" data-row="{position()}" data-title="{../../label/obs}">
                                    <xsl:call-template name="tdcolor">
                                      <xsl:with-param name="color" select="obs"/>
                                    </xsl:call-template>
                                  </td>
                                </xsl:if>
                                <xsl:if test="obs/@visible = 'false'">
                                  <input type="hidden" name="p_obs_fk" value="obs"/>
                                </xsl:if>
                              </xsl:if>
                              <input type="hidden" name="p_flag_atraso_fk" value="{flag_atraso}"/>
                              <input type="hidden" name="p_flag_atraso_fk_desc" value="{flag_atraso_desc}"/>
                              <input type="hidden" name="p_id_cobranca_fk" value="{id_cobranca}"/>
                              <input type="hidden" name="p_id_cobranca_fk_desc" value="{id_cobranca_desc}"/>
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
