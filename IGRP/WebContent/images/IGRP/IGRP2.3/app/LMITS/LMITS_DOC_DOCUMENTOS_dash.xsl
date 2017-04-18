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
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default">
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
                    <div class="box-body" first-type-container="true" last-type-container="true">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/lista_documentos">
                          <div class="box gen-container-item gen-item-boxed" item-name="lista_documentos">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/lista_documentos"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="lista_documentos" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'lista_documentos'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/tipo_documento">
                                    <div class="form-group col-md-3 " item-name="tipo_documento" item-type="select">
                                      <label for="{rows/content/form/value/tipo_documento/@name}">
                                        <xsl:value-of select="rows/content/form/label/tipo_documento"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/value/tipo_documento/@name}" name="{rows/content/form/value/tipo_documento/@name}">
                                        <xsl:for-each select="rows/content/form/list/tipo_documento/option">
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
                                  <xsl:if test="rows/content/form/label/documento">
                                    <div class="form-group col-md-3" item-name="documento" item-type="file">
                                      <label for="{rows/content/form/value/documento/@name}">
                                        <xsl:value-of select="rows/content/form/label/documento"/>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" class="form-control not-form no-validation" readonly=""/>
                                        <span class="input-group-btn">
                                          <span class="btn btn-default file-btn-holder">
                                            <i class="fa fa-upload"/>
                                            <input id="{rows/content/form/value/documento/@name}" name="{rows/content/form/value/documento/@name}" value="{rows/content/form/value/documento}" class="transparent no-validation" type="file" multiple=""/>
                                          </span>
                                        </span>
                                      </div>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/descricao">
                                    <div class="form-group col-md-3" item-name="descricao" item-type="textarea_m">
                                      <label for="{rows/content/form/value/descricao/@name}">
                                        <xsl:value-of select="rows/content/form/label/descricao"/>
                                      </label>
                                      <input type="textarea_m" value="{rows/content/form/value/descricao}" class="form-control no-validation" id="{rows/content/form/value/descricao/@name}" name="{rows/content/form/value/descricao/@name}"/>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_lista_documentos" id="lista_documentos" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/lista_documentos/label/tipo_documento">
                                        <xsl:if test="not(rows/content/form/table/lista_documentos/label/tipo_documento/@visible)">
                                          <th align="" item-name="tipo_documento">
                                            <xsl:value-of select="rows/content/form/table/lista_documentos/label/tipo_documento"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/lista_documentos/label/documento">
                                        <xsl:if test="not(rows/content/form/table/lista_documentos/label/documento/@visible)">
                                          <th align="" item-name="documento">
                                            <xsl:value-of select="rows/content/form/table/lista_documentos/label/documento"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/lista_documentos/label/descricao">
                                        <xsl:if test="not(rows/content/form/table/lista_documentos/label/descricao/@visible)">
                                          <th align="" item-name="descricao">
                                            <xsl:value-of select="rows/content/form/table/lista_documentos/label/descricao"/>
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
                                    <xsl:for-each select="rows/content/form/table/lista_documentos/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="tipo_documento">
                                          <xsl:if test="not(tipo_documento/@visible)">
                                            <td field="tipo_documento" item-name="tipo_documento" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="tipo_documento_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_tipo_documento_fk" value="{tipo_documento}"/>
                                              <input type="hidden" name="p_tipo_documento_fk_desc" value="{tipo_documento_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="documento">
                                          <xsl:if test="not(documento/@visible)">
                                            <td field="documento" item-name="documento" data-row="{position()}" class="file">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="documento_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_documento_fk" value="{documento}"/>
                                              <input type="hidden" name="p_documento_fk_desc" value="{documento_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="descricao">
                                          <xsl:if test="not(descricao/@visible)">
                                            <td field="descricao" item-name="descricao" data-row="{position()}" class="textarea_m">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                              <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="lista_documentos">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="lista_documentos">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_lista_documentos_id" value="{lista_documentos_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
