<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="home-header"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/>
        <xsl:call-template name="home-top-main"/>
        <div id="igrp-bodyPage">
          <xsl:call-template name="home-slide-menu"/>
          <div class="bodyPageRigth">
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <div class="gen-row">
                <div class="gen-column col-1-1">
                  <div class="gen-inner">
                    <xsl:if  test="rows/content/toolsbar_1">
                      <div  gen-structure="toolsbar" gen-fields="ul li" gen-field-label="span" class="gen-container-item">
                        <xsl:apply-templates mode="tools-bar" select="rows/content/toolsbar_1">
                          <xsl:with-param name="rel" select="''"/>
                          <xsl:with-param name="isTable" select="''"/>
                          <xsl:with-param name="align" select="'right'"/>
                        </xsl:apply-templates>
                      </div>
                    </xsl:if>
                    <xsl:if  test="rows/content/form_1">
                      <div  class="box-content resetPadding gen-container-item" gen-id="body">
                        <div class="box-collapser">
                          <div class="col">
                            <div gen-id="drop-zone">
                              <xsl:apply-templates select="rows/content/form_1/fields" mode="hidden-fields"/>
                              <xsl:if  test="rows/content/form_1/fields/org_fk">
                                <div  class="col-1-4 item gen-fields-holder" item-name="select">
                                  <div class="igrp_item select">
                                    <label class="required">
                                      <xsl:if test="string-length(rows/content/form_1/fields/org_fk/label) &gt;45">
                                        <xsl:attribute name="title">
                                          <xsl:value-of select="rows/content/form_1/fields/org_fk/label"/>
                                        </xsl:attribute>
                                      </xsl:if>
                                      <span>
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/form_1/fields/org_fk/label"/>
                                        </span>
                                      </span>
                                    </label>
                                    <select name="{rows/content/form_1/fields/org_fk/@name}" chosen="select" id="{rows/content/form_1/fields/org_fk/@name}" data-placeholder="{rows/content/form_1/fields/org_fk/list/option[position() = 1]/text}" class="select  required">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="rows/content/form_1/fields/org_fk"/>
                                      </xsl:call-template>
                                      <xsl:for-each select="rows/content/form_1/fields/org_fk/list/option[position() != 1]">
                                        <option value="{value}">
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
                                    <div class="_clear"/>
                                  </div>
                                  <div class="_clear"/>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/form_1/fields/env_fk">
                                <div  class="col-1-4 item gen-fields-holder" item-name="select">
                                  <div class="igrp_item select">
                                    <label class="required">
                                      <xsl:if test="string-length(rows/content/form_1/fields/env_fk/label) &gt;45">
                                        <xsl:attribute name="title">
                                          <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                        </xsl:attribute>
                                      </xsl:if>
                                      <span>
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                        </span>
                                      </span>
                                    </label>
                                    <select name="{rows/content/form_1/fields/env_fk/@name}" chosen="select" id="{rows/content/form_1/fields/env_fk/@name}" data-placeholder="{rows/content/form_1/fields/env_fk/list/option[position() = 1]/text}" class="select  required">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="rows/content/form_1/fields/env_fk"/>
                                      </xsl:call-template>
                                      <xsl:for-each select="rows/content/form_1/fields/env_fk/list/option[position() != 1]">
                                        <option value="{value}">
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
                                    <div class="_clear"/>
                                  </div>
                                  <div class="_clear"/>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/form_1/fields/prof_type_fk">
                                <div  class="col-1-4 item gen-fields-holder" item-name="select">
                                  <div class="igrp_item select">
                                    <label class="required">
                                      <xsl:if test="string-length(rows/content/form_1/fields/prof_type_fk/label) &gt;45">
                                        <xsl:attribute name="title">
                                          <xsl:value-of select="rows/content/form_1/fields/prof_type_fk/label"/>
                                        </xsl:attribute>
                                      </xsl:if>
                                      <span>
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/form_1/fields/prof_type_fk/label"/>
                                        </span>
                                      </span>
                                    </label>
                                    <select name="{rows/content/form_1/fields/prof_type_fk/@name}" chosen="select" id="{rows/content/form_1/fields/prof_type_fk/@name}" data-placeholder="{rows/content/form_1/fields/prof_type_fk/list/option[position() = 1]/text}" class="select  required">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="rows/content/form_1/fields/prof_type_fk"/>
                                      </xsl:call-template>
                                      <xsl:for-each select="rows/content/form_1/fields/prof_type_fk/list/option[position() != 1]">
                                        <option value="{value}">
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
                                    <div class="_clear"/>
                                  </div>
                                  <div class="_clear"/>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/form_1/fields/dados_contactos">
                                <div  class="box-head subtitle gen-fields-holder">
                                  <span gen-lbl-setter="">
                                    <xsl:value-of select="rows/content/form_1/fields/dados_contactos/label"/>
                                  </span>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/form_1/fields/name">
                                <div  class="col-1-4 item gen-fields-holder" item-name="name">
                                  <div class="igrp_item color">
                                    <label class="required">
                                      <xsl:if test="string-length(rows/content/form_1/fields/name/label) &gt; 45">
                                        <xsl:attribute name="title">
                                          <xsl:value-of select="rows/content/form_1/fields/name/label"/>
                                        </xsl:attribute>
                                      </xsl:if>
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/name/label"/>
                                      </span>
                                    </label>
                                    <input type="text" name="{rows/content/form_1/fields/name/@name}" value="{rows/content/form_1/fields/name/value}" class="text  required" maxlength="30">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="rows/content/form_1/fields/name"/>
                                      </xsl:call-template>
                                    </input>
                                    <div class="_clear"/>
                                  </div>
                                  <div class="_clear"/>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/form_1/fields/email">
                                <div  class="col-1-4 item gen-fields-holder" item-name="email">
                                  <div class="igrp_item color">
                                    <label class="required">
                                      <xsl:if test="string-length(rows/content/form_1/fields/email/label) &gt; 45">
                                        <xsl:attribute name="title">
                                          <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                        </xsl:attribute>
                                      </xsl:if>
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                      </span>
                                    </label>
                                    <input type="email" name="{rows/content/form_1/fields/email/@name}" value="{rows/content/form_1/fields/email/value}" class="email  required" maxlength="30">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="rows/content/form_1/fields/email"/>
                                      </xsl:call-template>
                                    </input>
                                    <div class="_clear"/>
                                  </div>
                                  <div class="_clear"/>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/form_1/fields/user_name">
                                <div  class="col-1-4 item gen-fields-holder" item-name="user_name">
                                  <div class="igrp_item color">
                                    <label class="required">
                                      <xsl:if test="string-length(rows/content/form_1/fields/user_name/label) &gt; 45">
                                        <xsl:attribute name="title">
                                          <xsl:value-of select="rows/content/form_1/fields/user_name/label"/>
                                        </xsl:attribute>
                                      </xsl:if>
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/user_name/label"/>
                                      </span>
                                    </label>
                                    <input type="text" name="{rows/content/form_1/fields/user_name/@name}" value="{rows/content/form_1/fields/user_name/value}" class="text  required" maxlength="30">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="rows/content/form_1/fields/user_name"/>
                                      </xsl:call-template>
                                    </input>
                                    <div class="_clear"/>
                                  </div>
                                  <div class="_clear"/>
                                </div>
                              </xsl:if>
                            </div>
                            <div class="_clear"/>
                            <xsl:if test="rows/content/form_1/tools-bar">
                              <xsl:apply-templates mode="button-bar" select="rows/content/form_1/tools-bar"/>
                            </xsl:if>
                          </div>
                          <div class="_clear"/>
                        </div>
                      </div>
                    </xsl:if>
                  </div>
                </div>
              </div>
            </form>
            <div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div>
        <div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1476227535988"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1476227535988"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1476227535988"/>
</xsl:stylesheet>
