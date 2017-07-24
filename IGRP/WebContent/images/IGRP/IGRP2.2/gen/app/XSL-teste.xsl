<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  </xsl:output>
  <xsl:template match="/">
    <html>
    <head>
    <xsl:call-template name="home-header">
    </xsl:call-template>
    </head>
    <body class="bodyColor">
    <div class="IGRP_overlay"></div>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main">
    </xsl:call-template>
    <!--HOME-->
    <div id="igrp-bodyPage"><!--HOME LEFT-->
      <xsl:if test="not(rows/target) or rows/target!='_blank'">
        <!--MENU-->
        <div class="bodyPageLeft">
          <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)">
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <!--HOME RIGTH-->
      <div id="igrp-bodyPage"><!--HOME LEFT-->
      <xsl:if test="not(rows/target) or rows/target!='_blank'">
        <!--MENU-->
        <div class="bodyPageLeft">
          <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)">
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <!--HOME RIGTH-->
      <div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE -->
        <div class="box-head showTabMobile"><xsl:value-of select="rows/content/title"></xsl:value-of></div>
        <!-- SHOW NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages">
        </xsl:apply-templates>
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
          <!-- SHOW HIDDEN-->
          <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value">
          </xsl:apply-templates>
          <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
          </xsl:apply-templates>
          <!-- START FILTER-->
          <div class="box-content resetPadding">
            <div class="col">
              <xsl:if test="rows/content/filter/label/idade">
                <div class="col-1-4 item" item-name="idade">
                  <div class="igrp_item number"> <a id="idp_idade"></a>
                    <label><xsl:value-of select="rows/content/filter/label/idade" disable-output-escaping="yes"></xsl:value-of></label>
                    <input type="number" name="{rows/content/filter/value/idade/@name}" value="{rows/content/filter/value/idade}" class="number IGRP_change" maxlength="30" />
                    <div class="_clear"></div>
                  </div>
                  <div class="_clear"></div>
                </div>
              </xsl:if>
              <xsl:if test="rows/content/filter/label/nome">
                <div class="col-1-4 item" item-name="nome">
                  <div class="igrp_item text"> <a id="idp_nome"></a>
                    <label><xsl:value-of select="rows/content/filter/label/nome" disable-output-escaping="yes"></xsl:value-of></label>
                    <input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}" class="text IGRP_change" maxlength="30" />
                    <div class="_clear"></div>
                  </div>
                  <div class="_clear"></div>
                </div>
              </xsl:if>
              <xsl:if test="rows/content/filter/label/sexo">
                <div class="col-1-4 item" item-name="sexo">
                  <div class="igrp_item select"> <a id="idp_sexo"></a>
                    <label><xsl:value-of select="rows/content/filter/label/sexo" disable-output-escaping="yes"></xsl:value-of></label>
                    <select name="{rows/content/filter/list/sexo/@name}" chosen="select" data-placeholder="{rows/content/filter/list/sexo/option[position() = 1]}" class="select IGRP_change">
                      <option value=""></option>
                      <option value="{value}"> selected </option>
                    </select>
                    <div class="_clear"></div>
                  </div>
                  <div class="_clear"></div>
                </div>
              </xsl:if>
              <div class="_clear"></div>
            </div>
            <!--START TOOL BAR FILTER-->
            <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar">
            </xsl:apply-templates>
            <!--END TOOL BAR FILTER--></div>
          <!-- END FILTER-->
        </form>
        <!-- END YOUR CODE HERE -->
        <div class="_clear"></div>
      </div>
      <div class="_clear"></div>
    </div>
      <div class="_clear"></div>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage">
      <xsl:call-template name="footer">
      </xsl:call-template>
    </div>
    </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1">
  </xsl:include>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1">
  </xsl:include>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=1">
  </xsl:include>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1">
  </xsl:include>
   <xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=1">
  </xsl:include>
  <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=1">
  </xsl:include>
</xsl:stylesheet>