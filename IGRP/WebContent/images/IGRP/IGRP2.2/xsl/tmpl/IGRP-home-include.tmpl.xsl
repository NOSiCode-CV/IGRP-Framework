<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--declaração de variavel global que guarda diretorio do Frameworks-->
  <xsl:variable name="path">
      <xsl:choose>
        <!--caso exista um caminho indicado no XML-->
        <xsl:when test="/rows/link_img">
          <xsl:value-of select="/rows/link_img" />
        </xsl:when>
        <!--caminho default-->
        <xsl:otherwise>
          <xsl:text>/images/IGRPLAB2.2</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:variable>
  
  <!--variavel global que guarda qual dos temas vai ser usado indicado no XML -->
  <xsl:variable name="theme">
      <xsl:choose>
        <!--caso exita um tema indicado no XML-->
        <xsl:when test="rows/template">
          <xsl:text>/themes/</xsl:text><xsl:value-of select="rows/template"/>
        </xsl:when>
        <!--tema default-->
        <xsl:otherwise>
          <xsl:text>/themes/default</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:variable>
  
  <!--variavel global que concatena diretorio mais o tema em uso-->
  <xsl:variable name="path_tmpl" select="concat($path,$theme)"/>
  <xsl:variable name="path_tmpl_default" select="concat($path,'/themes/default')"/>
  
  <!--variavel global caminho para fichero xml de linguage-->
  <xsl:variable name="lng">
  	<xsl:choose>
    	<xsl:when test="rows/language"><xsl:value-of select="rows/language/@file"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="concat($path,'/xml/IGRP-language.xml')"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
   <xsl:variable name="lngPath" select="document($lng)/language"/>
  <!--variavel global que guarda versao dos ficheiros usados css/js-->
  <xsl:variable name="version">
      <xsl:choose>
          <!--caso exita um version indicado no XML-->
        <xsl:when test="rows/version">
          <xsl:value-of select="rows/version"/>
        </xsl:when>
        <!--versao default-->
        <xsl:otherwise>
          <xsl:value-of select="'01'"/>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:variable>
  
  
<xsl:template name="home-top-main">
	<xsl:call-template name="dialog-modal"/>
    <xsl:if test="not(rows/target) or rows/target!='_blank'">
    	<xsl:apply-templates mode="home-top" select="rows"/>
    </xsl:if>
</xsl:template>

<xsl:template name="home-slide-menu">
	<xsl:if test="not(rows/target) or rows/target!='_blank'">
        <div class="bodyPageLeft">
            <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"></xsl:apply-templates>
        </div>
    </xsl:if>
</xsl:template>

<xsl:template name="footer">
	<xsl:call-template name="debug"/>
</xsl:template>

<!--TEMPLATE TITLE collapser-->
<xsl:template name="titlecollapser">
	<xsl:param name="title"/>
    <xsl:param name="class"/>
    <div class="titlecollapser {$class}">
    	<span class="title-txt"><xsl:value-of select="$title" disable-output-escaping="yes"/></span>
    	<div class="iconcollapser"></div>
    </div>
</xsl:template>


<xsl:template name="page-title">
	<xsl:param name="title"/>
    <xsl:param name="class"/>
    <div class="box-head {$class}">
    	<xsl:value-of select="$title" disable-output-escaping="yes"/>
    </div>
</xsl:template>
  
<!--TEMPLATE FOR HIDDEN FIELDS-->
<xsl:template mode="form-hidden" match="value"> 
    <xsl:for-each select="hidden">
    	<input type="hidden" name="{@name}" id="{@name}" value="{.}">
        <xsl:if test="@rel">
            <xsl:attribute name="rel">
                <xsl:text>F_</xsl:text><xsl:value-of select="@rel" />
            </xsl:attribute>
        </xsl:if>
        </input>
    </xsl:for-each>
</xsl:template>  

  
<xsl:template mode="hidden-fields" name="hidden-fields" match="*">
  <div gen-id="form-hidden">
  <xsl:for-each select="*[@type='hidden']">
    <input type="hidden" name="{@name}" id="{@name}" value="{value}">
        <xsl:if test="@rel">
            <xsl:attribute name="rel">
                <xsl:text>F_</xsl:text><xsl:value-of select="@rel" />
            </xsl:attribute>
        </xsl:if>
      </input>
  </xsl:for-each>
  </div>
</xsl:template>

<xsl:template mode="tr-hidden-fields" name="tr-hidden-fields" match="*">
  <xsl:variable name="row" select="."/>
   <xsl:for-each select="../../../fields/*[@type='hidden']">
    <xsl:variable name="name" select="name()"/>
    <input type="hidden" name="{@name}" id="{@name}" value="{$row/*[name() = $name]}">
        <xsl:if test="@rel">
            <xsl:attribute name="rel">
                <xsl:text>F_</xsl:text><xsl:value-of select="@rel" />
            </xsl:attribute>
        </xsl:if>
      </input>
  </xsl:for-each>
</xsl:template>

<xsl:template name="checkORradioList">
  <xsl:param name="filds"/>
  <xsl:param name="fildsOption"/>
  <xsl:param name="type" select="'radio'"/>
  <xsl:param name="required"/>
  <xsl:param name="disabled"/>
  <xsl:param name="separator"/>
  <xsl:param name="change"/>

  <xsl:variable name="option" select="count($fildsOption)"/>
  <xsl:variable name="localName" select="local-name($filds)"/>
  <xsl:variable name="colFild">
    <xsl:choose>
      <xsl:when test="$option > 9">col</xsl:when>
      <xsl:when test="$option > 6 and $option &lt;= 9">col-2-3</xsl:when>
      <xsl:when test="$option > 3 and $option &lt;= 6">col-1-2</xsl:when>
      <xsl:otherwise>col-1-4</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="colOption">
    <xsl:choose>
      <xsl:when test="$option > 12">col-1-5</xsl:when>
      <xsl:when test="$option > 9 and $option &lt;= 12">col-1-4</xsl:when>
      <xsl:when test="$option > 6 and $option &lt;= 9">col-1-3</xsl:when>
      <xsl:when test="$option > 3 and $option &lt;= 6">col-1-2</xsl:when>
      <xsl:otherwise>col</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:if test="$filds">
    <div class="{$colFild} item" item-name="{$localName}">
      <div class="igrp_item {$type}list">
        <label>
          <xsl:if test="string-length($filds) > 45">
            <xsl:attribute name="title">
              <xsl:value-of select="$filds" disable-output-escaping="yes"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="$required != ''">
            <span class="riquired">*</span>
          </xsl:if>
          <xsl:value-of select="$filds" disable-output-escaping="yes"/>
        </label>
        <xsl:for-each select="$fildsOption">
          <div class="{$colOption}">
            <input type="{$type}" name="{../@name}" value="{value}" class="{$type}list">
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="$required != '' and $change = ''">
                    <xsl:value-of select="$type"/><xsl:text>list </xsl:text><xsl:value-of select="$required"/>
                  </xsl:when>
                  <xsl:when test="$required = '' and $change != ''">
                    <xsl:value-of select="$type"/><xsl:text>list </xsl:text><xsl:value-of select="$change"/>
                  </xsl:when>
                  <xsl:when test="$required != '' and $change != ''">
                    <xsl:value-of select="$type"/><xsl:text>list </xsl:text><xsl:value-of select="$required"/>
                    <xsl:text> </xsl:text><xsl:value-of select="$change"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$type"/><xsl:text>list </xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>

              <xsl:if test="$separator != ''">
                <xsl:attribute name="rel">F_<xsl:value-of select="$separator"/></xsl:attribute>
              </xsl:if>
              <xsl:if test="$disabled != ''">
                <xsl:attribute name="disabled"><xsl:value-of select="$disabled"/></xsl:attribute>
              </xsl:if>
              <!--<xsl:call-template name="FIELD_validator">
              <xsl:with-param name="field" select="$filds"/>
              </xsl:call-template>-->
              <xsl:if test="@selected='true'">
              <xsl:attribute name="checked">checked</xsl:attribute>
              </xsl:if>
            </input>
            <xsl:value-of select="text" disable-output-escaping="yes"/>
          </div>
        </xsl:for-each>
        <div class="_clear"/>
      </div>
    </div>
  </xsl:if>
</xsl:template>


<!--TEMPLATE FOR A-Z FILTER-->
<xsl:template name="filter-az-loop">
	<xsl:param name="name" select="''" /> 
    <xsl:param name="i" select="0" />
    <xsl:param name="value" select="''" />  
	<xsl:param name="type" select="''"/>
	 
    <xsl:variable name="alpha">
		<xsl:choose>
			<xsl:when test="$type = 'filter_num'">
				<xsl:text>0123456789</xsl:text>
			</xsl:when>
			<xsl:when test="$type = 'filter_aznum'">
				<xsl:text>ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
    
    <xsl:if test="$i &lt;= string-length($alpha)">
    <xsl:variable name="letra" select="substring($alpha,$i,1)" />
   		 <span>
             <a href="{$name}={$letra}" target="filter" class="borderColor bClick">
             	<xsl:if test="$letra=$value">
                	<xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
             	<xsl:value-of select="$letra" />
             </a>
         </span>
         
         <!-- XSL RECURSIVE-->
         <xsl:call-template name="filter-az-loop">
         	<xsl:with-param name="name" select="$name" />
         	<xsl:with-param name="i" select="$i+1" />
            <xsl:with-param name="value" select="$value" />
			<xsl:with-param name="type" select="$type"/>
         </xsl:call-template>
    </xsl:if>
</xsl:template>


<xsl:template name="filter-az">
  <xsl:param name="name" select="''" /> 
  <xsl:param name="value" select="''" />
  <xsl:param name="type" select="'filter_az'"/>
  <xsl:param name="i" select="1" /> 

  <div class="col filterAz borderColor">
      <xsl:call-template name="filter-az-loop">
          <xsl:with-param name="name" select="$name" />
          <xsl:with-param name="i" select="$i" />
          <xsl:with-param name="value" select="$value" />
          <xsl:with-param name="type" select="$type"/>
      </xsl:call-template>
      <div class="_clear"/>
  </div>
</xsl:template>

<xsl:template name="link-opener">
  <div class="link-opener">
    <img src="{$path_tmpl}/img/loading.gif" />
    <div class="opener-close"></div>
    <iframe id="opener-frame"></iframe>
  </div>
</xsl:template>
    
    <!--usado no contexto menu e operacao sobre tabela (total de item a esconder)-->
    <xsl:template name="allCtxHidden">
        <xsl:param name="text"/>
        <xsl:param name="separator" select="','"/>
        <xsl:param name="cont" select="0"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="allCtxHidden">
                	<xsl:with-param name="cont" select="$cont + 1"/>
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$cont"/>
    </xsl:template>
	
    <!--retorna o item a esconder-->
   <xsl:template name="split">
  	<xsl:param name="vText"/>
    <xsl:param name="ctx"/>
   	<xsl:param name="item"/>
    <xsl:param name="pos" select="0"/>
    <xsl:param name="separator" select="','"/>
    <xsl:if test="$vText != ''">
        <xsl:choose>
            <xsl:when test="contains($vText, $separator)">
                <xsl:variable name="ctxAfter" select="substring-after($vText, $separator)"/>
                <xsl:variable name="ctxBefore" select="substring-before($vText, $separator)"/>
                <xsl:if test="$pos &lt; $item">
                    <xsl:choose>
                    	<xsl:when test="$ctx = $ctxBefore"><xsl:value-of select="$ctx"/></xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="split">
                                <xsl:with-param name="vText" select="$ctxAfter"/>
                                <xsl:with-param name="ctx" select="$ctx"/>
                                <xsl:with-param name="item" select="$item"/>
                                <xsl:with-param name="pos" select="$pos + 1"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$vText"/></xsl:otherwise>
        </xsl:choose>
    </xsl:if>
   </xsl:template>
    
  <!--INCLUDE TEMPLATE FOR HEAD-->
  <xsl:include href="IGRP-home-header.tmpl.xsl?v=1"/>
  <!--TEMPLATE FOR 	NAVIGATION-->
  <xsl:include href="IGRP-navigation.tmpl.xsl?v=1"/>
  <!--TEMPLATE FOR MESSAGES-->
  <xsl:include href="IGRP-messages.tmpl.xsl?v=1"/>
  <!--TEMPLATE FOR HOME-TOP-->
  <xsl:include href="IGRP-home-top.tmpl.xsl?v=1"/>
  <!--TEMPLATE FOR TOOLBAR-->
  <xsl:include href="IGRP-toolbar.tmpl.xsl?v=1"/> 
  <!--TEMPLATE FOR DEBUG--> 
  <xsl:include href="IGRP-debug.tmpl.xsl?v=1"/>
  <!--TEMPLATE FOR JSVALIDATION--> 
  <xsl:include href="IGRP-JSvalidation.tmpl.xsl?v=1"/>
</xsl:stylesheet>