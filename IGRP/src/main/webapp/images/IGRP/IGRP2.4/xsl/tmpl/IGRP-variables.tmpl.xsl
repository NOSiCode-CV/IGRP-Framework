<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Bootstrap Version -->
  <xsl:variable name="bs-v" select="'3.4.1'"/>

  <!-- jQuery Version -->
  <xsl:variable name="jq-v" select="'3.4.1'"/>

  <!-- target is blank? popup -->
  <xsl:variable name="hasMenu">
    <xsl:choose>
      <xsl:when test="rows/target = '_blank'">false</xsl:when>
      <xsl:otherwise>true</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- body class -->
  <xsl:variable name="bodyClass">
    <xsl:choose>
      <xsl:when test="$hasMenu = 'true'">fixed-nav</xsl:when>
      <xsl:otherwise>fluid</xsl:otherwise>
    </xsl:choose>
     loading
  </xsl:variable>
  <!--/body class -->

  <!-- igrp path -->
  <xsl:variable name="path">
    <xsl:choose>
      <xsl:when test="/rows/link_img">
        <xsl:value-of select="/rows/link_img" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>/IGRP/images/IGRP/IGRP2.4</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!--/igrp path -->


  <xsl:variable name="locale">
    <xsl:choose>
      <xsl:when test="//rows/content/@locale">
        <xsl:value-of select="//rows/content/@locale"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>pt</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="locale-file-path" select="concat($path,'/xml/locale/',$locale,'.xml')"></xsl:variable>

  <xsl:variable name="locale-strings" select="document( $locale-file-path )/root"/>

  <!-- version -->
  <xsl:variable name="version">
    <xsl:choose>
      <xsl:when test="rows/version">
        <xsl:value-of select="rows/version"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'01'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- /version -->

  <!-- version -->
  <xsl:variable name="ispublic">
    <xsl:choose>
      <xsl:when test="rows/ispublic">
        <xsl:value-of select="rows/ispublic"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- /version -->


  <!-- recaptcha -->
  <xsl:variable name="recaptchakey">
    <xsl:choose>
      <xsl:when test="rows/recaptchakey != ''">
        <xsl:value-of select="rows/recaptchakey"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'6Le4FBkaAAAAAD-mFUvQjntM75J6_b1SyrxAXAPk'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="secretrecaptchakey">
    <xsl:choose>
      <xsl:when test="rows/secretrecaptchakey != ''">
        <xsl:value-of select="rows/secretrecaptchakey"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'6Le4FBkaAAAAAPkh7IsPExeSEvIpfBGWbfOhJSOn'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- /recaptcha -->


  <!-- fixed labels -->
  <xsl:variable name="labels" select="document(concat($path,'/core/igrp/labels/igrp.labels.pt.xml'))/labels"/>
  <!-- /fixed labels -->


  <xsl:variable name="defined-template" >
    <xsl:choose>
      <xsl:when test="rows/template and rows/template != ''">
        <xsl:value-of select="rows/template"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>default</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- app theme -->
  <xsl:variable name="theme" select="concat('/themes/',$defined-template)"/>
  <!--/app theme -->

  <!-- default theme path-->
  <xsl:variable name="themePathDefault" select="concat($path,'/themes/default')"/>
  <!-- /default theme path-->

  <!-- config theme file-->
  <xsl:variable name="themeConfigPath" select="concat($path,'/themes/',$defined-template,'/config.xml')"/>
  <!--/config theme file-->

  <!-- theme config data-->
  <xsl:variable name="themeConfigData" select="document($themeConfigPath)/style"/>
  <!--/theme config data-->

  <!-- theme path-->
  <xsl:variable name="themePath">
    <xsl:choose>
      <xsl:when test="$themeConfigData/@base and $themeConfigData/@base != ''">
        <xsl:value-of select="concat($path,'/themes/',$themeConfigData/@base)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($path,'/themes/',$defined-template)"/>
      </xsl:otherwise>
    </xsl:choose>

  <!--  select="concat($path,$theme)" -->
  </xsl:variable>
  <!--/theme path-->

  <xsl:variable name="palettesXMLPath" select="concat($path,'/core/colorpalettes/palettes.xml')"/>

  <xsl:variable name="palettesXML" select="document($palettesXMLPath)/palettes/color"/>


</xsl:stylesheet>
