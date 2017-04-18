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
                        <xsl:if test="rows/content/filter/label/description">
                          <div class="form-group col-md-3" item-name="description" item-type="text" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/description"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/description/@name}">
                              <xsl:value-of select="rows/content/filter/label/description"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/description}" class="form-control " id="{rows/content/filter/value/description/@name}" name="{rows/content/filter/value/description/@name}" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/description"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/report_alias">
                          <div class="form-group col-md-3" item-name="report_alias" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/report_alias"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/report_alias/@name}">
                              <xsl:value-of select="rows/content/filter/label/report_alias"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/report_alias}" class="form-control " id="{rows/content/filter/value/report_alias/@name}" name="{rows/content/filter/value/report_alias/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/report_alias"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/report_url">
                          <div class="form-group col-md-3" item-name="report_url" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/report_url"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/report_url/@name}">
                              <xsl:value-of select="rows/content/filter/label/report_url"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/report_url}" class="form-control " id="{rows/content/filter/value/report_url/@name}" name="{rows/content/filter/value/report_url/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/report_url"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/userid">
                          <div class="form-group col-md-3" item-name="userid" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/userid"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/userid/@name}">
                              <xsl:value-of select="rows/content/filter/label/userid"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/userid}" class="form-control " id="{rows/content/filter/value/userid/@name}" name="{rows/content/filter/value/userid/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/userid"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/password">
                          <div class="form-group col-md-3" item-name="password" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/password"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/password/@name}">
                              <xsl:value-of select="rows/content/filter/label/password"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/password}" class="form-control " id="{rows/content/filter/value/password/@name}" name="{rows/content/filter/value/password/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/password"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/host">
                          <div class="form-group col-md-3" item-name="host" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/host"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/host/@name}">
                              <xsl:value-of select="rows/content/filter/label/host"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/host}" class="form-control " id="{rows/content/filter/value/host/@name}" name="{rows/content/filter/value/host/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/host"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/destype">
                          <div class="form-group col-md-3" item-name="destype" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/destype"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/destype/@name}">
                              <xsl:value-of select="rows/content/filter/label/destype"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/destype}" class="form-control " id="{rows/content/filter/value/destype/@name}" name="{rows/content/filter/value/destype/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/destype"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/desformat">
                          <div class="form-group col-md-3" item-name="desformat" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/desformat"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/desformat/@name}">
                              <xsl:value-of select="rows/content/filter/label/desformat"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/desformat}" class="form-control " id="{rows/content/filter/value/desformat/@name}" name="{rows/content/filter/value/desformat/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/desformat"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/server">
                          <div class="form-group col-md-3" item-name="server" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/server"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/server/@name}">
                              <xsl:value-of select="rows/content/filter/label/server"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/server}" class="form-control " id="{rows/content/filter/value/server/@name}" name="{rows/content/filter/value/server/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/server"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/parameter">
                          <div class="form-group col-md-3" item-name="parameter" item-type="text" required="required" maxlength="200">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/filter/label/parameter"/>
                            </xsl:call-template>
                            <label for="{rows/content/filter/value/parameter/@name}">
                              <xsl:value-of select="rows/content/filter/label/parameter"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/parameter}" class="form-control " id="{rows/content/filter/value/parameter/@name}" name="{rows/content/filter/value/parameter/@name}" required="required" maxlength="200">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/filter/label/parameter"/>
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
                            <xsl:if test="rows/content/table/label/description">
                              <xsl:if test="not(rows/content/table/label/description/@visible)">
                                <th item-name="description" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/description"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/report_alias">
                              <xsl:if test="not(rows/content/table/label/report_alias/@visible)">
                                <th item-name="report_alias" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/report_alias"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/report_url">
                              <xsl:if test="not(rows/content/table/label/report_url/@visible)">
                                <th item-name="report_url" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/report_url"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/userid">
                              <xsl:if test="not(rows/content/table/label/userid/@visible)">
                                <th item-name="userid" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/userid"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/password">
                              <xsl:if test="not(rows/content/table/label/password/@visible)">
                                <th item-name="password" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/password"/>
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
                            <xsl:if test="rows/content/table/label/destype">
                              <xsl:if test="not(rows/content/table/label/destype/@visible)">
                                <th item-name="destype" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/destype"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/desformat">
                              <xsl:if test="not(rows/content/table/label/desformat/@visible)">
                                <th item-name="desformat" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/desformat"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/server">
                              <xsl:if test="not(rows/content/table/label/server/@visible)">
                                <th item-name="server" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/server"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/parameter">
                              <xsl:if test="not(rows/content/table/label/parameter/@visible)">
                                <th item-name="parameter" item-type="text">
                                  <xsl:value-of select="rows/content/table/label/parameter"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="description">
                                <xsl:if test="not(description/@visible)">
                                  <td item-name="description" item-type="text" data-row="{position()}" data-title="{../../label/description}">
                                    <span>
                                      <xsl:value-of select="description"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="description/@visible = 'false'">
                                  <input type="hidden" name="p_description_fk" value="description"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="report_alias">
                                <xsl:if test="not(report_alias/@visible)">
                                  <td item-name="report_alias" item-type="text" data-row="{position()}" data-title="{../../label/report_alias}">
                                    <span>
                                      <xsl:value-of select="report_alias"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="report_alias/@visible = 'false'">
                                  <input type="hidden" name="p_report_alias_fk" value="report_alias"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="report_url">
                                <xsl:if test="not(report_url/@visible)">
                                  <td item-name="report_url" item-type="text" data-row="{position()}" data-title="{../../label/report_url}">
                                    <span>
                                      <xsl:value-of select="report_url"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="report_url/@visible = 'false'">
                                  <input type="hidden" name="p_report_url_fk" value="report_url"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="userid">
                                <xsl:if test="not(userid/@visible)">
                                  <td item-name="userid" item-type="text" data-row="{position()}" data-title="{../../label/userid}">
                                    <span>
                                      <xsl:value-of select="userid"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="userid/@visible = 'false'">
                                  <input type="hidden" name="p_userid_fk" value="userid"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="password">
                                <xsl:if test="not(password/@visible)">
                                  <td item-name="password" item-type="text" data-row="{position()}" data-title="{../../label/password}">
                                    <span>
                                      <xsl:value-of select="password"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="password/@visible = 'false'">
                                  <input type="hidden" name="p_password_fk" value="password"/>
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
                              <xsl:if test="destype">
                                <xsl:if test="not(destype/@visible)">
                                  <td item-name="destype" item-type="text" data-row="{position()}" data-title="{../../label/destype}">
                                    <span>
                                      <xsl:value-of select="destype"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="destype/@visible = 'false'">
                                  <input type="hidden" name="p_destype_fk" value="destype"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="desformat">
                                <xsl:if test="not(desformat/@visible)">
                                  <td item-name="desformat" item-type="text" data-row="{position()}" data-title="{../../label/desformat}">
                                    <span>
                                      <xsl:value-of select="desformat"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="desformat/@visible = 'false'">
                                  <input type="hidden" name="p_desformat_fk" value="desformat"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="server">
                                <xsl:if test="not(server/@visible)">
                                  <td item-name="server" item-type="text" data-row="{position()}" data-title="{../../label/server}">
                                    <span>
                                      <xsl:value-of select="server"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="server/@visible = 'false'">
                                  <input type="hidden" name="p_server_fk" value="server"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="parameter">
                                <xsl:if test="not(parameter/@visible)">
                                  <td item-name="parameter" item-type="text" data-row="{position()}" data-title="{../../label/parameter}">
                                    <span>
                                      <xsl:value-of select="parameter"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="parameter/@visible = 'false'">
                                  <input type="hidden" name="p_parameter_fk" value="parameter"/>
                                </xsl:if>
                              </xsl:if>
                              <input type="hidden" name="p_id_fk" value="{id}"/>
                              <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
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
