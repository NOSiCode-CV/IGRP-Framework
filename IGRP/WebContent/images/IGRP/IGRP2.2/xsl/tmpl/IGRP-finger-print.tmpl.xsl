<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template name="fingerprint" mode="fingerprint" match="fingerprint">
    <xsl:param name="view_only" select="'false'"/>
    <xsl:param name="vTitle" select="'Finger Print'"/>
    <script type="text/javascript">
		var path_xml = '<xsl:value-of select="value/link"/>';
	</script>
    <script type="text/javascript" src="{$path}/js/IGRP.finger-print.init.js?v={$version}"></script>
    <div class="box-content resetPadding" sep-name="{name()}">
        <xsl:call-template name="titlecollapser">
        	<xsl:with-param name="title" select="$vTitle"/>
        </xsl:call-template>
        <div class="box-collapser">
        	<xsl:if test="$view_only = 'false'">
                <div class="col">
                    <div class="col50">
                    	<div class="col-1-4">
                            <div class="fingerDados">
                                <label><xsl:value-of select="label/number_process"/></label>
                                <input type="text" name="{value/number_process/@name}" class="text" id="number_process"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </div>
                    <div class="col50">
                        <div class="tool-bar barFinger">
                        	<ul>
                            	<xsl:if test="label/self_service">
                            		<li>
                                    	<a id="botton_selfService">
                                        	<xsl:if test="string-length(label/self_service) &gt; 14">
                                            	<xsl:attribute name="title"><xsl:value-of select="label/self_service"/></xsl:attribute>
                                            </xsl:if>
                                        	<img src="{$path_tmpl}/img/camera_go.png"/>
                                        	<span><xsl:value-of select="label/self_service"/></span>
                                        </a>
                                    </li>
                                </xsl:if>
                                <xsl:if test="label/process_start">
                            		<li>
                                    	<a id="botton_processStart">
                                            <xsl:if test="string-length(label/process_start) &gt; 14">
                                            	<xsl:attribute name="title"><xsl:value-of select="label/process_start"/></xsl:attribute>
                                            </xsl:if>
                                        	<img  src="{$path_tmpl}/img/camera_add.png"/>
                                        	<span><xsl:value-of select="label/process_start"/></span>
                                        </a>
                                    </li>
                                </xsl:if>
                            </ul>
                            <div class="_clear"/>
                        </div>
                    </div>
                    <div class="_clear"/>
                </div>
            </xsl:if>
            <div class="col">
            	<div class="allFinger">
                    <div class="col50100">
                    	<xsl:if test="label/fingerleft_link">
                        	<div class="finger" id="left">
                            	<div class="dados">
                                	<div class="titleFinger">
                                    	<xsl:if test="$view_only ='false'">
                                    		<div class="icon" id="botton_fingerleft"/>
                                        </xsl:if>
                                    	<xsl:value-of select="label/fingerleft_link"/>
                                    </div>
                                    <div class="fingerImg"><img src="{value/fingerleft_link}" class="bio_img" id="bio_fingerleft"/></div>
                                </div>
                        	</div>
                        </xsl:if>
                        <xsl:if test="label/photo_link">
                        	<div class="photo">
                            	<div class="dados">
                                	<div class="titleFinger">
                                    	<xsl:if test="$view_only ='false'">
                                    		<div class="icon" id="botton_photo"/>
                                        </xsl:if>
                                    	<xsl:value-of select="label/photo_link"/>
                                    </div>
                                    <div class="fingerImg"><img src="{value/photo_link}" class="bio_foto_img" id="bio_photo"/></div>
                                </div>
                        	</div>
                        </xsl:if>
                        <xsl:if test="label/fingerright_link">
                            <div class="finger" id="right">
                            	<div class="dados">
                                	<div class="titleFinger">
                                    	<xsl:if test="$view_only ='false'">
                                    		<div class="icon" id="botton_fingerright"/>
                                        </xsl:if>
                                    	<xsl:value-of select="label/fingerright_link"/>
                                    </div>
                                    <div class="fingerImg"><img src="{value/fingerright_link}" class="bio_img" id="bio_fingerright"/></div>
                                </div>
                            </div>
                        </xsl:if>
                        <div class="_clear"/>
                    </div>
                    <div class="col50100">
                    	<xsl:if test="label/signature_link">
                        	<div class="signature">
                                <div class="titleFinger">
                                    <xsl:if test="$view_only ='false'">
                                    	<div class="icon" id="botton_signature"/>
                                    </xsl:if>
                                    <xsl:value-of select="label/signature_link"/>
                                </div>
                                <div class="fingerImg"><img src="{value/signature_link}" class="bio_sig_img" id="bio_signature"/></div>
                            </div>
                        </xsl:if>
                    </div>
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
        <xsl:for-each select="value/hidden">
      		<input type="hidden" name="{@name}" value="{.}"/>
    	</xsl:for-each>
        <div class="_clear"/>
    </div>
 </xsl:template>
</xsl:stylesheet>