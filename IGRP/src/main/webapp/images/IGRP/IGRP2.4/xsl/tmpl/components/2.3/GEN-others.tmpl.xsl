<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="GEN-view">
		<xsl:variable name="tag" select="name()"/>
		<div class="box clearfix view-block gen-container-item " template="2cols" gen-class="" item-name="{$tag}">
			<xsl:attribute name="has-img">
				<xsl:choose>
					<xsl:when test="fields/*[name() = concat($tag,'_img')]">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			
			<xsl:if test="@title">			
	            <xsl:call-template name="box-header">
	                <xsl:with-param name="title" select="@title"/>
	                <xsl:with-param name="collapsible" select="'true'"/>
	                <xsl:with-param name="collapsed" select="'true'"/>
	            </xsl:call-template>
            </xsl:if>
            <div class="box-body">
            	<xsl:apply-templates mode="form-hidden-fields" select="fields"/>
            	<xsl:if test="fields/*[name() = concat($tag,'_img')]">
                    <img src="{fields/*[name() = concat($tag,'_img')]/value}"/>
                </xsl:if>
                <div class="view-body clearfix ">
	                <xsl:for-each select="fields/*[not(name() = concat($tag,'_img'))]">
	                	<div class="view-item gen-fields-holder" item-name="{name(.)}">
	                		<xsl:if test="@type = 'separator'">
                            	<xsl:attribute name="class">view-item view-separator gen-fields-holder</xsl:attribute>
                            </xsl:if>
		                	<xsl:choose>
		                		<xsl:when test="@type = 'link'">
		                			<a href="{./value}" target="@target" target-fields="" request-fields="">
	                                    <i class="fa {@img}"/>
	                                    <span>
	                                        <xsl:value-of select="./label"/>
	                                    </span>
	                                </a>
		                		</xsl:when>
		                		<xsl:otherwise>
		                		    <span class="view-label">
		                		    	<xsl:if test="@type = 'separator'">
			                            	<xsl:attribute name="class">view</xsl:attribute>
			                            </xsl:if>
	                                    <xsl:value-of select="./label"/>
	                                </span>
	                                <xsl:if test="@type != 'separator'">
	                                	<span class="view-value">
	                                        <xsl:value-of select="./value"/>
	                                    </span>
	                                </xsl:if>
		                		</xsl:otherwise>
		                	</xsl:choose>
	                	</div>
	                </xsl:for-each>
            	</div>
            </div>
        </div>
</xsl:template>
</xsl:stylesheet>