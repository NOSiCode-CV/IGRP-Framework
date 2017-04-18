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
                        <xsl:if test="rows/content/form/label/port">
                          <div class="form-group col-md-3" item-name="port" item-type="number" maxlength="22">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/port"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/port/@name}">
                              <xsl:value-of select="rows/content/form/label/port"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/port}" class="form-control " id="{rows/content/form/value/port/@name}" name="{rows/content/form/value/port/@name}" maxlength="22">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/port"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/type_db">
                          <div class="form-group col-md-3 " item-name="type_db" item-type="select">
                            <label for="{rows/content/form/list/type_db/@name}">
                              <xsl:value-of select="rows/content/form/label/type_db"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/type_db/@name}" name="{rows/content/form/list/type_db/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/type_db"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/type_db/option">
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
                        <xsl:if test="rows/content/form/label/host">
                          <div class="form-group col-md-3" item-name="host" item-type="text" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/host"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/host/@name}">
                              <xsl:value-of select="rows/content/form/label/host"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/host}" class="form-control " id="{rows/content/form/value/host/@name}" name="{rows/content/form/value/host/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/host"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/name_db">
                          <div class="form-group col-md-3" item-name="name_db" item-type="text" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/name_db"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/name_db/@name}">
                              <xsl:value-of select="rows/content/form/label/name_db"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/name_db}" class="form-control " id="{rows/content/form/value/name_db/@name}" name="{rows/content/form/value/name_db/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/name_db"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/env_fk">
                          <div class="form-group col-md-3 " item-name="env_fk" item-type="select">
                            <label for="{rows/content/form/list/env_fk/@name}">
                              <xsl:value-of select="rows/content/form/label/env_fk"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/env_fk/@name}" name="{rows/content/form/list/env_fk/@name}" maxlength="22">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/env_fk"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/env_fk/option">
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
                            <xsl:if test="rows/content/table/label/port">
                              <xsl:if test="not(rows/content/table/label/port/@visible)">
                                <th item-name="port" item-type="number">
                                  <xsl:value-of select="rows/content/table/label/port"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/type_db">
                              <xsl:if test="not(rows/content/table/label/type_db/@visible)">
                                <th item-name="type_db" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/type_db"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/host">
                              <xsl:if test="not(rows/content/table/label/host/@visible)">
                                <th item-name="host" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/host"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/name_db">
                              <xsl:if test="not(rows/content/table/label/name_db/@visible)">
                                <th item-name="name_db" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/name_db"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/username">
                              <xsl:if test="not(rows/content/table/label/username/@visible)">
                                <th item-name="username" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/username"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="port">
                                <xsl:if test="not(port/@visible)">
                                  <td item-name="port" item-type="number" data-row="{position()}" data-title="{../../label/port}">
                                    <span>
                                      <xsl:value-of select="port"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="port/@visible = 'false'">
                                  <input type="hidden" name="p_port_fk" value="port"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="type_db">
                                <xsl:if test="not(type_db/@visible)">
                                  <td item-name="type_db" item-type="text" data-row="{position()}" data-title="{../../label/type_db}">
                                    <span>
                                      <xsl:value-of select="type_db"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="type_db/@visible = 'false'">
                                  <input type="hidden" name="p_type_db_fk" value="type_db"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="host">
                                <xsl:if test="not(host/@visible)">
                                  <td item-name="host" item-type="text" data-row="{position()}" data-title="{../../label/host}">
                                    <span>
                                      <xsl:value-of select="host"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="host/@visible = 'false'">
                                  <input type="hidden" name="p_host_fk" value="host"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="name_db">
                                <xsl:if test="not(name_db/@visible)">
                                  <td item-name="name_db" item-type="text" data-row="{position()}" data-title="{../../label/name_db}">
                                    <span>
                                      <xsl:value-of select="name_db"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="name_db/@visible = 'false'">
                                  <input type="hidden" name="p_name_db_fk" value="name_db"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="username">
                                <xsl:if test="not(username/@visible)">
                                  <td item-name="username" item-type="text" data-row="{position()}" data-title="{../../label/username}">
                                    <span>
                                      <xsl:value-of select="username"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="username/@visible = 'false'">
                                  <input type="hidden" name="p_username_fk" value="username"/>
                                </xsl:if>
                              </xsl:if>
                              <input type="hidden" name="p_id_fk" value="{id}"/>
                              <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                              <input type="hidden" name="p_env_fk_fk" value="{env_fk}"/>
                              <input type="hidden" name="p_env_fk_fk_desc" value="{env_fk_desc}"/>
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
