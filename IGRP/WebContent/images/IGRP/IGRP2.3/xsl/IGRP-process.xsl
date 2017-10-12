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
                    <div class="col-sm-12">
                      
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


<<<<<<< HEAD
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
=======
		<xsl:if test="rows/content/js_validation">
				<script src="{$path}/core/igrp/IGRP.rules.class.js"/>
			 	<script>
			 		var Arr = [];
					<xsl:for-each select="rows/content/js_validation/row[ field != '' ]">
				 		<xsl:variable name="event" select="event"/>
				 		<xsl:variable name="field" select="field"/>
				 		<xsl:variable name="operation" select="operation"/>
				 		<xsl:variable name="value" select="value"/>
				 		<xsl:variable name="action" select="action"/>
				 		<xsl:variable name="target" select="target"/>

					 		$.IGRP.rules.set({
					 			"<xsl:value-of select="$field"/>" : [
					 				{ 

					 					"conditions" : {

					 						"actions" : [
					 							{
					 								"action" 				: "<xsl:value-of select="$action"/>",
					 								"targets" 		  : "<xsl:value-of select="$target"/>",
                        	"msg"					  : "",
                        	"msg_type"	    : "",
                        	"procedure"		  : "",
                        	"request_fields": "<xsl:value-of select="$field"/>"
					 							}
					 						],

					 						"rules": [
		                    {
	                        "condition": "<xsl:value-of select="$operation"/>",
	                        "opposite": "",
	                        "patern": "",
	                        "patern_custom": "",
	                        "value": "<xsl:value-of select="$value"/>",
	                        "value2": ""
		                    }
			                ]
					 					
					 					},

					 					"events" : "<xsl:value-of select="$event"/>"

					 				}
					 			]
					 		},'actionsList');				 		
				 	</xsl:for-each>

				 	<xsl:for-each select="rows/content/js_validation/row[ field = '' ]">
				 		console.log('<xsl:value-of select="event"/>')
				 	</xsl:for-each>

				</script>

		</xsl:if>
	</xsl:template>

	<xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
	<xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
	<xsl:include href="tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
	<xsl:include href="tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
	<xsl:include href="tmpl/IGRP-process-utils.tmpl.xsl?v=1463090556312"/>
	<xsl:include href="tmpl/IGRP-formgen.tmpl.xsl?v=1463090556312"/>
	<xsl:include href="tmpl/IGRP-form-utils.tmpl.xsl?v=1507204691038"/>
>>>>>>> branch 'master' of https://github.com/NOSiCode-CV/IGRP-Framework.git
</xsl:stylesheet>