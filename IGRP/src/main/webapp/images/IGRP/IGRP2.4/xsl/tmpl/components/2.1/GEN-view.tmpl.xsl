<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="GEN-view">
		
		<xsl:variable name="hasImg">
			<xsl:if test="rows/content/view/label/view_foto != ''">true</xsl:if>
		</xsl:variable>
		
		<div class="box clearfix view-block gen-container-item " has-img="{$hasImg}" item-name="view">
			
			<xsl:if test="rows/content/view/@title">
				<xsl:call-template name="box-header">
               		<xsl:with-param name="title" select="rows/content/view/@title"/>
               		<xsl:with-param name="collapsible" select="'false'"/>
               		<xsl:with-param name="collapsed" select="'false'"/>
             	</xsl:call-template>
			</xsl:if>
			
           <div class="box-body">

             <xsl:if test="$hasImg = 'true'">
               <img src="{rows/content/view/value/view_foto}"/>
             </xsl:if>
             
             <div class="view-body clearfix ">
             	<xsl:for-each select="rows/content/view/label/*[ not( name()='view_foto' ) ]">
             		<xsl:variable name="tag" select="name()"/>
             		<xsl:choose>
             			<xsl:when test="@type='separator'">
             				<div class="view-item view-separator" item-name="{$tag}">
                               <span class="view">
                                 <xsl:value-of select="../../value/*[name() = $tag]"/>
                               </span>
                             </div>
             			</xsl:when>
             			
             			<xsl:when test="@type='link'">
             				<div class="view-item gen-fields-holder" item-name="{$tag}">
                              <a href="{../../value/*[name() = $tag]}" target="{target}" target-fields="">
                                <i class="fa fa-link"/>
                                <span>
                                  <span>
                                    <xsl:value-of select="."/>
                                  </span>
                                </span>
                              </a>
                            </div>
             			</xsl:when>
             			
             			<xsl:otherwise>
             				<div class="view-item gen-fields-holder" item-name="{$tag}">
                            	<span class="view-label">
                               		<xsl:value-of select="."/>
                             	</span>
                             	<span class="view-value">
                               		<xsl:value-of select="../../value/*[name() = $tag]"/>
                             	</span>
                           </div>
             			</xsl:otherwise>
             			
             		</xsl:choose>
             	
             	</xsl:for-each>
               <!--  
               <xsl:if test="rows/content/view_1/fields/text_1">
                 <div class="view-item gen-fields-holder" item-name="text_1">
                   <span class="view-label">
                     <xsl:value-of select="rows/content/view_1/fields/text_1/label"/>
                   </span>
                   <span class="view-value">
                     <xsl:value-of select="rows/content/view_1/fields/text_1/value"/>
                   </span>
                 </div>
               </xsl:if>
               -->
             </div>
           </div>
         </div>

	</xsl:template>

</xsl:stylesheet>