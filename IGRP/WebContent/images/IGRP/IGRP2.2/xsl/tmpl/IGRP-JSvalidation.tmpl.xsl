<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="js_validation" mode="js_validation" match="js_validation">
    <script type="text/javascript">
        $(function(e) {
			<xsl:for-each select="row">
				<xsl:if test="event and event != ''">
					try{
						<xsl:choose>
							<xsl:when test="event = 'load'">						
								JS_call_validation({
										obj_name:"<xsl:value-of select='field'/>",
										obj_value:$("*[name='<xsl:value-of select='field'/>']").val(),
										operation:"<xsl:value-of select='operation'/>",
										value:"<xsl:value-of select='value'/>",
										value1:"<xsl:value-of select='value1'/>",
										action:"<xsl:value-of select='action'/>",
										target:"<xsl:value-of select='target'/>",
										valuesum:"<xsl:value-of select='valuesum'/>",
										action_url:"<xsl:value-of select='action_url'/>",
										action_message:"<xsl:value-of select='action_message'/>",
										action_type:"<xsl:value-of select='action_type'/>",
										action_submit:"<xsl:value-of select='action_submit'/>"
										}									
									);
							</xsl:when>
							<xsl:when test="event = 'blur'">						
								$("body").on("blur","*[name='<xsl:value-of select='field'/>']",function()
								{
									JS_call_validation(
										{obj_name:"<xsl:value-of select='field'/>",
										obj_value:$(this).val(),
										operation:"<xsl:value-of select='operation'/>",
										value:"<xsl:value-of select='value'/>",
										value1:"<xsl:value-of select='value1'/>",
										action:"<xsl:value-of select='action'/>",
										target:"<xsl:value-of select='target'/>",
										valuesum:"<xsl:value-of select='valuesum'/>",
										action_url:"<xsl:value-of select='action_url'/>",
										action_message:"<xsl:value-of select='action_message'/>",
										action_type:"<xsl:value-of select='action_type'/>",
										action_submit:"<xsl:value-of select='action_submit'/>"
										}									
									);
										
								});
							</xsl:when>
							<xsl:when test="event = 'change'">
								$("body").on("change","*[name='<xsl:value-of select='field'/>']",function()
								{							
									JS_call_validation(
										{obj_name:"<xsl:value-of select='field'/>",
										obj_value:$(this).val(),
										operation:"<xsl:value-of select='operation'/>",
										value:"<xsl:value-of select='value'/>",
										value1:"<xsl:value-of select='value1'/>",
										action:"<xsl:value-of select='action'/>",
										target:"<xsl:value-of select='target'/>",
										valuesum:"<xsl:value-of select='valuesum'/>",
										action_url:"<xsl:value-of select='action_url'/>",
										action_message:"<xsl:value-of select='action_message'/>",
										action_type:"<xsl:value-of select='action_type'/>",
										action_submit:"<xsl:value-of select='action_submit'/>"
										}									
									);
									
									});
							</xsl:when>
							<xsl:when test="event = 'click'">
								$("body").live("click","*[name='<xsl:value-of select='field'/>']",function()
								{							
									JS_call_validation(
										{obj_name:"<xsl:value-of select='field'/>",
										obj_value:$(this).val(),
										operation:"<xsl:value-of select='operation'/>",
										value:"<xsl:value-of select='value'/>",
										value1:"<xsl:value-of select='value1'/>",
										action:"<xsl:value-of select='action'/>",
										target:"<xsl:value-of select='target'/>",
										valuesum:"<xsl:value-of select='valuesum'/>",
										action_url:"<xsl:value-of select='action_url'/>",
										action_message:"<xsl:value-of select='action_message'/>",
										action_type:"<xsl:value-of select='action_type'/>",
										action_submit:"<xsl:value-of select='action_submit'/>"
										}									
									);
									
									});
							</xsl:when>
						</xsl:choose>
					}catch(e){null;}
				</xsl:if>
             </xsl:for-each>
            });
          </script>
  </xsl:template>
</xsl:stylesheet>
