<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:output method="html" encoding="UTF-8" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />
 <xsl:template match="/">
  <html>
   <head>
    <xsl:call-template name="home-header"/>
   </head>
   <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <xsl:call-template name="home-top-main"/>
    <div id="igrp-bodyPage">
     <xsl:call-template name="home-slide-menu"/>
     <div class="bodyPageRigth">
      <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
      <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--SPLIT--></form>
       <div class="_clear"/>
      </div>
      <div class="_clear"/>
     </div>
     <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
     </div>
    </body>
   </html>
  </xsl:template>
 </xsl:stylesheet>
