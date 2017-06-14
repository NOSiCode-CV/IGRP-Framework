<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/data_de">
                    <div class="col-1-4 item" item-name="data_de">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/data_de) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/data_de" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/data_de" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/data_de/@name}" value="{rows/content/form/value/data_de}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/data_de"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/data_ate">
                    <div class="col-1-4 item" item-name="data_ate">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/data_ate) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/data_ate" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/data_ate" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/data_ate/@name}" value="{rows/content/form/value/data_ate}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/data_ate"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/objecto">
                    <div class="col-1-4 item" item-name="objecto">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/objecto) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/objecto" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/objecto" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/objecto/@name}" chosen="select" data-placeholder="{rows/content/form/list/objecto/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/objecto"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/objecto/option[position() != 1]">
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
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/env_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/env_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/org_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/org_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/prof_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/prof_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/tipo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/descr">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/descr"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/user_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/user_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_action">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/dt_action"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/action">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/action"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="env_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/env_name}" class="text">
                                <xsl:value-of select="env_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="org_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/org_name}" class="text">
                                <xsl:value-of select="org_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="prof_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/prof_name}" class="text">
                                <xsl:value-of select="prof_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo">
                              <td align="center" data-row="{position()}" data-title="{../../label/tipo}" class="text">
                                <xsl:value-of select="tipo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="descr">
                              <td align="left" data-row="{position()}" data-title="{../../label/descr}" class="text">
                                <xsl:value-of select="descr"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="user_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/user_name}" class="text">
                                <xsl:value-of select="user_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_action">
                              <td align="center" data-row="{position()}" data-title="{../../label/dt_action}" class="text">
                                <xsl:value-of select="dt_action"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="action">
                              <td align="center" data-row="{position()}" data-title="{../../label/action}" class="text">
                                <xsl:value-of select="action"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
