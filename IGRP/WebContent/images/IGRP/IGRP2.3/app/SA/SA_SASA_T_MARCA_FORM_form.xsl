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
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="text" required="required" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control " id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" required="required" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/descricao">
                          <div class="form-group col-md-3" item-name="descricao" item-type="text" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/descricao/@name}">
                              <xsl:value-of select="rows/content/form/label/descricao"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/descricao}" class="form-control " id="{rows/content/form/value/descricao/@name}" name="{rows/content/form/value/descricao/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/modelo">
                          <div class="box gen-container-item gen-item-boxed" item-name="modelo">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/modelo"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="modelo" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'modelo'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/mnome">
                                    <div class="form-group col-md-3" item-name="mnome" item-type="text" required="required" maxlength="100">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/mnome"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/mnome/@name}">
                                        <xsl:value-of select="rows/content/form/label/mnome"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/mnome}" class="form-control no-validation" id="{rows/content/form/value/mnome/@name}" name="{rows/content/form/value/mnome/@name}" required="required" maxlength="100">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/mnome"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/mdescricao">
                                    <div class="form-group col-md-3" item-name="mdescricao" item-type="text" maxlength="200">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/mdescricao"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/mdescricao/@name}">
                                        <xsl:value-of select="rows/content/form/label/mdescricao"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/mdescricao}" class="form-control no-validation" id="{rows/content/form/value/mdescricao/@name}" name="{rows/content/form/value/mdescricao/@name}" maxlength="200">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/mdescricao"/>
                                        </xsl:call-template>
                                      </input>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_modelo" id="modelo" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/modelo/label/mnome">
                                        <xsl:if test="not(rows/content/form/table/modelo/label/mnome/@visible)">
                                          <th align="" item-name="mnome">
                                            <xsl:value-of select="rows/content/form/table/modelo/label/mnome"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/modelo/label/mdescricao">
                                        <xsl:if test="not(rows/content/form/table/modelo/label/mdescricao/@visible)">
                                          <th align="" item-name="mdescricao">
                                            <xsl:value-of select="rows/content/form/table/modelo/label/mdescricao"/>
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
                                    <xsl:for-each select="rows/content/form/table/modelo/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="mnome">
                                          <xsl:if test="not(mnome/@visible)">
                                            <td field="mnome" item-name="mnome" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="mnome_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_mnome_fk" value="{mnome}"/>
                                              <input type="hidden" name="p_mnome_fk_desc" value="{mnome_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="mdescricao">
                                          <xsl:if test="not(mdescricao/@visible)">
                                            <td field="mdescricao" item-name="mdescricao" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="mdescricao_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_mdescricao_fk" value="{mdescricao}"/>
                                              <input type="hidden" name="p_mdescricao_fk_desc" value="{mdescricao_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="modelo">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="modelo">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_modelo_id" value="{modelo_id}"/>
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
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
