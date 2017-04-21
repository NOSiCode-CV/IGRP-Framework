<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                <xsl:if test="rows/content/form_1/fields/n_bi">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="n_bi" item-type="number">
                                    <label for="{rows/content/form_1/fields/n_bi/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/n_bi/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/form_1/fields/n_bi/value}" class="form-control " id="{rows/content/form_1/fields/n_bi/@name}" name="{rows/content/form_1/fields/n_bi/@name}" maxlength="8" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/nome">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                    <label for="{rows/content/form_1/fields/nome/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" required="required" maxlength="50" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/morada">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="morada" item-type="text" required="required">
                                    <label for="{rows/content/form_1/fields/morada/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/morada/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/morada/value}" class="form-control " id="{rows/content/form_1/fields/morada/@name}" name="{rows/content/form_1/fields/morada/@name}" required="required" maxlength="50" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/data_nascimento">
                                  <div class="form-group col-md-3  gen-fields-holder" item-name="data_nascimento" item-type="date" required="required">
                                    <label for="{rows/content/form_1/fields/data_nascimento/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/data_nascimento/label"/>
                                      </span>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/form_1/fields/data_nascimento/value}" class="form-control gen-date " id="form_1-data_nascimento" name="{rows/content/form_1/fields/data_nascimento/@name}" required="required" format="IGRP_datePicker" maxlength="30"/>
                                      <span class="input-group-btn gen-date-icon">
                                        <span class="btn btn-default">
                                          <i class="fa fa-calendar"/>
                                        </span>
                                      </span>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/sexo">
                                  <div class="col-md-3  gen-fields-holder" item-name="sexo" item-type="radiolist">
                                    <div class="form-group">
                                      <label>
                                        <span>
                                          <xsl:value-of select="rows/content/form_1/fields/sexo/label"/>
                                        </span>
                                      </label>
                                      <xsl:for-each select="rows/content/form_1/fields/sexo/list/option">
                                        <div class="radio">
                                          <label>
                                            <input type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                              <xsl:if test="@selected='true'">
                                                <xsl:attribute name="checked">checked
                                                </xsl:attribute>
                                              </xsl:if>
                                            </input>
                                            <span>
                                              <xsl:value-of select="text"/>
                                            </span>
                                          </label>
                                        </div>
                                      </xsl:for-each>
                                    </div>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/table_1">
                          <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                              <table id="table_1" class="table table-striped gen-data-table " exports="">
                                <thead>
                                  <tr>
                                    <xsl:if test="rows/content/table_1/fields/n_bi">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/n_bi/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/nome">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/morada">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/morada/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/data_nascimento">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/data_nascimento/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/sexo">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/sexo/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr>
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <xsl:if test="n_bi">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/n_bi/label}" class="number">
                                          <span class="">
                                            <xsl:value-of select="n_bi"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="nome">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="nome"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="morada">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/morada/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="morada"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="data_nascimento">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/data_nascimento/label}" class="date">
                                          <span class="">
                                            <xsl:value-of select="data_nascimento"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="sexo">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/sexo/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="sexo"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
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
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492726356742"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492726356742"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492726356742"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492726356742"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492726356742"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1492726356742"/>
</xsl:stylesheet>
