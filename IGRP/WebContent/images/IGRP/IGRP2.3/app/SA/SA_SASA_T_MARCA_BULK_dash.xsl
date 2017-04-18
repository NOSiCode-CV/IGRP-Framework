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
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="text" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/nome/@name}">
                              <xsl:value-of select="rows/content/filter/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/nome}" class="form-control " id="{rows/content/filter/value/nome/@name}" name="{rows/content/filter/value/nome/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/descricao">
                          <div class="form-group col-md-3" item-name="descricao" item-type="text" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/descricao"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/descricao/@name}">
                              <xsl:value-of select="rows/content/filter/label/descricao"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/descricao}" class="form-control " id="{rows/content/filter/value/descricao/@name}" name="{rows/content/filter/value/descricao/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/descricao"/>
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
                            <xsl:if test="rows/content/table/label/nome">
                              <xsl:if test="not(rows/content/table/label/nome/@visible)">
                                <th item-name="nome" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/nome"/>
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
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="nome">
                                <xsl:if test="not(nome/@visible)">
                                  <td item-name="nome" item-type="text" data-row="{position()}" data-title="{../../label/nome}">
                                    <span>
                                      <xsl:value-of select="nome"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="nome/@visible = 'false'">
                                  <input type="hidden" name="p_nome_fk" value="nome"/>
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
                              <input type="hidden" name="p_id_marca_fk" value="{id_marca}"/>
                              <input type="hidden" name="p_id_marca_fk_desc" value="{id_marca_desc}"/>
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
