<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="page-properties-tab">
		
		<div class="gen-page-properties-inner">
                                    
            <!-- <div id="gen-page-properties-type" class="gen-page-props-menus">

                <h5>Templates</h5>

                <ul class="">

                    <xsl:for-each select="$gen/pages/page">

                      	<li>

	                        <a class="gen-page-type-item" type="{name}">

	                            <xsl:value-of select="title"/>

	                        </a>

                      	</li>

                    </xsl:for-each>
                </ul>

                

            </div> -->

            <div id="gen-page-actions" class="gen-page-props-menus">
                <h5>Page Settings</h5>
	            <ul class="">
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