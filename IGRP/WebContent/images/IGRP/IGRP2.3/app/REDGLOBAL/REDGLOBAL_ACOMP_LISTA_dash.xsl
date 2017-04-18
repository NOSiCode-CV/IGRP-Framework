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
                  <xsl:if test="rows/content/filter/label/code">
                    <div class="col-1-4 item" item-name="code">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/code" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/code/@name}" value="{rows/content/filter/value/code}" class="text" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/code"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/req_name">
                    <div class="col-1-4 item" item-name="req_name">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/req_name" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/req_name/@name}" value="{rows/content/filter/value/req_name}" class="text" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/req_name"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/req_doc_type">
                    <div class="col-1-4 item" item-name="req_doc_type">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/req_doc_type" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/req_doc_type/@name}" chosen="select" data-placeholder="{rows/content/filter/list/req_doc_type/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/req_doc_type"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/req_doc_type/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/req_doc_number">
                    <div class="col-1-4 item" item-name="req_doc_number">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/req_doc_number" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/req_doc_number/@name}" value="{rows/content/filter/value/req_doc_number}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/req_doc_number"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/req_contra_prova">
                    <div class="col-1-4 item" item-name="req_contra_prova">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/req_contra_prova" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/req_contra_prova/@name}" value="{rows/content/filter/value/req_contra_prova}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/req_contra_prova"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/id_process">
                    <div class="col-1-4 item" item-name="id_process">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/id_process" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/id_process/@name}" value="{rows/content/filter/value/id_process}" class="text" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/id_process"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/dt_reg_de">
                    <div class="col-1-4 item" item-name="dt_reg_de">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/dt_reg_de" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/dt_reg_de/@name}" value="{rows/content/filter/value/dt_reg_de}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/dt_reg_de"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/dt_reg_ate">
                    <div class="col-1-4 item" item-name="dt_reg_ate">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/dt_reg_ate" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/dt_reg_ate/@name}" value="{rows/content/filter/value/dt_reg_ate}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/dt_reg_ate"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
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
                          <xsl:if test="rows/content/table/label/code">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/code"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_reg">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/dt_reg"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/req_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/req_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/req_doc_type">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/req_doc_type"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/req_doc_number">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/req_doc_number"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id_process">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/id_process"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/req_contra_prova">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/req_contra_prova"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="code">
                              <td align="center" data-row="{position()}" data-title="{../../label/code}" class="number">
                                <xsl:value-of select="code"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_reg">
                              <td align="center" data-row="{position()}" data-title="{../../label/dt_reg}" class="date">
                                <xsl:value-of select="dt_reg"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="req_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/req_name}" class="text">
                                <xsl:value-of select="req_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="req_doc_type">
                              <td align="left" data-row="{position()}" data-title="{../../label/req_doc_type}" class="text">
                                <xsl:value-of select="req_doc_type"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="req_doc_number">
                              <td align="left" data-row="{position()}" data-title="{../../label/req_doc_number}" class="text">
                                <xsl:value-of select="req_doc_number"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id_process">
                              <td align="center" data-row="{position()}" data-title="{../../label/id_process}" class="number">
                                <xsl:value-of select="id_process"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="req_contra_prova">
                              <td align="left" data-row="{position()}" data-title="{../../label/req_contra_prova}" class="text">
                                <xsl:value-of select="req_contra_prova"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
