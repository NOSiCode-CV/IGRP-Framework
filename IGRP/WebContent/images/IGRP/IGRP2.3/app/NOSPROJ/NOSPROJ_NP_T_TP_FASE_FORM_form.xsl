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
                <xsl:if test="rows/content/form/label/codigo">
                  <div class="col-1-4 item" item-name="codigo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/codigo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text required" maxlength="20">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
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
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_registo">
                  <div class="col-1-4 item" item-name="dt_registo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_registo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_registo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/dt_registo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/dt_registo/@name}" value="{rows/content/form/value/dt_registo}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/dt_registo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/estado">
                  <div class="col-1-4 item" item-name="estado">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/estado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/estado/@name}" chosen="select" id="{rows/content/form/list/estado/@name}" data-placeholder="{rows/content/form/list/estado/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/estado/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR estados_fase--><xsl:if test="rows/content/form/label/estados_fase">
                  <div class="box-content resetPadding" sep-name="estados_fase">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/estados_fase"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-estados_fase">
                        <xsl:if test="rows/content/form/label/f_id_tpestado">
                          <div class="col-1-4 item" item-name="f_id_tpestado">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/f_id_tpestado) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/f_id_tpestado" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/f_id_tpestado" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/f_id_tpestado/@name}" chosen="select" id="{rows/content/form/list/f_id_tpestado/@name}" data-placeholder="{rows/content/form/list/f_id_tpestado/option[position() = 1]}" class="select important" rel="F_estados_fase">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/f_id_tpestado"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/f_id_tpestado/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/f_estado">
                          <div class="col-1-4 item" item-name="f_estado">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/f_estado) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/f_estado" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/f_estado" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/f_estado/@name}" chosen="select" id="{rows/content/form/list/f_estado/@name}" data-placeholder="{rows/content/form/list/f_estado/option[position() = 1]}" class="select important" rel="F_estados_fase">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/f_estado"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/f_estado/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/nu_ordem">
                          <div class="col-1-4 item" item-name="nu_ordem">
                            <div class="igrp_item text">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/nu_ordem) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/nu_ordem" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/nu_ordem" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/nu_ordem/@name}" value="{rows/content/form/value/nu_ordem}" class="text important" maxlength="30" rel="F_estados_fase">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/nu_ordem"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'estados_fase'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-estados_fase"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-estados_fase" sep-name="btn-estados_fase">
                            <li rel="estados_fase" class="IGRP_editRow operationTable" item-name="edit-estados_fase">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="estados_fase" class="IGRP_delRow operationTable" item-name="del-estados_fase">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_estados_fase" data-control="data-estados_fase">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/estados_fase/label/f_id_tpestado">
                                  <xsl:if test="not(rows/content/form/table/estados_fase/label/f_id_tpestado/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/estados_fase/label/f_id_tpestado" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/estados_fase/label/f_estado">
                                  <xsl:if test="not(rows/content/form/table/estados_fase/label/f_estado/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/estados_fase/label/f_estado" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/estados_fase/label/nu_ordem">
                                  <xsl:if test="not(rows/content/form/table/estados_fase/label/nu_ordem/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/estados_fase/label/nu_ordem" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/estados_fase/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="f_id_tpestado">
                                    <xsl:if test="not(f_id_tpestado/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/f_id_tpestado}" class="select">
                                        <xsl:value-of select="f_id_tpestado_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_f_id_tpestado_fk" value="{f_id_tpestado}"/>
                                        <input type="hidden" name="p_f_id_tpestado_fk_desc" value="{f_id_tpestado_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="f_id_tpestado/@visible = 'false'">
                                      <input type="hidden" name="p_f_id_tpestado_fk" value="{f_id_tpestado}"/>
                                      <input type="hidden" name="p_f_id_tpestado_fk_desc" value="{f_id_tpestado_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="f_estado">
                                    <xsl:if test="not(f_estado/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/f_estado}" class="select">
                                        <xsl:value-of select="f_estado_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_f_estado_fk" value="{f_estado}"/>
                                        <input type="hidden" name="p_f_estado_fk_desc" value="{f_estado_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="f_estado/@visible = 'false'">
                                      <input type="hidden" name="p_f_estado_fk" value="{f_estado}"/>
                                      <input type="hidden" name="p_f_estado_fk_desc" value="{f_estado_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="nu_ordem">
                                    <xsl:if test="not(nu_ordem/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/nu_ordem}" class="text">
                                        <xsl:value-of select="nu_ordem_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_nu_ordem_fk" value="{nu_ordem}"/>
                                        <input type="hidden" name="p_nu_ordem_fk_desc" value="{nu_ordem_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="nu_ordem/@visible = 'false'">
                                      <input type="hidden" name="p_nu_ordem_fk" value="{nu_ordem}"/>
                                      <input type="hidden" name="p_nu_ordem_fk_desc" value="{nu_ordem_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-estados_fase" rel="estados_fase" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-estados_fase" rel="estados_fase" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_estados_fase_id" value="{estados_fase_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
