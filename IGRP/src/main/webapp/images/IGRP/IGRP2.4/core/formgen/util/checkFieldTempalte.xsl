<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 
 <xsl:param name="file" select="''"/>
 
 <xsl:template match="/">
   <xsl:call-template name="templateChecker">
     <xsl:with-param name="file" select="test/file"/>
   </xsl:call-template>
  </xsl:template>


  <xsl:include href="simages/IGRP/IGRP2.3/xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

 </xsl:stylesheet>
