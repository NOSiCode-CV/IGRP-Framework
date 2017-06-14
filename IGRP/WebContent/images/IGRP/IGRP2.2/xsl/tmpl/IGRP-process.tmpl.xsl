<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="process-map">
    <xsl:param name="no" select="rows/content/menus"/>
    <!--listagem do mapa de processo usando template recursividade em 3 bloco o primeiro bloco imprime inicialmente o primerio no do xml incrementando em 3 o segundo bloco inicia em 2, e o terceiro bloco em 3 usando a mesma logica do primeiro bloco-->
    <div class="col showDesktop">
      <div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="1"/>
              <xsl:with-param name="no" select="$no"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
      <div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="2"/>
              <xsl:with-param name="no" select="$no"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
      <div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="3"/>
              <xsl:with-param name="no" select="$no"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
      <div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="4"/>
              <xsl:with-param name="no" select="$no"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
    </div>
    <div class="col showTablet">
    	<div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="1"/>
              <xsl:with-param name="no" select="$no"/>
              <xsl:with-param name="itemPos" select="2"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
      <div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="2"/>
              <xsl:with-param name="no" select="$no"/>
              <xsl:with-param name="itemPos" select="2"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
    </div>
    <div class="col showMobile">
    	<div class="col-1-4">
      	<div class="box-process">
            <xsl:call-template name="process-name">
              <xsl:with-param name="pos" select="1"/>
              <xsl:with-param name="no" select="$no"/>
              <xsl:with-param name="itemPos" select="1"/>
            </xsl:call-template>
            <div class="_clear"/>
        </div>
      </div>
    </div>
  </xsl:template>
  
  <!--Recursividade para listagem dos mapa de processo encrementando 3 em 3-->
  <xsl:template name="process-name">
    <xsl:param name="pos" select="1"/>
    <xsl:param name="itemPos" select="4"/>
    <xsl:param name="no" select="rows/content/menus"/>
    <xsl:variable name="cont" select="count($no)"/>
    <!--guarda quantidade de no que temos no xml-->
    <xsl:if test="$pos &lt;= $cont">
      <!--verifica si o nosso variavel nao e maior do que quantidade-->
      <xsl:for-each select="$no[position()=$pos]">
        <!--fazer seleccao dos elementos na posicao exato-->
        <div class="col divBorder addMarginBottom20">
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="title" />
          </xsl:call-template>
          <!--inicio menu interior-->
          <xsl:for-each select="menu">
            <ul id="menu-{$pos}{position()}" class="process_menu">
              <li><a><xsl:value-of select="title"/></a>
                <ul class="bodyColor">
                  <xsl:for-each select="submenu">
                    <li><a href="{link}"><xsl:value-of select="title"/></a></li>
                  </xsl:for-each>
                </ul>
              </li>
            </ul>
          </xsl:for-each >
          <!--fim menu interior-->
          <div class="_clear"/>
        </div>
      </xsl:for-each>
      <!--aplicando recursividade chamando o mesmo template usando o posicao actual($pos) + item por posicao ($itemPos) -->
      <xsl:call-template name="process-name">
        <xsl:with-param name="pos" select="$pos + $itemPos"/>
        <xsl:with-param name="itemPos" select="$itemPos"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  <!-- Fluxo Processo em uso-->
  <xsl:template mode="process-flow" name="process-flow" match="table">
    <xsl:if test="count(value/row) &gt; 0">
    	<div class="col">
      	<ul class="process-flow">
          	<xsl:for-each select="value/row">
              	<li class="{type}">
                  	<xsl:if test="position() = last()">
                      	<xsl:attribute name="rel">end</xsl:attribute>
                      </xsl:if>
                  	<a href="{link}">
                          <span class="dot"><span class="stp_num">
                          	<xsl:choose>
                              	<xsl:when test="type = 'proc_end' or type = 'proc_start'">
                                  	<div class="showDesktop"><xsl:value-of select="title"/></div>
                                  </xsl:when>
                                  <xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise>
                              </xsl:choose>
                          </span>
                          <xsl:if test="position() != last()"><span class="stp_bar"></span></xsl:if></span>
                          <span class="stp_label">
                          	<xsl:if test="type = 'proc_end' or type = 'proc_start'">
                              	<xsl:attribute name="rel">proc</xsl:attribute>
                              </xsl:if>
                          <xsl:value-of select="title"/></span>
                          <xsl:choose>
                          	<xsl:when test="type = 'proc_end' or type = 'proc_start'">
                              	<xsl:if test="string-length(title) &gt; 10"><em><xsl:value-of select="title"/></em></xsl:if>
                              </xsl:when>
                              <xsl:otherwise>
                              	<xsl:if test="string-length(title) &gt; 19"><em><xsl:value-of select="title"/></em></xsl:if>
                              </xsl:otherwise>
                          </xsl:choose>
                      </a>
                  </li>
              </xsl:for-each>
              <div class="_clear"/>
          </ul>
      	<div class="_clear"/>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>