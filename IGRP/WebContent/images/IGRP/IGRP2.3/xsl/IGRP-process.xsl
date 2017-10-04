<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  
  <xsl:template match="/">
    
    <html>
     
      <head>
       
        <xsl:call-template name="IGRP-head"/>
      
      </head>
      
      <body class="{$bodyClass} old-v fluid sidebar-off">
       
        <xsl:call-template name="IGRP-topmenu"/>
       
        <form>

          <div class="container-fluid">

            <div class="row">

              <xsl:call-template name="IGRP-sidebar"/>

              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
               
               <div class="content">

                  <div class="row">

                    <div class="row">

	                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                      
	                      <section class="content-header gen-container-item ">

	                        <h2><xsl:value-of select="rows/content/title"/></h2>

	                      </section>   

	                      <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>

	                    </div>

	                  </div>

	                  <div class="row">

	                  	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

	                  		<xsl:apply-templates mode="process-flow" select="rows/content/table" />

	                  	</div>

	                  </div>

                  </div>
             
                </div>

              </div>

            </div>

          </div>

          <xsl:call-template name="IGRP-bottom"/>

        </form>

      </body>

    </html>

  </xsl:template>


  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../xsl/tmpl/IGRP-process-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>