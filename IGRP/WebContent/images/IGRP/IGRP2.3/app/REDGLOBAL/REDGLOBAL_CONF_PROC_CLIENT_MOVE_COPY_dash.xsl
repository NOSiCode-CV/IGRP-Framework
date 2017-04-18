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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR processo--><xsl:if test="rows/content/form/label/processo">
                  <div class="box-content resetPadding" list-name="processo">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/processo"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_processo" data-control="data-processo">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/processo/label/processo">
                                <xsl:if test="not(rows/content/form/table/processo/label/processo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/processo/label/processo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/processo/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="processo">
                                  <xsl:if test="not(processo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/processo}" class="text">
                                      <xsl:value-of select="processo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_processo_fk" value="{processo}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="processo/@visible = 'false'">
                                    <input type="hidden" name="p_processo_fk" value="{processo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_processo_id" value="{processo_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR area_subarea_destino--><xsl:if test="rows/content/form/label/area_subarea_destino">
                  <div class="box-content resetPadding" sep-name="area_subarea_destino">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/area_subarea_destino"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START FILTER--><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/area_super_name_desc">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/area_super_name_desc"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/area_name_desc">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/area_name_desc"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/area_fk">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_area_fk_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="area_super_name_desc">
                              <td align="left" data-row="{position()}" data-title="{../../label/area_super_name_desc}" class="text">
                                <xsl:value-of select="area_super_name_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="area_name_desc">
                              <td align="left" data-row="{position()}" data-title="{../../label/area_name_desc}" class="text">
                                <xsl:value-of select="area_name_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="area_fk">
                              <td align="center" data-row="{position()}" data-title="{../../label/area_fk}" class="checkbox">
                                <xsl:if test="area_fk != '-0'">
                                  <input type="checkbox" name="p_area_fk" value="{area_fk}">
                                    <xsl:if test="area_fk_check=area_fk">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="area_fk_desc"/>
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
