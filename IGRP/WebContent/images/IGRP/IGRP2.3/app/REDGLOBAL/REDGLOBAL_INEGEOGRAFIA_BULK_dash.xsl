<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <!--XSL Generator (RED/DIM 2015)-->
    <head>
    <!--HOME-HEADER-->
    <xsl:call-template name="home-header"/>
    </head>
    <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    <!--HOME-->
    <div id="igrp-bodyPage"><!--HOME LEFT-->
      <xsl:call-template name="home-slide-menu"/>
      <!--HOME RIGTH-->
      <div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE -->
        <div class="box-head showTabMobile"> <xsl:value-of select="rows/content/title"/> </div>
        <!-- SHOW NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
        
        <xsl:variable name="nivel_saida_only"> 
         <xsl:choose>
                <xsl:when test="rows/content/form/value/cx_nivel_saida_only">
                    <xsl:value-of select="rows/content/form/value/cx_nivel_saida_only" />
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="'0'" />
                </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="link">
            <xsl:value-of select="rows/content/form/value/cx_url" />
            <xsl:text>&amp;p_cx_db=</xsl:text><xsl:value-of select="rows/content/form/value/cx_db" />
            <xsl:text>&amp;p_cx_id=</xsl:text><xsl:value-of select="rows/content/form/value/cx_id" />
            <xsl:text>&amp;p_cx_nome=</xsl:text><xsl:value-of select="rows/content/form/value/cx_nome" />
            <xsl:text>&amp;p_cx_codigo=</xsl:text><xsl:value-of select="rows/content/form/value/cx_codigo" />
            <xsl:text>&amp;p_cx_nivel_saida=</xsl:text><xsl:value-of select="rows/content/form/value/cx_nivel_saida" />
               <xsl:text>&amp;p_cx_nivel_saida_only=</xsl:text><xsl:value-of select="$nivel_saida_only" />                    
             <xsl:text>&amp;p_id=</xsl:text>
        </xsl:variable>
        
        <xsl:variable name="nivel_saida" select="rows/content/form/value/cx_nivel_saida" />
        
          <!-- SHOW HIDDEN-->
           <div class="col box-pesquisa">
           		<ul>
                	<xsl:for-each select="rows/content/table/value/row">
                        <xsl:variable name="add">
                            <xsl:choose>
                                <xsl:when test="nivel_detalhe &gt; 1"><xsl:value-of select="15 * nivel_detalhe"/></xsl:when>
                                <xsl:otherwise>15</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                    	<li class="borderColor">
                        	<xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:choose>
                                <xsl:when test="(($nivel_saida = nivel_detalhe) or (ordem = 1 and $nivel_saida_only=0))">
                                     <a class="bClick item-nivel-1" title="Passa Valor" target="lookup" style="padding-left:{$add}px;">
                                     <xsl:value-of select="nome" /></a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="nivel_detalhe != 0 and $nivel_saida_only=0">
                                        <a class="bClick item-nivel-1pai" title="Passa Valor" target="lookup" style="padding-left:{$add}px;">
                                        	<span class="seta"><xsl:text disable-output-escaping="yes"><![CDATA[&laquo;]]></xsl:text></span>
                                        </a>
                                    </xsl:if>
                                     <a href="{$link}{id}" class="rootLink link"><xsl:value-of select="nome" /></a>
                                </xsl:otherwise>
                            </xsl:choose>
                        </li>
                    </xsl:for-each>
                	<div class="_clear"/>
                </ul>
           		<div class="_clear"/>
           </div>
        
          <!-- END TABELA-->
        <!-- END YOUR CODE HERE -->
        <div class="_clear"/>
      </div>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
    </div>
    </body>
    </html>
  </xsl:template>
  
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150317"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150317"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150317"/>
</xsl:stylesheet>
