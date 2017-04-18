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
                          <div class="form-group col-md-3" item-name="type_db" item-type="text" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/type_db"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/type_db/@name}">
                              <xsl:value-of select="rows/content/form/label/type_db"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/type_db}" class="form-control " id="{rows/content/form/value/type_db/@name}" name="{rows/content/form/value/type_db/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/type_db"/>
                              </xsl:call-template>
                            </input>
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
                        <xsl:if test="rows/content/form/label/username">
                          <div class="form-group col-md-3" item-name="username" item-type="text" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/username"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/username/@name}">
                              <xsl:value-of select="rows/content/form/label/username"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/username}" class="form-control " id="{rows/content/form/value/username/@name}" name="{rows/content/form/value/username/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/username"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/password">
                          <div class="form-group col-md-3" item-name="password" item-type="password" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/password"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/password/@name}">
                              <xsl:value-of select="rows/content/form/label/password"/>
                            </label>
                            <input type="password" value="{rows/content/form/value/password}" class="form-control " id="{rows/content/form/value/password/@name}" name="{rows/content/form/value/password/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/password"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/charset">
                          <div class="form-group col-md-3" item-name="charset" item-type="vkb_num" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/charset"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/charset/@name}">
                              <xsl:value-of select="rows/content/form/label/charset"/>
                            </label>
                            <input type="vkb_num" value="{rows/content/form/value/charset}" class="form-control " id="{rows/content/form/value/charset/@name}" name="{rows/content/form/value/charset/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/charset"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/name">
                          <div class="form-group col-md-3" item-name="name" item-type="text" maxlength="20">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/name"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/name/@name}">
                              <xsl:value-of select="rows/content/form/label/name"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/name}" class="form-control " id="{rows/content/form/value/name/@name}" name="{rows/content/form/value/name/@name}" maxlength="20">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/name"/>
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
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
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
</xsl:stylesheet>
