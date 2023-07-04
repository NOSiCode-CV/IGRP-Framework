<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template name="fingerprint">
        <xsl:param name="fp" select="rows/content/*/fields"/>
        <xsl:param name="view" select="'false'"/>

        <xsl:variable name="name" select="local-name($fp/..)"/>
        <xsl:if test="count($fp/*) &gt; 0">
            <div class="box-body fp" href="{$fp/*[name() = concat($name,'_link')]/value}" item-name="{$name}" id="id-{$name}">
            	<xsl:if test="$view != 'true'">
            	    <div class="toolsbar-holder box-content">
            	    	<xsl:if test="$fp/*[name() = concat($name,'_process')]">
            	    		<div class="form-group col-md-3 col-sm-6 fp-col">
            	    	    	<input type="number" placeholder="{$fp/*[name() = concat($name,'_process')]/label}" id="{$fp/*[name() = concat($name,'_process')]/@name}" class="form-control number fp_process" name="{$fp/*[name() = concat($name,'_process')]/@name}" value="{$fp/*[name() = concat($name,'_process')]/value}"/>
            	    		</div>
            	    	</xsl:if>
            	    	<xsl:if test="$fp/*[name() = concat($name,'_self')] or $fp/*[name() = concat($name,'_start')]">
            	    	    <div class="col-md-9 col-sm-6 fp-col">
            	    	    	<div class="pull-right gen-form-btns">
            	    	    		<xsl:if test="$fp/*[name() = concat($name,'_self')]">
            	    	    		    <a class="btn btn-secondary fp-btn fp-click" type="self">
            	    	    		    	<i class="fa fa-step-forward"/>
            	    	    		    	<span><xsl:value-of select="$fp/*[name() = concat($name,'_self')]/label"/></span>
            	    	    		    </a>
            	    	    		</xsl:if>
            	    	    		<xsl:if test="$fp/*[name() = concat($name,'_start')]">
            	    	    		    <a class="btn btn-info fp-btn fp-click" type="start">
            	    	    		    	<i class="fa fa-play"/>
            	    	    		    	<span><xsl:value-of select="$fp/*[name() = concat($name,'_start')]/label"/></span>
            	    	    		    </a>
            	    	    		</xsl:if>
            	    	    	</div>
            	    	    </div>
            	    	</xsl:if>
            	    </div>
            	</xsl:if>
            	<div class="box-content">
            		<xsl:if test="$fp/*[name() = concat($name,'_fingerleft')]">
            		    <div class="col-md-2 col-sm-4 fp-col">
            		    	<div class="fp-left fp-center fp-content" rel="finger">
    	        		    	<xsl:if test="$view != 'true'">
    	        		    		<a class="btn">
    	        		    			<i class="fa fa-hand-o-left fp-click" type="finger"/>
    	        		    			<span><xsl:value-of select="$fp/*[name() = concat($name,'_fingerleft')]/label"/></span>
    	        		    		</a>
    	        		    	</xsl:if>
    	        		    	<div class="fp-box" view="{$view}">
    	        		    		<img src="{$fp/*[name() = concat($name,'_fingerleft')]/value}"/>
    	        		    	</div>
            		    	</div>
            			</div>
            		</xsl:if>
            		<xsl:if test="$fp/*[name() = concat($name,'_photo')]">
            		    <div class="col-md-2 col-sm-4 fp-col">
            		    	<div class="fp-photo fp-center fp-content" rel="face">
    	        		    	<xsl:if test="$view != 'true'">
    	        		    		<a class="btn">
    	        		    			<i class="fa fa-user-o fp-click" type="face"/>
    	        		    			<span><xsl:value-of select="$fp/*[name() = concat($name,'_photo')]/label"/></span>
    	        		    		</a>
    	        		    	</xsl:if>
    	        		    	<div class="fp-box" view="{$view}">
    	        		    		<img src="{$fp/*[name() = concat($name,'_photo')]/value}"/>
    	        		    	</div>
            		    	</div>
            			</div>
            		</xsl:if>
            		<xsl:if test="$fp/*[name() = concat($name,'_fingerright')]">
            		    <div class="col-md-2 col-sm-4 fp-col">
            		    	<div class="fp-right fp-center fp-content" rel="finger">
    	        		    	<xsl:if test="$view != 'true'">
    	        		    		<a class="btn">
    	        		    			<i class="fa fa-hand-o-right fp-click" type="finger"/>
    	        		    			<span><xsl:value-of select="$fp/*[name() = concat($name,'_fingerright')]/label"/></span>
    	        		    		</a>
    	        		    	</xsl:if>
    	        		    	<div class="fp-box" view="{$view}">
    	        		    		<img src="{$fp/*[name() = concat($name,'_fingerright')]/value}"/>
    	        		    	</div>
            		    	</div>
            			</div>
            		</xsl:if>
            		<xsl:if test="$fp/*[name() = concat($name,'_signature')]">
            		    <div class="col-md-6 col-sm-12 fp-col">
            		    	<div class="fp-signature fp-content" rel="sig">
    	        		    	<xsl:if test="$view != 'true'">
    	        		    		<a class="btn">
    	        		    			<i class="fa fa-pencil-square-o fp-click" type="sig"/>
    	        		    			<span><xsl:value-of select="$fp/*[name() = concat($name,'_signature')]/label"/></span>
    	        		    		</a>
    	        		    	</xsl:if>
    	        		    	<div class="fp-box" view="{$view}">
    	        		    		<img src="{$fp/*[name() = concat($name,'_signature')]/value}"/>
    	        		    	</div>
            		    	</div>
            			</div>
            		</xsl:if>
            	</div>
            	<xsl:for-each select="$fp/hidden">
          			<input type="hidden" name="{@name}" value="{.}"/>
        		</xsl:for-each>
            </div>
        </xsl:if>
   </xsl:template>
</xsl:stylesheet>