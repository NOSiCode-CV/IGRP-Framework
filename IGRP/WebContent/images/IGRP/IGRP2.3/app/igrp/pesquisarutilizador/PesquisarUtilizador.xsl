<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
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
                        <xsl:if test="rows/content/sectionheader_1">
                          <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                            <h2>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                            </h2>
                          </section>
                        </xsl:if>
                        <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                        <xsl:if test="rows/content/form_1">
                          <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <div class="box-body">
                              <div role="form">
                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                  <div class="col-md-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                    <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option">
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
                                <xsl:if test="rows/content/form_1/fields/organica">
                                  <div class="col-md-3 form-group  gen-fields-holder" item-name="organica" item-type="select">
                                    <label for="{rows/content/form_1/fields/organica/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/organica/list/option">
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
                                <xsl:if test="rows/content/form_1/fields/perfil">
                                  <div class="col-md-3 form-group  gen-fields-holder" item-name="perfil" item-type="select">
                                    <label for="{rows/content/form_1/fields/perfil/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/perfil/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_perfil" name="{rows/content/form_1/fields/perfil/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/perfil/list/option">
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
                                <xsl:if test="rows/content/form_1/fields/username">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="username" item-type="text">
                                    <label for="{rows/content/form_1/fields/username/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/username/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/username/value}" class="form-control " id="{rows/content/form_1/fields/username/@name}" name="{rows/content/form_1/fields/username/@name}" maxlength="50" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/email">
                                  <div class="form-group col-md-3   gen-fields-holder" item-name="email" item-type="text">
                                    <label for="{rows/content/form_1/fields/email/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/email/value}" class="form-control " id="{rows/content/form_1/fields/email/@name}" name="{rows/content/form_1/fields/email/@name}" maxlength="100" placeholder="">
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
                                    <xsl:if test="rows/content/table_1/fields/nome">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/nominho">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/nominho/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/email">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/email/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/perfil">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/perfil/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr>
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <input type="hidden" name="p_id_fk" value="{id}"/>
                                      <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                                      <xsl:if test="nome">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="plaintext">
                                          <span class="">
                                            <xsl:value-of select="nome"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="nominho">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/nominho/label}" class="plaintext">
                                          <span class="">
                                            <xsl:value-of select="nominho"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="email">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/email/label}" class="plaintext">
                                          <span class="">
                                            <xsl:value-of select="email"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="perfil">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/perfil/label}" class="plaintext">
                                          <span class="">
                                            <xsl:value-of select="perfil"/>
                                          </span>
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
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1494313152473"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1494313152473"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1494313152473"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1494313152473"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1494313152473"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1494313152473"/>
</xsl:stylesheet>
