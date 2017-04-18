<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/env_fk">
                    <div class="col-1-4 item" item-name="env_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/env_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/env_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/env_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/env_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/env_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/user_name">
                    <div class="col-1-4 item" item-name="user_name">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/user_name) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/user_name" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/user_name" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/user_name/@name}" value="{rows/content/filter/value/user_name}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/user_name"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/start_time">
                    <div class="col-1-4 item" item-name="start_time">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/start_time) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/start_time" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/start_time" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/start_time/@name}" value="{rows/content/filter/value/start_time}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/start_time"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/end_time">
                    <div class="col-1-4 item" item-name="end_time">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/end_time) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/end_time" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/end_time" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/end_time/@name}" value="{rows/content/filter/value/end_time}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/end_time"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/status">
                    <div class="col-1-4 item" item-name="status">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/status) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/status" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/status" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/status/@name}" chosen="select" data-placeholder="{rows/content/filter/list/status/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/status"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/status/option[position() != 1]">
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
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/env_title">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/env_title"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/user_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/user_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/ip_address">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/ip_address"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/start_time">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/start_time"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/end_time">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/end_time"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="env_title">
                              <td align="" data-row="{position()}" data-title="{../../label/env_title}" class="text">
                                <xsl:value-of select="env_title"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="user_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/user_name}" class="text">
                                <xsl:value-of select="user_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="ip_address">
                              <td align="left" data-row="{position()}" data-title="{../../label/ip_address}" class="text">
                                <xsl:value-of select="ip_address"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="start_time">
                              <td align="center" data-row="{position()}" data-title="{../../label/start_time}" class="date">
                                <xsl:value-of select="start_time"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="end_time">
                              <td align="center" data-row="{position()}" data-title="{../../label/end_time}" class="date">
                                <xsl:value-of select="end_time"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form>
            <div class="col">
              <div class="_clear"/>
            </div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/total_session"><!-- START CHARTS--><div class="col" graph-name="total_session">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/total_session"/>
                        <xsl:with-param name="chart_type" select="rows/content/total_session/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/total_session/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/session_by_dad"><!-- START CHARTS--><div class="col" graph-name="session_by_dad">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/session_by_dad"/>
                        <xsl:with-param name="chart_type" select="rows/content/session_by_dad/chart_type"/>
                        <xsl:with-param name="height" select="190"/>
                        <xsl:with-param name="title" select="rows/content/session_by_dad/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <div class="_clear"/>
                </div>
                <div class="_clear"/>
              </div>
            </div><!-- END YOUR CODE HERE --><div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
