<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
  
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

<html lang="en">
<head>
<meta charset="ISO-8859-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="description" content=""/>
<meta name="author" content=""/>
<title><xsl:value-of select="rows/content/title"/></title>
<link media="all" type="text/css" href="{$path}/extensions/login/css/bootstrap.min.css" rel="stylesheet"/>
<!-- Custom CSS -->
<link media="all" type="text/css" href="{$path}/extensions/login/css/full-slider.css" rel="stylesheet"/>
<link media="all" type="text/css" href="{$path}/extensions/login/css/login-form.css" rel="stylesheet"/>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<!-- Full Page Image Background Carousel Header -->
<header id="myCarousel" class="carousel slide">
  <xsl:variable name="banner" select="document(concat($path,'/xml/IGRP-login-banner.xml'))/rows"/>
  <xsl:variable name="version">
  	<xsl:choose>
    	<xsl:when test="$banner/version">
            <xsl:value-of select="$banner/version"/>
        </xsl:when>
        <xsl:otherwise>100</xsl:otherwise>
    </xsl:choose>
  </xsl:variable> 
  <!-- Indicators -->
  <ol class="carousel-indicators">
  	<xsl:for-each select="$banner/content/table/value/row">
    	<xsl:variable name="pos" select="position() - 1"/>
        <xsl:if test="image != ''">
            <li data-target="#myCarousel" data-slide-to="{$pos}">
                <xsl:if test="flag = 1"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
            </li>
        </xsl:if>
    </xsl:for-each>
  </ol>
  <!-- Wrapper for Slides -->
  <div class="carousel-inner">
  	<xsl:for-each select="$banner/content/table/value/row">
    	<xsl:if test="image != ''">
            <div class="item"> 
                <xsl:if test="flag = 1"><xsl:attribute name="class">item active</xsl:attribute></xsl:if>
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url({$path}/extensions/login/img/{image}?v={$version})"></div>
                <div class="carousel-caption">
                    <h5>
                    	<xsl:choose>
                        	<xsl:when test="link != ''"><a href="{link}"><xsl:value-of select="caption"/></a></xsl:when>
                            <xsl:otherwise><xsl:value-of select="caption"/></xsl:otherwise>
                        </xsl:choose>
                    </h5>
                </div>
            </div>
        </xsl:if>
    </xsl:for-each>
  </div>
</header>

<!-- Page Content -->
<div  id="content-holder" class="login-form-container">
	<div class="loginLogo"></div>
    <form action="{rows/content/action}" method="post" id="formular_log" class="login_formular" >
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" />
        <div class="vkbsam filds">
            
        </div>
        <div class="loginarea active">
            <div class="filds">
            	
                <div class="fild">
                    <div class="img user"/>
                    <input type="text" name="{rows/content/form/value/user/@name}" value="{rows/content/form/value/user}" class="login_text-input" placeholder="{rows/content/form/label/user}"/>
                </div>
                <div class="fild">
                    <div class="img pass"/>
                    <input type="password" name="{rows/content/form/value/password/@name}" class="login_text-input" placeholder="{rows/content/form/label/password}" autocomplete="off"/>
                </div>
                <div class="fild">
                    <div class="img chave"/>
                    <input type="number" name="{rows/content/form/value/key_value1/@name}" class="chave" placeholder="{rows/content/form/label/key1}º" autocomplete="off"/>
                    <div class="sep"/>
                    <input type="number" name="{rows/content/form/value/key_value2/@name}" class="chave2" placeholder="{rows/content/form/label/key2}º" autocomplete="off"/>
                    <div class="_clear"/>
                </div>
                <input type="hidden" name="{rows/content/form/value/key1/@name}" value="{rows/content/form/value/key1}"/>
                <input type="hidden" name="{rows/content/form/value/key2/@name}" value="{rows/content/form/value/key2}"/>
                <div class="_clear"/>
                
            </div>
            <div class="filds">
                <div class="fild submit">
                    <input type="submit" name="{rows/content/form/value/button/@name}" class="submit" value="{rows/content/form/label/button}" />
                </div>
                <div class="fild submit">
                    <input type="button" id="activartoken" name="{rows/content/form/value/buttontoken/@name}" class="submit hideItem" value="{rows/content/form/label/buttontoken}"/>
                </div>
                <div class="_clear"/>
            </div>
        </div>
        <input type="hidden" id="samMessage" value="{rows/content/form/value/hidden[@name='p_sam_message']}"/>
    </form>
    <div class="filds footer"><span><xsl:value-of select="rows/content/footer_note"/></span></div>
</div>
<!-- jQuery --> 
<script type="text/javascript" src="{$path}/js/jquery-2.1.1.min.js"></script>

<!-- Bootstrap Core JavaScript --> 
<script src="{$path}/extensions/login/js/bootstrap.min.js"></script>
<script src="{$path}/extensions/nosiSam/js/NosiSAM.js?v={rows/content/version}"></script> 
<script src="{$path}/extensions/nosiSam/js/NosiSAMLogin.js?v={rows/content/version}"></script>
<script type="text/javascript" src="{$path}/js/IGRP.virtualkeyBoard.init.js?v={rows/content/version}"></script> 
<!-- Script to Activate the Carousel --> 
<script type="text/javascript" src="{$path}/extensions/login/js/jqueryLoginActivation.js?v={rows/content/version}"></script>
<!-- VIRTUALKEYBOARD --> 
</body>
</html>
</xsl:template>
<xsl:template name="notif_messages" mode="notif_messages" match="messages">
    <xsl:for-each select="message[@type!='confirm' and @type!='debug']">
        <div class="notification {@type}">
        	<div class="icon"></div>
            <div class="messages"><xsl:value-of select="text()" disable-output-escaping="yes"/></div>
            <div class="close IGRP_notClose"></div>
        </div>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
