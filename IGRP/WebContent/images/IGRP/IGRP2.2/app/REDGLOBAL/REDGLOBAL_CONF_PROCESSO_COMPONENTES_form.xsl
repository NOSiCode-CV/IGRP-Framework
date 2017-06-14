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
                <xsl:if test="rows/content/form/label/id"/>
                <xsl:if test="rows/content/form/label/proc_tp_fk">
                  <xsl:if test="rows/content/form/label/proc_tp_fk">
                    <div class="col-1-4 item" item-name="proc_tp_fk">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/proc_tp_fk" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/proc_tp_fk/@name}" value="{rows/content/form/value/proc_tp_fk}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/proc_tp_fk"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/name">
                  <xsl:if test="rows/content/form/label/name">
                    <div class="col-1-4 item" item-name="name">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/name"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR componentes--><xsl:if test="rows/content/form/label/componentes">
                  <div class="box-content resetPadding" list-name="componentes">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/componentes"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_componentes" data-control="data-componentes">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/componentes/label/cp_name">
                                <xsl:if test="not(rows/content/form/table/componentes/label/cp_name/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/componentes/label/cp_name" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/componentes/label/cp_orderby">
                                <xsl:if test="not(rows/content/form/table/componentes/label/cp_orderby/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/componentes/label/cp_orderby" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/componentes/label/cp_sufix">
                                <xsl:if test="not(rows/content/form/table/componentes/label/cp_sufix/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/componentes/label/cp_sufix" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/componentes/label/cp_comp_id">
                                <xsl:if test="not(rows/content/form/table/componentes/label/cp_comp_id/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/componentes/label/cp_comp_id" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/componentes/label/cp_delete">
                                <xsl:if test="not(rows/content/form/table/componentes/label/cp_delete/@visible)">
                                  <th class="checkbox">
                                    <input type="checkbox" name="p_cp_delete_all" class="IGRP_checkall"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/componentes/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="cp_name">
                                  <xsl:if test="not(cp_name/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_name}" class="text">
                                      <xsl:value-of select="cp_name" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_name_fk" value="{cp_name}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_name/@visible = 'false'">
                                    <input type="hidden" name="p_cp_name_fk" value="{cp_name}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="cp_orderby">
                                  <xsl:if test="not(cp_orderby/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_orderby}" class="number">
                                      <xsl:value-of select="cp_orderby" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_orderby_fk" value="{cp_orderby}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_orderby/@visible = 'false'">
                                    <input type="hidden" name="p_cp_orderby_fk" value="{cp_orderby}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="cp_sufix">
                                  <xsl:if test="not(cp_sufix/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_sufix}" class="text">
                                      <xsl:value-of select="cp_sufix" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_sufix_fk" value="{cp_sufix}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_sufix/@visible = 'false'">
                                    <input type="hidden" name="p_cp_sufix_fk" value="{cp_sufix}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="cp_comp_id">
                                  <xsl:if test="not(cp_comp_id/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_comp_id}" class="select">
                                      <xsl:value-of select="cp_comp_id" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_comp_id_fk" value="{cp_comp_id}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_comp_id/@visible = 'false'">
                                    <input type="hidden" name="p_cp_comp_id_fk" value="{cp_comp_id}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="cp_delete">
                                  <xsl:if test="not(cp_delete/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_delete}" class="checkbox">
                                      <xsl:if test="cp_delete != '-0'">
                                        <input type="checkbox" name="p_cp_delete_fk" value="{cp_delete}">
                                          <xsl:if test="cp_delete_check=cp_delete">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                        </input>
                                      </xsl:if>
                                      <xsl:value-of select="cp_delete_desc"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_delete/@visible = 'false'">
                                    <input type="hidden" name="p_cp_delete_fk" value="{cp_delete}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_componentes_id" value="{componentes_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
