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
                <xsl:if test="rows/content/form/label/lista">
                  <div class="box-content resetPadding" sep-name="lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/lista/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" item-name="add-lista">
                          <div class="addRowFormlist addRow">
                            <a rel="lista" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_lista" data-control="data-lista">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista/label/lingua">
                                <xsl:if test="not(rows/content/form/table/lista/label/lingua/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/lingua" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col1">
                                <xsl:if test="not(rows/content/form/table/lista/label/col1/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col1" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col2">
                                <xsl:if test="not(rows/content/form/table/lista/label/col2/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col2" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col3">
                                <xsl:if test="not(rows/content/form/table/lista/label/col3/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col3" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col4">
                                <xsl:if test="not(rows/content/form/table/lista/label/col4/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col4" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col5">
                                <xsl:if test="not(rows/content/form/table/lista/label/col5/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col5" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col6">
                                <xsl:if test="not(rows/content/form/table/lista/label/col6/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col6" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col7">
                                <xsl:if test="not(rows/content/form/table/lista/label/col7/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col7" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col8">
                                <xsl:if test="not(rows/content/form/table/lista/label/col8/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col8" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col9">
                                <xsl:if test="not(rows/content/form/table/lista/label/col9/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col9" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col10">
                                <xsl:if test="not(rows/content/form/table/lista/label/col10/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col10" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col11">
                                <xsl:if test="not(rows/content/form/table/lista/label/col11/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col11" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col12">
                                <xsl:if test="not(rows/content/form/table/lista/label/col12/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col12" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col13">
                                <xsl:if test="not(rows/content/form/table/lista/label/col13/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col13" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col14">
                                <xsl:if test="not(rows/content/form/table/lista/label/col14/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col14" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/col15">
                                <xsl:if test="not(rows/content/form/table/lista/label/col15/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/col15" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/lista/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/lista/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/lista/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" item-name="add-lista" rel="lista" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="lingua">
                                  <xsl:if test="not(lingua/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/lingua}" class="text">
                                      <input type="hidden" name="p_lingua_fk_desc" value="{lingua_desc}"/>
                                      <xsl:value-of select="lingua_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_lingua_fk" value="{lingua}"/>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-lista">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="lista" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col1">
                                  <xsl:if test="not(col1/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col1}" class="texteditor">
                                      <input type="hidden" name="p_col1_fk_desc" value="{col1_desc}"/>
                                      <input type="texteditor" name="{../../label/col1/@name}_fk" value="{col1}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col1"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col2">
                                  <xsl:if test="not(col2/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col2}" class="texteditor">
                                      <input type="hidden" name="p_col2_fk_desc" value="{col2_desc}"/>
                                      <input type="texteditor" name="{../../label/col2/@name}_fk" value="{col2}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col2"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col3">
                                  <xsl:if test="not(col3/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col3}" class="texteditor">
                                      <input type="hidden" name="p_col3_fk_desc" value="{col3_desc}"/>
                                      <input type="texteditor" name="{../../label/col3/@name}_fk" value="{col3}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col3"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col4">
                                  <xsl:if test="not(col4/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col4}" class="texteditor">
                                      <input type="hidden" name="p_col4_fk_desc" value="{col4_desc}"/>
                                      <input type="texteditor" name="{../../label/col4/@name}_fk" value="{col4}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col4"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col5">
                                  <xsl:if test="not(col5/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col5}" class="texteditor">
                                      <input type="hidden" name="p_col5_fk_desc" value="{col5_desc}"/>
                                      <input type="texteditor" name="{../../label/col5/@name}_fk" value="{col5}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col5"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col6">
                                  <xsl:if test="not(col6/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col6}" class="texteditor">
                                      <input type="hidden" name="p_col6_fk_desc" value="{col6_desc}"/>
                                      <input type="texteditor" name="{../../label/col6/@name}_fk" value="{col6}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col6"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col7">
                                  <xsl:if test="not(col7/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col7}" class="texteditor">
                                      <input type="hidden" name="p_col7_fk_desc" value="{col7_desc}"/>
                                      <input type="texteditor" name="{../../label/col7/@name}_fk" value="{col7}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col7"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col8">
                                  <xsl:if test="not(col8/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col8}" class="texteditor">
                                      <input type="hidden" name="p_col8_fk_desc" value="{col8_desc}"/>
                                      <input type="texteditor" name="{../../label/col8/@name}_fk" value="{col8}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col8"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col9">
                                  <xsl:if test="not(col9/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col9}" class="texteditor">
                                      <input type="hidden" name="p_col9_fk_desc" value="{col9_desc}"/>
                                      <input type="texteditor" name="{../../label/col9/@name}_fk" value="{col9}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col9"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col10">
                                  <xsl:if test="not(col10/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col10}" class="texteditor">
                                      <input type="hidden" name="p_col10_fk_desc" value="{col10_desc}"/>
                                      <input type="texteditor" name="{../../label/col10/@name}_fk" value="{col10}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col10"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col11">
                                  <xsl:if test="not(col11/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col11}" class="texteditor">
                                      <input type="hidden" name="p_col11_fk_desc" value="{col11_desc}"/>
                                      <input type="texteditor" name="{../../label/col11/@name}_fk" value="{col11}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col11"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col12">
                                  <xsl:if test="not(col12/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col12}" class="texteditor">
                                      <input type="hidden" name="p_col12_fk_desc" value="{col12_desc}"/>
                                      <input type="texteditor" name="{../../label/col12/@name}_fk" value="{col12}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col12"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col13">
                                  <xsl:if test="not(col13/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col13}" class="texteditor">
                                      <input type="hidden" name="p_col13_fk_desc" value="{col13_desc}"/>
                                      <input type="texteditor" name="{../../label/col13/@name}_fk" value="{col13}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col13"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col14">
                                  <xsl:if test="not(col14/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col14}" class="texteditor">
                                      <input type="hidden" name="p_col14_fk_desc" value="{col14_desc}"/>
                                      <input type="texteditor" name="{../../label/col14/@name}_fk" value="{col14}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col14"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="col15">
                                  <xsl:if test="not(col15/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/col15}" class="texteditor">
                                      <input type="hidden" name="p_col15_fk_desc" value="{col15_desc}"/>
                                      <input type="texteditor" name="{../../label/col15/@name}_fk" value="{col15}" class="texteditor" maxlength="100" rel="F_lista">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/col15"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-lista" class="IGRP_delRow" rel="lista"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_lista_id" value="{lista_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20150609"/>
</xsl:stylesheet>
