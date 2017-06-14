<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
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
                                <xsl:if test="rows/content/form_1/fields/dad">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="dad" item-type="text">
                                    <label for="{rows/content/form_1/fields/dad/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/dad/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/dad/value}" class="form-control " id="{rows/content/form_1/fields/dad/@name}" name="{rows/content/form_1/fields/dad/@name}" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                
                                <xsl:if test="rows/content/form_1/fields/name">
                                  <div class="form-group col-md-4   gen-fields-holder" item-name="name" item-type="text">
                                    <label for="{rows/content/form_1/fields/name/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/name/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/name/value}" class="form-control " id="{rows/content/form_1/fields/name/@name}" name="{rows/content/form_1/fields/name/@name}" maxlength="80" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                
                                
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/toolsbar_1">
                          <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                            <div class="btns-holder  pull-right" role="group">
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
                                    <xsl:if test="rows/content/table_1/fields/dad">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/dad/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/name">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/name/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/host">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/host/label"/>
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
                                      <xsl:if test="dad">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/dad/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="dad"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="name">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/name/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="name"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="host">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/host/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="host"/>
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
      </body>
    </html>
  </xsl:template>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-functions.tmpl.xsl?v=1493339449330"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-variables.tmpl.xsl?v=1493339449330"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1493339449330"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-utils.tmpl.xsl?v=1493339449330"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1493339449330"/>
  <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1493339449330"/>
</xsl:stylesheet>
