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
                <xsl:if test="rows/content/form/label/num_proc">
                  <div class="col-1-4 item" item-name="num_proc">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/num_proc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/num_proc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/num_proc" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/num_proc/@name}" value="{rows/content/form/value/num_proc}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/num_proc"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/cod_proc">
                  <div class="col-1-4 item" item-name="cod_proc">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/cod_proc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/cod_proc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/cod_proc" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/cod_proc/@name}" value="{rows/content/form/value/cod_proc}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/cod_proc"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_processo">
                  <div class="col-1-4 item" item-name="tipo_processo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tipo_processo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tipo_processo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tipo_processo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/tipo_processo/@name}" value="{rows/content/form/value/tipo_processo}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tipo_processo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_criacao">
                  <div class="col-1-4 item" item-name="data_criacao">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_criacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_criacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_criacao" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/data_criacao/@name}" value="{rows/content/form/value/data_criacao}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/data_criacao"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_inicio">
                  <div class="col-1-4 item" item-name="data_inicio">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_inicio) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_fim">
                  <div class="col-1-4 item" item-name="data_fim">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_fim) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_fim" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_fim" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/data_fim/@name}" value="{rows/content/form/value/data_fim}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/data_fim"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_created_name">
                  <div class="col-1-4 item" item-name="user_created_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_created_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_created_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_created_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_created_name/@name}" value="{rows/content/form/value/user_created_name}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_created_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_assign_name">
                  <div class="col-1-4 item" item-name="user_assign_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_assign_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_assign_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_assign_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_assign_name/@name}" value="{rows/content/form/value/user_assign_name}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_assign_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/utilizador_actual">
                  <div class="col-1-4 item" item-name="utilizador_actual">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/utilizador_actual) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/utilizador_actual" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/utilizador_actual" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/utilizador_actual/@name}" value="{rows/content/form/value/utilizador_actual}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/utilizador_actual"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/novo_utilizador_desc">
                  <div class="col-1-4 item" item-name="novo_utilizador_desc">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/novo_utilizador_desc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/novo_utilizador_desc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/novo_utilizador_desc" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/novo_utilizador_desc/@name}" value="{rows/content/form/value/novo_utilizador_desc}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/novo_utilizador_desc"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/novo_utilizador_desc/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/novo_utilizador_desc"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
