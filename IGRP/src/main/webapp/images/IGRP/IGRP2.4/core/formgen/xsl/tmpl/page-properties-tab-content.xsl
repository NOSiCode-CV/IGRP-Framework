<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="page-properties-tab">
		
		<div class="gen-page-properties-inner">                  

            <div id="gen-page-actions" class="gen-page-props-menus">

                <div class="page-headers text-light mt-4">
                    
                    <b class="small text-uppercase">Page Headers</b>
                    
                    <div class="page-headers-list row g-3 ">
                        <xsl:for-each select="$gen/headers/item">
                            <div class="col-lg-6">
                                <div class="page-header-item gen-declared-containers" name="{name}"  type="{name}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                                    <xsl:value-of select="label"/>
                                </div>
                            </div>
                        </xsl:for-each>   
           
                    </div>

                </div>
               
	            <ul class="mt-4">
                    <li>
                        <a href="#" class="gen-page-setts-ctrl">
                            <i class="fa fa-cog"></i>
                            <span>Settings</span>
                        </a>
                    </li>
	            </ul>
                <h5>Domains</h5>
	            <ul class="">
                   
                    <li>
                        <a href="#" id="gen-domains">
                            <i class="fa fa-plus"></i>
                            <span>New Domain</span>
                        </a>
                    </li>
	            </ul>
	        </div>

        </div>

	</xsl:template>

</xsl:stylesheet>