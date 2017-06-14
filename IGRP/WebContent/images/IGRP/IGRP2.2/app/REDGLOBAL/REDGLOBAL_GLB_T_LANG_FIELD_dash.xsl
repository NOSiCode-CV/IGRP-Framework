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
                <xsl:if test="rows/content/form/label/name">
                  <div class="col-1-4 item" item-name="name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text required" maxlength="300">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/obj_type">
                  <div class="col-1-4 item" item-name="obj_type">
                    <div class="igrp_item text">
                      <a id="idp_obj_type"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/obj_type) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/obj_type" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/obj_type" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/obj_type/@name}" value="{rows/content/form/value/obj_type}" class="text required IGRP_change" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/obj_type"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/env_fk">
                  <div class="col-1-4 item" item-name="env_fk">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/env_fk) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/env_fk/@name}" chosen="select" id="{rows/content/form/list/env_fk/@name}" data-placeholder="{rows/content/form/list/env_fk/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/env_fk"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/env_fk/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR campos_traduzidos--><xsl:if test="rows/content/form/label/campos_traduzidos">
                  <div class="box-content resetPadding" sep-name="campos_traduzidos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/campos_traduzidos"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_campos_traduzidos" data-control="data-campos_traduzidos">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/campos_traduzidos/label/campo">
                                <xsl:if test="not(rows/content/form/table/campos_traduzidos/label/campo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/campos_traduzidos/label/campo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/campos_traduzidos/label/traduzir">
                                <xsl:if test="not(rows/content/form/table/campos_traduzidos/label/traduzir/@visible)">
                                  <th class="checkbox">
                                    <input type="checkbox" name="p_traduzir_all" class="IGRP_checkall"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/campos_traduzidos/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="campo">
                                  <xsl:if test="not(campo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/campo}" class="text">
                                      <xsl:value-of select="campo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="campo/@visible = 'false'">
                                    <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="traduzir">
                                  <xsl:if test="not(traduzir/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/traduzir}" class="checkbox">
                                      <xsl:if test="traduzir != '-0'">
                                        <input type="checkbox" name="p_traduzir_fk" value="{traduzir}">
                                          <xsl:if test="traduzir_check=traduzir">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                        </input>
                                      </xsl:if>
                                      <xsl:value-of select="traduzir_desc"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="traduzir/@visible = 'false'">
                                    <input type="hidden" name="p_traduzir_fk" value="{traduzir}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_campos_traduzidos_id" value="{campos_traduzidos_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150609"/>
</xsl:stylesheet>
