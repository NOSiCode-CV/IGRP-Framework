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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/descricao">
                  <div class="col-1-4 item" item-name="descricao">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/descricao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}" class="text required" maxlength="400">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/servico">
                  <div class="col-1-4 item" item-name="servico">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/servico) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/servico" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/servico" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/servico/@name}" value="{rows/content/form/value/servico}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/servico"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tempo__total_limite">
                  <div class="col-1-4 item" item-name="tempo__total_limite">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tempo__total_limite) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tempo__total_limite" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tempo__total_limite" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/tempo__total_limite/@name}" value="{rows/content/form/value/tempo__total_limite}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tempo__total_limite"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xml">
                  <div class="col-1-4 item" item-name="xml">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xml) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xml" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xml" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/xml/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xml"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/xml" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR casos--><xsl:if test="rows/content/form/label/casos">
                  <div class="box-content resetPadding" sep-name="casos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/casos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-casos">
                        <xsl:if test="rows/content/form/label/iteracoes">
                          <div class="col-1-4 item" item-name="iteracoes">
                            <div class="igrp_item text">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/iteracoes) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/iteracoes" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/iteracoes" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/iteracoes/@name}" value="{rows/content/form/value/iteracoes}" class="text important" maxlength="30" rel="F_casos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/iteracoes"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tipo_teste">
                          <div class="col-1-4 item" item-name="tipo_teste">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/tipo_teste) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/tipo_teste" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/tipo_teste" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/tipo_teste/@name}" chosen="select" data-placeholder="{rows/content/form/list/tipo_teste/option[position() = 1]}" class="select important" rel="F_casos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo_teste"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/tipo_teste/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/tempo_limite">
                          <div class="col-1-4 item" item-name="tempo_limite">
                            <div class="igrp_item number">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/tempo_limite) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/tempo_limite" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/tempo_limite" disable-output-escaping="yes"/>
                              </label>
                              <input type="number" name="{rows/content/form/value/tempo_limite/@name}" value="{rows/content/form/value/tempo_limite}" class="number" maxlength="30" rel="F_casos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tempo_limite"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/xml_teste">
                          <div class="col-1-4 item" item-name="xml_teste">
                            <div class="igrp_item textarea">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/xml_teste) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/xml_teste" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/xml_teste" disable-output-escaping="yes"/>
                              </label>
                              <textarea name="{rows/content/form/value/xml_teste/@name}" class="textarea important" maxlength="4000" rel="F_casos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/xml_teste"/>
                                </xsl:call-template>
                                <xsl:value-of select="rows/content/form/value/xml_teste" disable-output-escaping="yes"/>
                              </textarea>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'casos'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-casos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-casos" sep-name="btn-casos">
                            <li rel="casos" class="IGRP_editRow operationTable" item-name="edit-casos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="casos" class="IGRP_delRow operationTable" item-name="del-casos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_casos" data-control="data-casos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/casos/label/iteracoes">
                                  <xsl:if test="not(rows/content/form/table/casos/label/iteracoes/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/casos/label/iteracoes" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/casos/label/tipo_teste">
                                  <xsl:if test="not(rows/content/form/table/casos/label/tipo_teste/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/casos/label/tipo_teste" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/casos/label/tempo_limite">
                                  <xsl:if test="not(rows/content/form/table/casos/label/tempo_limite/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/casos/label/tempo_limite" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/casos/label/xml_teste">
                                  <xsl:if test="not(rows/content/form/table/casos/label/xml_teste/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/casos/label/xml_teste" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/casos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="iteracoes">
                                    <xsl:if test="not(iteracoes/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/iteracoes}" class="text">
                                        <xsl:value-of select="iteracoes_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_iteracoes_fk" value="{iteracoes}"/>
                                        <input type="hidden" name="p_iteracoes_fk_desc" value="{iteracoes_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="iteracoes/@visible = 'false'">
                                      <input type="hidden" name="p_iteracoes_fk" value="{iteracoes}"/>
                                      <input type="hidden" name="p_iteracoes_fk_desc" value="{iteracoes_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="tipo_teste">
                                    <xsl:if test="not(tipo_teste/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/tipo_teste}" class="select">
                                        <xsl:value-of select="tipo_teste_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_tipo_teste_fk" value="{tipo_teste}"/>
                                        <input type="hidden" name="p_tipo_teste_fk_desc" value="{tipo_teste_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="tipo_teste/@visible = 'false'">
                                      <input type="hidden" name="p_tipo_teste_fk" value="{tipo_teste}"/>
                                      <input type="hidden" name="p_tipo_teste_fk_desc" value="{tipo_teste_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="tempo_limite">
                                    <xsl:if test="not(tempo_limite/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/tempo_limite}" class="number">
                                        <xsl:value-of select="tempo_limite_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_tempo_limite_fk" value="{tempo_limite}"/>
                                        <input type="hidden" name="p_tempo_limite_fk_desc" value="{tempo_limite_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="tempo_limite/@visible = 'false'">
                                      <input type="hidden" name="p_tempo_limite_fk" value="{tempo_limite}"/>
                                      <input type="hidden" name="p_tempo_limite_fk_desc" value="{tempo_limite_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="xml_teste">
                                    <xsl:if test="not(xml_teste/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/xml_teste}" class="textarea">
                                        <xsl:value-of select="xml_teste_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_xml_teste_fk" value="{xml_teste}"/>
                                        <input type="hidden" name="p_xml_teste_fk_desc" value="{xml_teste_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="xml_teste/@visible = 'false'">
                                      <input type="hidden" name="p_xml_teste_fk" value="{xml_teste}"/>
                                      <input type="hidden" name="p_xml_teste_fk_desc" value="{xml_teste_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-casos" rel="casos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-casos" rel="casos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_casos_id" value="{casos_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150320"/>
</xsl:stylesheet>
