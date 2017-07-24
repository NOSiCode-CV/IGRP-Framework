<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="/images/IGRP/xml/IGRP-home-app-top.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:variable name="path">
  <xsl:choose>
    <xsl:when test="/rows/link_img">
      <xsl:value-of select="/rows/link_img" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>/images/IGRP2.2</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  </xsl:variable>
  <!--variavel global que aguarda qual pasta de css vai ser usado vindo do xml -->
  <xsl:variable name="theme">
  <xsl:choose>
    <xsl:when test="rows/template">
      <xsl:text>/themes/</xsl:text><xsl:value-of select="rows/template"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>/themes/default</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  </xsl:variable>
  <xsl:variable name="path_tmpl" select="concat($path,$theme)"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title><xsl:value-of select="rows/title" /></title>
    <script languae="javascript">
            function GoToPage(pUrl)
            {
                top.window.location=pUrl;
            }
        </script>
    </head>
    <body style="margin:0 0 0 0;">
    <div style=" background:#267199; height:45px;webkit-box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
  box-shadow: 3px 3px 5px rgba(0,0,0,0.3);
  border-bottom-color: transparent;">
      <div style="float:left;"> <a href="javascript: GoToPage('{rows/link}')" id="nodi"> <img src="{$path_tmpl}/img/igrp-logo.png" align="absmiddle" style="margin-left:20px;" border="0"/></a> <span style=" color:#fff; font-weight:bold;"> <xsl:value-of select="rows/title" /> </span> </div>
      <div style="width:60%; float:left; text-align:right; background:#267199; padding-top:10px; color:#fff;"> <span style=" font-weight:bold; font-size:12px;"> <xsl:value-of select="rows/site/welcome_note" />, </span><xsl:value-of select="rows/site/user_name" /> </div>
      <div style="float:left; text-align:right;padding-top:12px; padding-left:10px;"> <img src="{$path_tmpl}/img/icon/exit.png" align="absmiddle"/> <span style="color:#fff; font-weight:bold;margin-left:5px;"> <a href="javascript: GoToPage('{rows/site/button/link}')" style="color:#fff; text-decoration:underline; font-size:10px;"><xsl:value-of select="rows/site/button/title" /> </a> </span> </div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>