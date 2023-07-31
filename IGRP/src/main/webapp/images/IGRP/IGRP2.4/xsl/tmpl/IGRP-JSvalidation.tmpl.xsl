<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  	<xsl:template name="jsvalidation" mode="jsvalidation" match="js_validation">
	  	<script src="{$path}/core/igrp/IGRP.rules.class.js?v={$version}"/>
	  	<xsl:if test="count(row) &gt; 0"> 
	  		<xsl:variable name="sb" select="'p_'"/>
		    <script type="text/javascript">
		    	$(function(){
			    	<xsl:for-each select="row">
						<xsl:variable name="url">
							<xsl:choose>
								<xsl:when test="contains(action_url,'?')">
								    <xsl:value-of select="substring-before(action_url,'?')"/>
								</xsl:when>
								<xsl:otherwise><xsl:value-of select="action_url"/></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<xsl:variable name="param">
							<xsl:choose>
								<xsl:when test="contains(action_url,'?')">
								    <xsl:value-of select="concat(substring-after(field,$sb),',',substring-after(action_url,'?'))"/>
								</xsl:when>
								<xsl:otherwise><xsl:value-of select="substring-after(field,$sb)"/></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

			    		$.IGRP.rules.set({
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
										"procedure"		: "<xsl:value-of select="$url"/>",
										"request_fields": "<xsl:value-of select="$param"/>",
										"msg_type"	    : "<xsl:value-of select='action_type'/>",
										"msg"  			: "<xsl:value-of select='action_message'/>"
									}]
								}
							}]
						},'actionsList');
			    	</xsl:for-each>

			    	<xsl:for-each select="row[ field = '' ]">
						console.log('<xsl:value-of select="event"/>')
					</xsl:for-each>
		    	});
		    </script>
		</xsl:if>
  	</xsl:template>
</xsl:stylesheet>
