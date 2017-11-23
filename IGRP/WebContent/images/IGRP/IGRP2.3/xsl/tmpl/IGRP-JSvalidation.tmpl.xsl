<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  	<xsl:template name="jsvalidation" mode="jsvalidation" match="js_validation">
	  	<script src="{$path}/core/igrp/IGRP.rules.class.js?v={$version}"/>
	  	<xsl:if test="count(row) &gt; 0"> 
	  		<xsl:variable name="sb" select="'p_'"/>
		    <script type="text/javascript">
		    	$.IGRP.rules.set({
		    		<xsl:for-each select="row">
		    			"<xsl:value-of select='field'/>":[{
							"name" 		:"<xsl:value-of select='concat(event,position())'/>",
							"events" 	:"<xsl:value-of select='event'/>",
							"isTable" 	:false,
							"conditions":{
								"rules" :[{
									"condition"		: "<xsl:value-of select='operation'/>",
									"value" 		: "<xsl:value-of select='value'/>",
									"value2" 		: "<xsl:value-of select='value1'/>",
									"patern" 		: "",
									"patern_custom" : "",
									"opposite" 		: ""
								}],
								"actions"	 		: [{
									"action"	 	: "<xsl:value-of select='action'/>",
									"targets"		: "<xsl:value-of select='target'/>",
									"procedure"		: "<xsl:value-of select='action_url'/>",
									"request_fields": "<xsl:value-of select='substring-after(field,$sb)'/>",
									"msg_type"	    : "<xsl:value-of select='action_type'/>",
									"msg"  			: "<xsl:value-of select='action_message'/>"
								}]
							}
						}]<xsl:if test="position() != last()">,</xsl:if>
		    		</xsl:for-each>
		    	},'actionsList');
		    </script>
		</xsl:if>
  	</xsl:template>
</xsl:stylesheet>
