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
                <xsl:if test="rows/content/form/label/processo">
                  <div class="col-1-4 item" item-name="processo">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/processo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/processo/@name}" chosen="select" data-placeholder="{rows/content/form/list/processo/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/processo"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/processo/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/etapa">
                  <div class="col-1-4 item" item-name="etapa">
                    <div class="igrp_item selectchange">
                      <a id="idp_etapa"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/etapa) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/etapa" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/etapa" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/etapa/@name}" chosen="select" data-placeholder="{rows/content/form/list/etapa/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/etapa"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/etapa/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina">
                  <div class="col-1-4 item" item-name="pagina">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pagina) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/pagina/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/pagina"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/pagina/option[position() != 1]">
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
                      <select name="{rows/content/form/list/tipo_teste/@name}" chosen="select" data-placeholder="{rows/content/form/list/tipo_teste/option[position() = 1]}" class="select required">
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
                <xsl:if test="rows/content/form/label/descricao">
                  <div class="col-1-4 item" item-name="descricao">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/descricao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/descricao/@name}" class="textarea required" maxlength="199">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/descricao" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/paginas">
                  <div class="box-content resetPadding" sep-name="paginas">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/paginas"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/paginas/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" item-name="add-paginas">
                          <div class="addRowFormlist addRow">
                            <a rel="paginas" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_paginas" data-control="data-paginas">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/paginas/label/campo">
                                <xsl:if test="not(rows/content/form/table/paginas/label/campo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/paginas/label/campo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/paginas/label/tipo">
                                <xsl:if test="not(rows/content/form/table/paginas/label/tipo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/paginas/label/tipo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/paginas/label/aceita_nulo">
                                <xsl:if test="not(rows/content/form/table/paginas/label/aceita_nulo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/paginas/label/aceita_nulo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/paginas/label/padrao_teste">
                                <xsl:if test="not(rows/content/form/table/paginas/label/padrao_teste/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/paginas/label/padrao_teste" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/paginas/label/expressao_regular">
                                <xsl:if test="not(rows/content/form/table/paginas/label/expressao_regular/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/paginas/label/expressao_regular" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/paginas/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/paginas/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/paginas/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" item-name="add-paginas" rel="paginas" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/paginas/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="campo">
                                  <xsl:if test="not(campo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/campo}" class="text">
                                      <input type="hidden" name="p_campo_fk_desc" value="{campo_desc}"/>
                                      <xsl:value-of select="campo_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-paginas">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="paginas" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tipo">
                                  <xsl:if test="not(tipo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tipo}" class="text">
                                      <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                      <xsl:value-of select="tipo_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="aceita_nulo">
                                  <xsl:if test="not(aceita_nulo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/aceita_nulo}" class="text">
                                      <input type="hidden" name="p_aceita_nulo_fk_desc" value="{aceita_nulo_desc}"/>
                                      <xsl:value-of select="aceita_nulo_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_aceita_nulo_fk" value="{aceita_nulo}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="padrao_teste">
                                  <xsl:if test="not(padrao_teste/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/padrao_teste}" class="select">
                                      <input type="hidden" name="p_padrao_teste_fk_desc" value="{padrao_teste_desc}"/>
                                      <select name="{../../../../list/padrao_teste/@name}_fk" chosen="select" data-placeholder="{../../../../list/padrao_teste/option[position() = 1]}" class="select" rel="F_paginas">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/padrao_teste"/>
                                        </xsl:call-template>
                                        <option value=""/>
                                        <xsl:variable name="v_padrao_teste" select="padrao_teste"/>
                                        <xsl:for-each select="../../../../list/padrao_teste/option[position() != 1]">
                                          <option value="{value}">
                                            <xsl:if test="$v_padrao_teste = value">
                                              <xsl:attribute name="selected">selected</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="text"/>
                                          </option>
                                        </xsl:for-each>
                                      </select>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="expressao_regular">
                                  <xsl:if test="not(expressao_regular/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/expressao_regular}" class="select">
                                      <input type="hidden" name="p_expressao_regular_fk_desc" value="{expressao_regular_desc}"/>
                                      <select name="{../../../../list/expressao_regular/@name}_fk" chosen="select" data-placeholder="{../../../../list/expressao_regular/option[position() = 1]}" class="select" rel="F_paginas">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/expressao_regular"/>
                                        </xsl:call-template>
                                        <option value=""/>
                                        <xsl:variable name="v_expressao_regular" select="expressao_regular"/>
                                        <xsl:for-each select="../../../../list/expressao_regular/option[position() != 1]">
                                          <option value="{value}">
                                            <xsl:if test="$v_expressao_regular = value">
                                              <xsl:attribute name="selected">selected</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="text"/>
                                          </option>
                                        </xsl:for-each>
                                      </select>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-paginas" class="IGRP_delRow" rel="paginas"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_paginas_id" value="{paginas_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150320"/>
</xsl:stylesheet>
