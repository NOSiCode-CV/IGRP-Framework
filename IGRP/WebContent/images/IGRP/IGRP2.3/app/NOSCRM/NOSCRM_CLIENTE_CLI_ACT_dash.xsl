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
                  <div class="gen-menu-wrapper">
                    <xsl:if test="rows/content/menu/group/item">
                      <xsl:apply-templates select="rows/content/menu" mode="gen-buttons-group">
                        <xsl:with-param name="use-fa" select="'false'"/>
                        <xsl:with-param name="vertical" select="'true'"/>
                      </xsl:apply-templates>
                    </xsl:if>
                  </div>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/estado">
                          <div class="form-group col-md-3 " item-name="estado" item-type="select">
                            <label for="{rows/content/filter/list/estado/@name}">
                              <xsl:value-of select="rows/content/filter/label/estado"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/estado/@name}" name="{rows/content/filter/list/estado/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/estado"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/estado/option">
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
                        <xsl:if test="rows/content/filter/label/tipo_det">
                          <div class="form-group col-md-3 " item-name="tipo_det" item-type="select">
                            <label for="{rows/content/filter/list/tipo_det/@name}">
                              <xsl:value-of select="rows/content/filter/label/tipo_det"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/tipo_det/@name}" name="{rows/content/filter/list/tipo_det/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/tipo_det"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/tipo_det/option">
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
                        <xsl:if test="rows/content/filter/label/prioridade">
                          <div class="form-group col-md-3 " item-name="prioridade" item-type="select">
                            <label for="{rows/content/filter/list/prioridade/@name}">
                              <xsl:value-of select="rows/content/filter/label/prioridade"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/prioridade/@name}" name="{rows/content/filter/list/prioridade/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/prioridade"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/prioridade/option">
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
                        <xsl:if test="rows/content/filter/label/pessoa_responsavel">
                          <div class="form-group col-md-3" item-name="pessoa_responsavel" item-type="text" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/pessoa_responsavel"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/pessoa_responsavel/@name}">
                              <xsl:value-of select="rows/content/filter/label/pessoa_responsavel"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/pessoa_responsavel}" class="form-control " id="{rows/content/filter/value/pessoa_responsavel/@name}" name="{rows/content/filter/value/pessoa_responsavel/@name}" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/pessoa_responsavel"/>
                              </xsl:call-template>
                            </input>
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
                      <table id="table" class="table table-striped gen-data-table IGRP_contextmenu ">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/tipo">
                              <xsl:if test="not(rows/content/table/label/tipo/@visible)">
                                <th item-name="tipo" item-type="link">
                                  <xsl:value-of select="rows/content/table/label/tipo"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/assunto">
                              <xsl:if test="not(rows/content/table/label/assunto/@visible)">
                                <th item-name="assunto" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/assunto"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/cliente">
                              <xsl:if test="not(rows/content/table/label/cliente/@visible)">
                                <th item-name="cliente" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/cliente"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/pessoa_responsavel">
                              <xsl:if test="not(rows/content/table/label/pessoa_responsavel/@visible)">
                                <th item-name="pessoa_responsavel" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/pessoa_responsavel"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/data">
                              <xsl:if test="not(rows/content/table/label/data/@visible)">
                                <th item-name="data" item-type="date">
                                  <xsl:value-of select="rows/content/table/label/data"/>
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
                              <xsl:if test="tipo">
                                <xsl:if test="not(tipo/@visible)">
                                  <td item-name="tipo" item-type="link" data-row="{position()}" data-title="{../../label/tipo}">
                                    <xsl:choose>
                                      <xsl:when test="tipo != ''">
                                        <a href="{tipo}" class="link bClick" name="tipo" target="_blank">
                                          <xsl:value-of select="tipo_desc" disable-output-escaping="yes"/>
                                        </a>
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <span>
                                          <xsl:value-of select="tipo_desc" disable-output-escaping="yes"/>
                                        </span>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </td>
                                </xsl:if>
                                <xsl:if test="tipo/@visible = 'false'">
                                  <input type="hidden" name="p_tipo_fk" value="tipo"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="assunto">
                                <xsl:if test="not(assunto/@visible)">
                                  <td item-name="assunto" item-type="text" data-row="{position()}" data-title="{../../label/assunto}">
                                    <span>
                                      <xsl:value-of select="assunto"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="assunto/@visible = 'false'">
                                  <input type="hidden" name="p_assunto_fk" value="assunto"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="cliente">
                                <xsl:if test="not(cliente/@visible)">
                                  <td item-name="cliente" item-type="text" data-row="{position()}" data-title="{../../label/cliente}">
                                    <span>
                                      <xsl:value-of select="cliente"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="cliente/@visible = 'false'">
                                  <input type="hidden" name="p_cliente_fk" value="cliente"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="pessoa_responsavel">
                                <xsl:if test="not(pessoa_responsavel/@visible)">
                                  <td item-name="pessoa_responsavel" item-type="text" data-row="{position()}" data-title="{../../label/pessoa_responsavel}">
                                    <span>
                                      <xsl:value-of select="pessoa_responsavel"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="pessoa_responsavel/@visible = 'false'">
                                  <input type="hidden" name="p_pessoa_responsavel_fk" value="pessoa_responsavel"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="data">
                                <xsl:if test="not(data/@visible)">
                                  <td item-name="data" item-type="date" data-row="{position()}" data-title="{../../label/data}">
                                    <span>
                                      <xsl:value-of select="data"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="data/@visible = 'false'">
                                  <input type="hidden" name="p_data_fk" value="data"/>
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
                              <input type="hidden" name="p_id_fk" value="{id}"/>
                              <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
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
