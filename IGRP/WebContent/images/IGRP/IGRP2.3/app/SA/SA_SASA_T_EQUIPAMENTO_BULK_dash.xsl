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
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/id_aplicacao">
                          <div class="form-group col-md-3 " item-name="id_aplicacao" item-type="select">
                            <label for="{rows/content/filter/list/id_aplicacao/@name}">
                              <xsl:value-of select="rows/content/filter/label/id_aplicacao"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/filter/list/id_aplicacao/@name}" name="{rows/content/filter/list/id_aplicacao/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/id_aplicacao"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/id_aplicacao/option">
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
                        <xsl:if test="rows/content/filter/label/id_organica">
                          <div class="form-group col-md-3 " item-name="id_organica" item-type="select">
                            <label for="{rows/content/filter/list/id_organica/@name}">
                              <xsl:value-of select="rows/content/filter/label/id_organica"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/id_organica/@name}" name="{rows/content/filter/list/id_organica/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/id_organica"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/filter/list/id_organica/option">
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
                        <xsl:if test="rows/content/filter/label/modelo">
                          <div class="form-group col-md-3" item-name="modelo" item-type="LOOKUP" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/modelo"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/modelo/@name}">
                              <xsl:value-of select="rows/content/filter/label/modelo"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/filter/value/modelo}" class="form-control gen-lookup " id="{rows/content/filter/value/modelo/@name}" name="{rows/content/filter/value/modelo/@name}" maxlength="100">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/filter/label/modelo"/>
                                </xsl:call-template>
                              </input>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/filter/value/modelo/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/modelo"/>
                                <xsl:with-param name="input-id" select="rows/content/filter/value/modelo/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/marca">
                          <div class="form-group col-md-3" item-name="marca" item-type="text" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/marca"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/marca/@name}">
                              <xsl:value-of select="rows/content/filter/label/marca"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/marca}" class="form-control " id="{rows/content/filter/value/marca/@name}" name="{rows/content/filter/value/marca/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/marca"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/estado">
                          <div class="form-group col-md-3 " item-name="estado" item-type="select">
                            <label for="{rows/content/filter/list/estado/@name}">
                              <xsl:value-of select="rows/content/filter/label/estado"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/filter/list/estado/@name}" name="{rows/content/filter/list/estado/@name}" maxlength="20">
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
                        <xsl:if test="rows/content/filter/label/imei">
                          <div class="form-group col-md-3" item-name="imei" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/imei"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/imei/@name}">
                              <xsl:value-of select="rows/content/filter/label/imei"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/imei}" class="form-control " id="{rows/content/filter/value/imei/@name}" name="{rows/content/filter/value/imei/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/imei"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/global_id">
                          <div class="form-group col-md-3" item-name="global_id" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/global_id"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/global_id/@name}">
                              <xsl:value-of select="rows/content/filter/label/global_id"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/global_id}" class="form-control " id="{rows/content/filter/value/global_id/@name}" name="{rows/content/filter/value/global_id/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/global_id"/>
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
                            <xsl:if test="rows/content/table/label/descricao">
                              <xsl:if test="not(rows/content/table/label/descricao/@visible)">
                                <th item-name="descricao" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/descricao"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/marca">
                              <xsl:if test="not(rows/content/table/label/marca/@visible)">
                                <th item-name="marca" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/marca"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/modelo">
                              <xsl:if test="not(rows/content/table/label/modelo/@visible)">
                                <th item-name="modelo" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/modelo"/>
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
                            <xsl:if test="rows/content/table/label/imei">
                              <xsl:if test="not(rows/content/table/label/imei/@visible)">
                                <th item-name="imei" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/imei"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/global_id">
                              <xsl:if test="not(rows/content/table/label/global_id/@visible)">
                                <th item-name="global_id" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/global_id"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
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
                              <xsl:if test="marca">
                                <xsl:if test="not(marca/@visible)">
                                  <td item-name="marca" item-type="text" data-row="{position()}" data-title="{../../label/marca}">
                                    <span>
                                      <xsl:value-of select="marca"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="marca/@visible = 'false'">
                                  <input type="hidden" name="p_marca_fk" value="marca"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="modelo">
                                <xsl:if test="not(modelo/@visible)">
                                  <td item-name="modelo" item-type="text" data-row="{position()}" data-title="{../../label/modelo}">
                                    <span>
                                      <xsl:value-of select="modelo"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="modelo/@visible = 'false'">
                                  <input type="hidden" name="p_modelo_fk" value="modelo"/>
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
                              <xsl:if test="imei">
                                <xsl:if test="not(imei/@visible)">
                                  <td item-name="imei" item-type="text" data-row="{position()}" data-title="{../../label/imei}">
                                    <span>
                                      <xsl:value-of select="imei"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="imei/@visible = 'false'">
                                  <input type="hidden" name="p_imei_fk" value="imei"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="global_id">
                                <xsl:if test="not(global_id/@visible)">
                                  <td item-name="global_id" item-type="text" data-row="{position()}" data-title="{../../label/global_id}">
                                    <span>
                                      <xsl:value-of select="global_id"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="global_id/@visible = 'false'">
                                  <input type="hidden" name="p_global_id_fk" value="global_id"/>
                                </xsl:if>
                              </xsl:if>
                              <input type="hidden" name="p_id_fk" value="{id}"/>
                              <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                              <input type="hidden" name="p_user_equipamento_fk" value="{user_equipamento}"/>
                              <input type="hidden" name="p_user_equipamento_fk_desc" value="{user_equipamento_desc}"/>
                              <input type="hidden" name="p_user_insert_fk" value="{user_insert}"/>
                              <input type="hidden" name="p_user_insert_fk_desc" value="{user_insert_desc}"/>
                              <input type="hidden" name="p_data_insert_fk" value="{data_insert}"/>
                              <input type="hidden" name="p_data_insert_fk_desc" value="{data_insert_desc}"/>
                              <input type="hidden" name="p_user_update_fk" value="{user_update}"/>
                              <input type="hidden" name="p_user_update_fk_desc" value="{user_update_desc}"/>
                              <input type="hidden" name="p_data_update_fk" value="{data_update}"/>
                              <input type="hidden" name="p_data_update_fk_desc" value="{data_update_desc}"/>
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
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
        <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
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
