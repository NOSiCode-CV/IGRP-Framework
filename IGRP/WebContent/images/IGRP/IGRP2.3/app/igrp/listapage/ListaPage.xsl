<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
        <style/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                        <xsl:if test="rows/content/form_1">
                          <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <div class="box-body">
                              <div role="form">
                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                  <div class="col-md-3 form-group  gen-fields-holder" item-name="env_fk" item-type="select">
                                    <label for="{rows/content/form_1/fields/env_fk/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/env_fk/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/page">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="page" item-type="text">
                                    <label for="{rows/content/form_1/fields/page/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/page/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/page/value}" class="form-control " id="{rows/content/form_1/fields/page/@name}" name="{rows/content/form_1/fields/page/@name}" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/page_descr">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="page_descr" item-type="text">
                                    <label for="{rows/content/form_1/fields/page_descr/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/page_descr/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/page_descr/value}" class="form-control " id="{rows/content/form_1/fields/page_descr/@name}" name="{rows/content/form_1/fields/page_descr/@name}" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/toolsbar_1">
                          <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                            <div class="btns-holder   pull-right" role="group">
                              <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                <xsl:with-param name="vertical" select="'true'"/>
                              </xsl:apply-templates>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/table_1">
                          <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                              <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="">
                                <thead>
                                  <tr>
                                    <xsl:if test="rows/content/table_1/fields/action_descr">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/action_descr/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/page">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/page/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/page_descr">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/page_descr/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/version">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/version/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/status">
                                      <th class="bs-checkbox gen-fields-holder" align="center">
                                        <input type="checkbox" class="IGRP_checkall" check-rel="status"/>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr>
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <input type="hidden" name="p_hidden_1_fk" value="{hidden_1}"/>
                                      <input type="hidden" name="p_hidden_1_fk_desc" value="{hidden_1_desc}"/>
                                      <xsl:if test="action_descr">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/action_descr/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="action_descr"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="page">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/page/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="page"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="page_descr">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/page_descr/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="page_descr"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="version">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/version/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="version"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="status">
                                        <td align="" data-row="{position()}" data-title="{../../label/status}" class="bs-checkbox">
                                          <xsl:if test="status != '-0'">
                                            <input type="checkbox" name="p_status" value="{status}" check-rel="status">
                                              <xsl:if test="status_check=status">
                                                <xsl:attribute name="checked">checked
                                                </xsl:attribute>
                                              </xsl:if>
                                            </input>
                                          </xsl:if>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                            <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="table-context-menu"/>
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
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-functions.tmpl.xsl?v=1493386528072"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-variables.tmpl.xsl?v=1493386528072"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1493386528072"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-utils.tmpl.xsl?v=1493386528072"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1493386528072"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1493386528072"/>
</xsl:stylesheet>
