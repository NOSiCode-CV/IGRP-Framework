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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/designacao">
                  <div class="col-1-4 item" item-name="designacao">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/designacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/designacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/designacao" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/designacao/@name}" value="{rows/content/form/value/designacao}" class="text required" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/designacao"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data">
                  <div class="col-1-4 item" item-name="data">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/data" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/responsavel">
                  <div class="col-1-4 item" item-name="responsavel">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/responsavel) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/responsavel" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/responsavel" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/responsavel/@name}" chosen="select" id="{rows/content/form/list/responsavel/@name}" data-placeholder="{rows/content/form/list/responsavel/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/responsavel"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/responsavel/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/classificacao">
                  <div class="col-1-4 item" item-name="classificacao">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/classificacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/classificacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/classificacao" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/classificacao/@name}" chosen="select" id="{rows/content/form/list/classificacao/@name}" data-placeholder="{rows/content/form/list/classificacao/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/classificacao"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/classificacao/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/tarefas">
                  <div class="box-content resetPadding" sep-name="tarefas">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/tarefas"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/tarefas/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" item-name="add-tarefas">
                          <div class="addRowFormlist addRow">
                            <a rel="tarefas" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_tarefas" data-control="data-tarefas">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/tarefas/label/designacao">
                                <xsl:if test="not(rows/content/form/table/tarefas/label/designacao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tarefas/label/designacao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/tarefas/label/data_inicio">
                                <xsl:if test="not(rows/content/form/table/tarefas/label/data_inicio/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tarefas/label/data_inicio" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/tarefas/label/data_fim">
                                <xsl:if test="not(rows/content/form/table/tarefas/label/data_fim/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tarefas/label/data_fim" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/tarefas/label/responsavel">
                                <xsl:if test="not(rows/content/form/table/tarefas/label/responsavel/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tarefas/label/responsavel" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/tarefas/label/peso">
                                <xsl:if test="not(rows/content/form/table/tarefas/label/peso/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tarefas/label/peso" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/tarefas/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/tarefas/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/tarefas/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" item-name="add-tarefas" rel="tarefas" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/tarefas/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="designacao">
                                  <xsl:if test="not(designacao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/designacao}" class="text">
                                      <input type="hidden" name="p_designacao_fk_desc" value="{designacao_desc}"/>
                                      <xsl:value-of select="designacao_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_designacao_fk" value="{designacao}"/>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-tarefas">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="tarefas" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="data_inicio">
                                  <xsl:if test="not(data_inicio/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/data_inicio}" class="text">
                                      <input type="hidden" name="p_data_inicio_fk_desc" value="{data_inicio_desc}"/>
                                      <xsl:value-of select="data_inicio_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_data_inicio_fk" value="{data_inicio}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="data_fim">
                                  <xsl:if test="not(data_fim/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/data_fim}" class="text">
                                      <input type="hidden" name="p_data_fim_fk_desc" value="{data_fim_desc}"/>
                                      <xsl:value-of select="data_fim_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_data_fim_fk" value="{data_fim}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="responsavel">
                                  <xsl:if test="not(responsavel/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/responsavel}" class="text">
                                      <input type="hidden" name="p_responsavel_fk_desc" value="{responsavel_desc}"/>
                                      <xsl:value-of select="responsavel_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_responsavel_fk" value="{responsavel}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="peso">
                                  <xsl:if test="not(peso/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/peso}" class="number">
                                      <input type="hidden" name="p_peso_fk_desc" value="{peso_desc}"/>
                                      <input type="number" name="{../../label/peso/@name}_fk" value="{peso}" class="number" maxlength="30" rel="F_tarefas">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/peso"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-tarefas" class="IGRP_delRow" rel="tarefas"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_tarefas_id" value="{tarefas_id}"/>
                                <input type="hidden" name="p_id_fk" value="{id}"/>
                                <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END FORM LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
