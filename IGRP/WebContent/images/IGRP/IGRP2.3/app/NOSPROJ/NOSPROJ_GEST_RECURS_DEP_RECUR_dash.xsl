<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form"><!-- INICIO SEPARADOR departamentos--><xsl:if test="rows/content/form/label/departamentos">
                  <div class="box-content resetPadding" sep-name="departamentos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/departamentos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-departamentos">
                        <xsl:if test="rows/content/form/label/id_depart">
                          <div class="col-1-4 item" item-name="id_depart">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/id_depart) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/id_depart" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/id_depart" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/id_depart/@name}" chosen="select" id="{rows/content/form/list/id_depart/@name}" data-placeholder="{rows/content/form/list/id_depart/option[position() = 1]}" class="select important" rel="F_departamentos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/id_depart"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/id_depart/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/id_funcao">
                          <div class="col-1-4 item" item-name="id_funcao">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/id_funcao) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/id_funcao" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/id_funcao" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/id_funcao/@name}" chosen="select" id="{rows/content/form/list/id_funcao/@name}" data-placeholder="{rows/content/form/list/id_funcao/option[position() = 1]}" class="select important" rel="F_departamentos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/id_funcao"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/id_funcao/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/dt_registo">
                          <div class="col-1-4 item" item-name="dt_registo">
                            <div class="igrp_item date">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/dt_registo) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/dt_registo" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/dt_registo" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input type="text" name="{rows/content/form/value/dt_registo/@name}" value="{rows/content/form/value/dt_registo}" class="date important" trel="IGRP_datePicker" rel="F_departamentos">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/dt_registo"/>
                                  </xsl:call-template>
                                </input>
                                <div class="calendar"/>
                              </div>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dt_fim">
                          <div class="col-1-4 item" item-name="dt_fim">
                            <div class="igrp_item date">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/dt_fim) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/dt_fim" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/dt_fim" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input type="text" name="{rows/content/form/value/dt_fim/@name}" value="{rows/content/form/value/dt_fim}" class="date important" trel="IGRP_datePicker" rel="F_departamentos">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/dt_fim"/>
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
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'departamentos'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-departamentos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-departamentos" sep-name="btn-departamentos">
                            <li rel="departamentos" class="IGRP_editRow operationTable" item-name="edit-departamentos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="departamentos" class="IGRP_delRow operationTable" item-name="del-departamentos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_departamentos" data-control="data-departamentos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/departamentos/label/id_depart">
                                  <xsl:if test="not(rows/content/form/table/departamentos/label/id_depart/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/departamentos/label/id_depart" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/departamentos/label/id_funcao">
                                  <xsl:if test="not(rows/content/form/table/departamentos/label/id_funcao/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/departamentos/label/id_funcao" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/departamentos/label/dt_registo">
                                  <xsl:if test="not(rows/content/form/table/departamentos/label/dt_registo/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/departamentos/label/dt_registo" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/departamentos/label/dt_fim">
                                  <xsl:if test="not(rows/content/form/table/departamentos/label/dt_fim/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/departamentos/label/dt_fim" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/departamentos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="id_depart">
                                    <xsl:if test="not(id_depart/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/id_depart}" class="select">
                                        <xsl:value-of select="id_depart_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_id_depart_fk" value="{id_depart}"/>
                                        <input type="hidden" name="p_id_depart_fk_desc" value="{id_depart_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="id_depart/@visible = 'false'">
                                      <input type="hidden" name="p_id_depart_fk" value="{id_depart}"/>
                                      <input type="hidden" name="p_id_depart_fk_desc" value="{id_depart_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="id_funcao">
                                    <xsl:if test="not(id_funcao/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/id_funcao}" class="select">
                                        <xsl:value-of select="id_funcao_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_id_funcao_fk" value="{id_funcao}"/>
                                        <input type="hidden" name="p_id_funcao_fk_desc" value="{id_funcao_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="id_funcao/@visible = 'false'">
                                      <input type="hidden" name="p_id_funcao_fk" value="{id_funcao}"/>
                                      <input type="hidden" name="p_id_funcao_fk_desc" value="{id_funcao_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="dt_registo">
                                    <xsl:if test="not(dt_registo/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/dt_registo}" class="date">
                                        <xsl:value-of select="dt_registo_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_dt_registo_fk" value="{dt_registo}"/>
                                        <input type="hidden" name="p_dt_registo_fk_desc" value="{dt_registo_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="dt_registo/@visible = 'false'">
                                      <input type="hidden" name="p_dt_registo_fk" value="{dt_registo}"/>
                                      <input type="hidden" name="p_dt_registo_fk_desc" value="{dt_registo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="dt_fim">
                                    <xsl:if test="not(dt_fim/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/dt_fim}" class="date">
                                        <xsl:value-of select="dt_fim_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_dt_fim_fk" value="{dt_fim}"/>
                                        <input type="hidden" name="p_dt_fim_fk_desc" value="{dt_fim_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="dt_fim/@visible = 'false'">
                                      <input type="hidden" name="p_dt_fim_fk" value="{dt_fim}"/>
                                      <input type="hidden" name="p_dt_fim_fk_desc" value="{dt_fim_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-departamentos" rel="departamentos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-departamentos" rel="departamentos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_departamentos_id" value="{departamentos_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
