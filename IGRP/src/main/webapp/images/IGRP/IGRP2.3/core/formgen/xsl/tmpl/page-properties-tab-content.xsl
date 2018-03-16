<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="page-properties-tab">
		
		<div class="gen-page-properties-inner">
                                    
            <div id="gen-page-properties-type" class="gen-page-props-menus">

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

                

            </div>

            <div id="gen-page-actions" class="gen-page-props-menus">
                <h5></h5>
	            <ul class="">
                    <li>
                        <a href="#" id="download-gen-xsl">
                            <!-- <i class="fa fa-upload"></i> -->
                            <span>Download XSL Generator</span>
                        </a>
                    </li> 
	            </ul>

	        </div>

        </div>

	</xsl:template>

</xsl:stylesheet>