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
                <xsl:if test="rows/content/form/label/modulo">
                  <xsl:if test="rows/content/form/label/modulo">
                    <div class="col-1-4 item" item-name="modulo">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/modulo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/modulo/@name}" chosen="select" data-placeholder="{rows/content/form/list/modulo/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/modulo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/modulo/option[position() != 1]">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/cod_modulo">
                  <xsl:if test="rows/content/form/label/cod_modulo">
                    <div class="col-1-4 item" item-name="cod_modulo">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/cod_modulo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/cod_modulo/@name}" value="{rows/content/form/value/cod_modulo}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cod_modulo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/cod_pagina">
                  <xsl:if test="rows/content/form/label/cod_pagina">
                    <div class="col-1-4 item" item-name="cod_pagina">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/cod_pagina" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/cod_pagina/@name}" value="{rows/content/form/value/cod_pagina}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cod_pagina"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_pagina">
                  <xsl:if test="rows/content/form/label/nome_pagina">
                    <div class="col-1-4 item" item-name="nome_pagina">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nome_pagina" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome_pagina/@name}" value="{rows/content/form/value/nome_pagina}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_pagina"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_pagina">
                  <xsl:if test="rows/content/form/label/tipo_pagina">
                    <div class="col-1-4 item" item-name="tipo_pagina">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/tipo_pagina" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/tipo_pagina/@name}" chosen="select" data-placeholder="{rows/content/form/list/tipo_pagina/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_pagina"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/tipo_pagina/option[position() != 1]">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/procedimento">
                  <xsl:if test="rows/content/form/label/procedimento">
                    <div class="col-1-4 item" item-name="procedimento">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/procedimento" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/procedimento/@name}" value="{rows/content/form/value/procedimento}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/procedimento"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xsl">
                  <xsl:if test="rows/content/form/label/xsl">
                    <div class="col-1-4 item" item-name="xsl">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/xsl" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/xsl/@name}" value="{rows/content/form/value/xsl}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/xsl"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/menu">
                  <xsl:if test="rows/content/form/label/menu">
                    <div class="col-1-4 item" item-name="menu">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/form/value/menu/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/menu"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/form/value/menu='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/form/label/menu" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/offline">
                  <xsl:if test="rows/content/form/label/offline">
                    <div class="col-1-4 item" item-name="offline">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/form/value/offline/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/offline"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/form/value/offline='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/form/label/offline" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/enviar_internet">
                  <xsl:if test="rows/content/form/label/enviar_internet">
                    <div class="col-1-4 item" item-name="enviar_internet">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/form/value/enviar_internet/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/enviar_internet"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/form/value/enviar_internet='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/form/label/enviar_internet" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <xsl:if test="rows/content/form/label/email">
                    <div class="col-1-4 item" item-name="email">
                      <div class="igrp_item email">
                        <label>
                          <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                        </label>
                        <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/email"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/mensagem">
                  <xsl:if test="rows/content/form/label/mensagem">
                    <div class="col-1-4 item" item-name="mensagem">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/mensagem" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/mensagem/@name}" class="textarea" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/mensagem"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/mensagem" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
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
