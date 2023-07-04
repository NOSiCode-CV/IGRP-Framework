<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="/images/IGRP/xml/ " -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" omit-xml-declaration="yes" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

  <xsl:template match="/">
   
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>

      <title><xsl:value-of select="rows/title"/></title>
      <script type="text/javascript" src="/images/IGRP/js/jquery.1.8.3.js"></script>
      <script type="text/javascript">
        $(function(){
          function IGRP_hackerIframe(){
            function getChromeVersion () {
              var raw = navigator.userAgent.match(/Chrom(e|ium)\/([0-9]+)\./);
              return raw ? parseInt(raw[2], 10) : false;
            }

            function redrawElement(el,delay){
                el.css('display','none');
                setTimeout(function(){
                    var te = document.createTextNode(' ');
                    el.css('display','block');
                },delay);
            }
            
            $('frame, iframe').load(function(e){
              if (getChromeVersion() == 44) {
                redrawElement($(this),80);
              }
            });
          }
        
          IGRP_hackerIframe();
        });
      </script>
      <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    </head>

<frameset rows="56,*" framespacing="0" frameborder="no" border="0" bordercolor="#00FF00">

  <frame src="{rows/top_link}" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="igrp_head" />
  
  <xsl:choose>
      <xsl:when test="rows/left_link">
          <frameset cols="23%,*" frameborder="0" bordercolor="black" marginheight="0" scrolling="auto" framespacing="3">
                <frame src="{rows/left_link}" name="head_pai" id="head_pai" border="1"  marginheight="0" scrolling="auto" frameborder="1" />
                <frame src="{rows/center_link}" name="head_filho" id="head_filho" border="0" scrolling="auto" marginheight="0" frameborder="0" />
          </frameset>
       </xsl:when>
       <xsl:otherwise>
       		 <frame src="{rows/center_link}" name="head_filho" id="head_filho" border="0" scrolling="auto" marginheight="0" frameborder="0" />
       </xsl:otherwise>
   </xsl:choose>
   
  
</frameset>

<noframes><body></body></noframes>

</html>
      
</xsl:template>

<xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=1476098525269"/>
 
</xsl:stylesheet>