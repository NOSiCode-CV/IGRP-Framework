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
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/proc_tp_fk"/>
                <xsl:if test="rows/content/form/label/acti_tp_fk"/>
                <xsl:if test="rows/content/form/label/class_fk"/>
                <xsl:if test="rows/content/form/label/env_fk"/>
                <xsl:if test="rows/content/form/label/processo">
                  <xsl:if test="rows/content/form/label/processo">
                    <div class="col-1-4 item" item-name="processo">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/processo/@name}" value="{rows/content/form/value/processo}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/processo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/etapa">
                  <xsl:if test="rows/content/form/label/etapa">
                    <div class="col-1-4 item" item-name="etapa">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/etapa" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/etapa/@name}" value="{rows/content/form/value/etapa}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/etapa"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/etapa_destino">
                  <xsl:if test="rows/content/form/label/etapa_destino">
                    <div class="col-1-4 item" item-name="etapa_destino">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/etapa_destino" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/etapa_destino/@name}" value="{rows/content/form/value/etapa_destino}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/etapa_destino"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/flag_parallel">
                  <xsl:if test="rows/content/form/label/flag_parallel">
                    <div class="col-1-4 item" item-name="flag_parallel">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/form/value/flag_parallel/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/flag_parallel"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/form/value/flag_parallel='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/form/label/flag_parallel" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/event">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/event"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/acti_tp_to_fk">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/acti_tp_to_fk"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/time_wait">
                            <th align="right">
                              <xsl:value-of select="rows/content/table/label/time_wait"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/msg_to_from">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/msg_to_from"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/signal_sended">
                            <th align="right">
                              <xsl:value-of select="rows/content/table/label/signal_sended"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/eliminar">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_eliminar_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="event">
                              <td align="left" data-row="{position()}" data-title="{../../label/event}" class="text">
                                <xsl:value-of select="event"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="acti_tp_to_fk">
                              <td align="left" data-row="{position()}" data-title="{../../label/acti_tp_to_fk}" class="text">
                                <xsl:value-of select="acti_tp_to_fk"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="time_wait">
                              <td align="right" data-row="{position()}" data-title="{../../label/time_wait}" class="text">
                                <xsl:value-of select="time_wait"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="msg_to_from">
                              <td align="left" data-row="{position()}" data-title="{../../label/msg_to_from}" class="text">
                                <xsl:value-of select="msg_to_from"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="signal_sended">
                              <td align="right" data-row="{position()}" data-title="{../../label/signal_sended}" class="text">
                                <xsl:value-of select="signal_sended"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="eliminar">
                              <td align="right" data-row="{position()}" data-title="{../../label/eliminar}" class="checkbox">
                                <xsl:if test="eliminar != '-0'">
                                  <input type="checkbox" name="p_eliminar" value="{eliminar}">
                                    <xsl:if test="eliminar_check=eliminar">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="eliminar_desc"/>
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
