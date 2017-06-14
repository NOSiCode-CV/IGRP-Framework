<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="/images/IGRP/xml/ " -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
 
<xsl:template match="/"> 

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <script type="text/javascript" src="/images/IGRP2.2/js/jquery-2.1.1.min.js"></script>
<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--> 
 <!--<meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />-->
    <meta http-equiv="X-UA-Compatible" content="chrome=1"/>
<title><xsl:value-of select="rows/title" /></title>
<style>
  .col{display:block;}
  .colLeft, .colRight{float:left;}
  .colLeft{width:23%;}
  .colRight{width:75%;}
  ._clear{clear: both;}
</style>
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
          redrawElement($(this),90);
        }
      });
    }
  
    IGRP_hackerIframe();
  });
</script>
</head>

<frameset rows="50,*" framespacing="0" frameborder="no" border="0" bordercolor="#00FF00">
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
<!-- <body>
  <div id="geral">
    <div class="col">
      <iframe src="{rows/top_link}" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="igrp_head" />
    </div>
    <div class="col">
      <xsl:choose>
        <xsl:when test="rows/left_link">
          <div class="colLeft"><iframe src="{rows/left_link}" name="head_pai" id="head_pai" border="1"  marginheight="0" scrolling="auto" frameborder="1" /></div>
          <div class="colRight"><iframe src="{rows/center_link}" name="head_filho" id="head_filho" border="0" scrolling="auto" marginheight="0" frameborder="0" /></div>
        </xsl:when>
        <xsl:otherwise>
          <iframe src="{rows/center_link}" name="head_filho" id="head_filho" border="0" scrolling="auto" marginheight="0" frameborder="0" />
        </xsl:otherwise>
      </xsl:choose>
      <div class="_clear"/>
    </div>
    <div class="_clear"/>
  </div>
</body> -->
</html>
      
</xsl:template>

 
</xsl:stylesheet>