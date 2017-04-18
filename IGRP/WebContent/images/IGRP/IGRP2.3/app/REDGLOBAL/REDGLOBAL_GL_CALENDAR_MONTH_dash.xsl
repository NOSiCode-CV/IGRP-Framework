<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/year">
                    <div class="col-1-4 item" item-name="year">
                      <div class="igrp_item selectchange">
                        <a id="idp_year"/>
                        <label>
                          <xsl:value-of select="rows/content/filter/label/year" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/year/@name}" chosen="select" data-placeholder="{rows/content/filter/list/year/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/year"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/year/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/month">
                    <div class="col-1-4 item" item-name="month">
                      <div class="igrp_item selectchange">
                        <a id="idp_month"/>
                        <label>
                          <xsl:value-of select="rows/content/filter/label/month" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/month/@name}" chosen="select" data-placeholder="{rows/content/filter/list/month/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/month"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/month/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/total_day">
                    <div class="col-1-4 item" item-name="total_day">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/total_day" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/total_day/@name}" value="{rows/content/filter/value/total_day}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/total_day"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/today">
                    <div class="col-1-4 item" item-name="today">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/today" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/today/@name}" value="{rows/content/filter/value/today}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/today"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/category">
                    <div class="col-1-4 item" item-name="category">
                      <div class="igrp_item selectchange">
                        <a id="idp_category"/>
                        <label>
                          <xsl:value-of select="rows/content/filter/label/category" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/category/@name}" chosen="select" data-placeholder="{rows/content/filter/list/category/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/category"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/category/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/title">
                    <div class="col-1-4 item" item-name="title">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/title" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/title/@name}" value="{rows/content/filter/value/title}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/title"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day1">
                    <div class="col-1-4 item" item-name="day1">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day1" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day1/@name}" value="{rows/content/filter/value/day1}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day1"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day2">
                    <div class="col-1-4 item" item-name="day2">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day2" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day2/@name}" value="{rows/content/filter/value/day2}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day2"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day3">
                    <div class="col-1-4 item" item-name="day3">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day3" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day3/@name}" value="{rows/content/filter/value/day3}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day3"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day4">
                    <div class="col-1-4 item" item-name="day4">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day4" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day4/@name}" value="{rows/content/filter/value/day4}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day4"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day5">
                    <div class="col-1-4 item" item-name="day5">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day5" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day5/@name}" value="{rows/content/filter/value/day5}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day5"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day6">
                    <div class="col-1-4 item" item-name="day6">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day6" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day6/@name}" value="{rows/content/filter/value/day6}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day6"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/day7">
                    <div class="col-1-4 item" item-name="day7">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/day7" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/day7/@name}" value="{rows/content/filter/value/day7}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/day7"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/title">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/title"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/description">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/description"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/start_date">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/start_date"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/end_date">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/end_date"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/location">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/location"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/day">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/day"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/day_week">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/day_week"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/status">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/status"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/categroy">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/categroy"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/page_id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/page_id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/view_page">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/view_page"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/ver_mais">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/ver_mais"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="" data-row="{position()}" data-title="{../../label/id}" class="text">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="title">
                              <td align="" data-row="{position()}" data-title="{../../label/title}" class="text">
                                <xsl:value-of select="title"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="description">
                              <td align="" data-row="{position()}" data-title="{../../label/description}" class="text">
                                <xsl:value-of select="description"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="start_date">
                              <td align="" data-row="{position()}" data-title="{../../label/start_date}" class="text">
                                <xsl:value-of select="start_date"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="end_date">
                              <td align="" data-row="{position()}" data-title="{../../label/end_date}" class="text">
                                <xsl:value-of select="end_date"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="location">
                              <td align="" data-row="{position()}" data-title="{../../label/location}" class="text">
                                <xsl:value-of select="location"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="day">
                              <td align="" data-row="{position()}" data-title="{../../label/day}" class="text">
                                <xsl:value-of select="day"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="day_week">
                              <td align="" data-row="{position()}" data-title="{../../label/day_week}" class="text">
                                <xsl:value-of select="day_week"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="status">
                              <td align="" data-row="{position()}" data-title="{../../label/status}" class="text">
                                <xsl:value-of select="status"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="categroy">
                              <td align="" data-row="{position()}" data-title="{../../label/categroy}" class="text">
                                <xsl:value-of select="categroy"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="page_id">
                              <td align="" data-row="{position()}" data-title="{../../label/page_id}" class="text">
                                <xsl:value-of select="page_id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="view_page">
                              <td align="" data-row="{position()}" data-title="{../../label/view_page}" class="text">
                                <xsl:value-of select="view_page"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="ver_mais">
                              <td align="" data-row="{position()}" data-title="{../../label/ver_mais}" class="text">
                                <xsl:value-of select="ver_mais"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
