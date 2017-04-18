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
                <xsl:if test="rows/content/form/label/data_inicio">
                  <div class="col-1-4 item" item-name="data_inicio">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_inicio) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/hora">
                  <div class="col-1-4 item" item-name="hora">
                    <div class="igrp_item hora">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/hora) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/hora" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/hora" disable-output-escaping="yes"/>
                      </label>
                      <input type="hora" name="{rows/content/form/value/hora/@name}" value="{rows/content/form/value/hora}" class="hora required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/hora"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/associar_caso_teste">
                  <div class="box-content resetPadding" sep-name="associar_caso_teste">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/associar_caso_teste"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/associar_caso_teste/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" item-name="add-associar_caso_teste">
                          <div class="addRowFormlist addRow">
                            <a rel="associar_caso_teste" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_associar_caso_teste" data-control="data-associar_caso_teste">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/associar_caso_teste/label/caso_teste">
                                <xsl:if test="not(rows/content/form/table/associar_caso_teste/label/caso_teste/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/associar_caso_teste/label/caso_teste" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/associar_caso_teste/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/associar_caso_teste/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/associar_caso_teste/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" item-name="add-associar_caso_teste" rel="associar_caso_teste" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/associar_caso_teste/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="caso_teste">
                                  <xsl:if test="not(caso_teste/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/caso_teste}" class="text">
                                      <input type="hidden" name="p_caso_teste_fk_desc" value="{caso_teste_desc}"/>
                                      <xsl:value-of select="caso_teste_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_caso_teste_fk" value="{caso_teste}"/>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-associar_caso_teste">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="associar_caso_teste" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-associar_caso_teste" class="IGRP_delRow" rel="associar_caso_teste"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_associar_caso_teste_id" value="{associar_caso_teste_id}"/>
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
