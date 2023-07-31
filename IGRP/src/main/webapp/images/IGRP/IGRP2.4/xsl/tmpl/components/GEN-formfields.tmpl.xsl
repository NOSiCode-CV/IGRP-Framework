<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="GEN-formfields">
		<xsl:param name="tag" select="name()"/>
		<xsl:variable name="required" select="@required='true'"/>
		<xsl:if test="@type != 'hidden'">
			<xsl:choose>
				<!-- separator / group -->
				<xsl:when test="@type = 'separator' or @type = 'group'">
					<div class="box-head subtitle" text-color="primary">
						<span>
							<xsl:value-of select="text()"/>
						</span>
					</div>
				</xsl:when>
				<!-- select -->
				<xsl:when test="contains(@type,'select')">
					<div class="form-group col-sm-3 gen-fields-holder" item-name="{$tag}" item-type="{@type}">
						<xsl:call-template name="check-required"/>
						<xsl:call-template name="form-item-label"/>
						<select class="form-control select2 " id="{@name}" name="{@name}">
							<xsl:call-template name="FIELD_validator"/>
						</select>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="form-group col-sm-3 gen-fields-holder" item-name="{$tag}" item-type="{@type}">
						<xsl:call-template name="check-required"/>
						<xsl:call-template name="form-item-label"/>
						<input type="{@type}" value="{../../value/*[name() = $tag]}" class="form-control " id="{@name}" name="{@name}" maxlength="{@maxlength}">
							<xsl:call-template name="FIELD_validator"/>
						</input>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="form-item-label">
		<label for="{.}">
			<span><xsl:value-of select="."/></span>
		</label>
	</xsl:template>

	<xsl:template name="check-required">
		<xsl:if test="@required = 'true'">
			<xsl:attribute name="required">required</xsl:attribute>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>