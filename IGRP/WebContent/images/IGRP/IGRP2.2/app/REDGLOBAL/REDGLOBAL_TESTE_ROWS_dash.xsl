<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <!--XSL Generator (RED/DIM 2015)-->
      <head>
        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/>
        <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>
        <!--HOME-->
        <div id="igrp-bodyPage">
          <!--HOME LEFT-->
          <xsl:call-template name="home-slide-menu"/>
          <!--HOME RIGTH-->
          <div class="bodyPageRigth">
            <!--START YOUR CODE HERE-->
            <!--SHOW TABLET AND MOBILE TITLE-->
            <div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div>
            <!--SHOW NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <!--START TAB MENU-->
            <xsl:apply-templates mode="tab-menu" select="rows/content/menu"/>
            <!--END TAB MENU-->
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <!--SHOW HIDDEN-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              <!--START FORM-->
              <!--START TOOLS BAR FROM-->
              <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/>
              <!--END TOOLS BAR FORM-->
              <div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/idade">
                  <div class="col-1-4 item" item-name="idade">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/idade) >45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/caixa">
                  <div class="col-1-4 item" item-name="caixa">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/caixa) >45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/caixa" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/caixa" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/caixa/@name}" value="{rows/content/form/value/caixa}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/caixa"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) >45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/select">
                  <div class="col-1-4 item" item-name="select">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/select) >45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/select" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/select" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/select/@name}" chosen="select" id="{rows/content/form/list/select/@name}" data-placeholder="{rows/content/form/list/select/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/select"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/select/option[position() != 1]">
                          <option value="{value}">
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="text"/>
                          </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
              <!--START TABELA-->
              <div class="col addBorderLeftRight borderColor">
                <!--START TOOL BAR TABLE-->
                <xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates>
                <!--END TOOL BAR TABLE-->
                <div class="box-table table-responsive">
                  <!--LEGENDA TABELA-->
                  <xsl:apply-templates mode="table-legend" select="rows/content/table/legend_color"/>
                  <div class="table-container">
                    <!--CONTEXT-MENU-->
                    <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/check">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_check_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cor">
                            <th class="tdcolor">
                              <xsl:value-of select="rows/content/table/label/cor"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="check">
                              <td align="" data-row="{position()}" data-title="{../../label/check}" class="checkbox">
                                <xsl:if test="check != '-0'">
                                  <input type="checkbox" name="p_check" value="{check}">
                                    <xsl:if test="check_check=check">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="check_desc"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="cor">
                              <td align="" data-row="{position()}" data-title="{../../label/cor}" class="tdcolorcolor_td">
                                <xsl:call-template name="tdcolor">
                                  <xsl:with-param name="color" select="cor"/>
                                </xsl:call-template>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}" class="text">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <!--END TABELA--></form>
              <div class="col">
                <xsl:if test="rows/content/graphic">
                  <!--START CHARTS-->
                  <div class="col" sep-name="graphic">
                    <xsl:call-template name="igrp-graph">
                      <xsl:with-param name="table" select="rows/content/graphic"/>
                      <xsl:with-param name="chart_type" select="'line'"/>
                      <xsl:with-param name="height" select="250"/>
                      <xsl:with-param name="title" select="rows/content/graphic/caption"/>
                    </xsl:call-template>
                  </div>
                  <!--END CHARTS--></xsl:if>
                  <div class="_clear"/>
                </div>
                <!--END YOUR CODE HERE-->
                <div class="_clear"/>
              </div>
              <div class="_clear"/>
            </div>
            <!--FOOTER PAGE-->
            <div id="igrp-footerPage">
              <xsl:call-template name="footer"/>
            </div>
          </body>
        </html>
      </xsl:template>
      <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150710"/>
      <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150710"/>
      <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150710"/>
      <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150710"/>
      <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=20150710"/>
      <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150710"/>
      <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150710"/>
    </xsl:stylesheet>
