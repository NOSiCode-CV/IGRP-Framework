<xsl:stylesheet version="1.0"


	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="igrp-head">
        <meta charset="utf-8" />
        <title><xsl:value-of select="rows/content/title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta content="{rows/content/title}" name="description" />
        <meta content="IGRP" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="{$themePath}/assets/images/favicon.ico"/>

        <script src="{$themePath}/assets/js/layout.js"/>
        <link href="{$themePath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="{$themePath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="{$path}/core/fontawesome/4.7/css/font-awesome.min.css" rel="stylesheet" media="none" onload="if(media!='all')media='all'"/>
        
        <xsl:choose>
            <xsl:when test="$defined-template = 'default' or $defined-template = ''">
                <link href="{$themePath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
            </xsl:when>
            <xsl:otherwise>
                <link href="{$path}/themes/{$defined-template}/css/{$defined-template}.css" rel="stylesheet" type="text/css" />
            </xsl:otherwise>
        </xsl:choose>
        
        <link href="{$themePath}/assets/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link href="{$themePath}/assets/css/igrp.css" rel="stylesheet" type="text/css" />

        <xsl:if test="$themeConfigData">
            <xsl:for-each select="$themeConfigData/css/file">
                <xsl:choose>
                    <xsl:when test="@external = 'true'">
                        <link href="{.}" rel="stylesheet"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <link href="{$path}/themes/{$defined-template}/{.}" rel="stylesheet" media="none" onload="if(media!='all')media='all'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>

        <script>
            var path        = '<xsl:value-of select="$path"/>';
            var ispublic    = '<xsl:value-of select="$ispublic"/>';
            var rekey       = '<xsl:value-of select="$recaptchakey"/>'; 
            var secretrekey = '<xsl:value-of select="$secretrecaptchakey"/>'; 
            var theme_path  = "<xsl:value-of select="$themePath"/>";
        </script>

        <xsl:if test="$ispublic = 1">
            <style>
                .grecaptcha-badge{display:none!important;}
            </style>
            <!-- reCAPTCHA -->
            <script src="https://www.google.com/recaptcha/api.js?render={$recaptchakey}"/>
        </xsl:if>
	</xsl:template>

</xsl:stylesheet>