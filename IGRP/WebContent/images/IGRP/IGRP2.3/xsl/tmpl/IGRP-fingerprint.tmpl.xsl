<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template name="fingerprint">
        <xsl:param name="fp" select="rows/content/*/fields"/>
        <xsl:param name="view" select="'false'"/>
        <div class="box-body fp" href="{$fp/fp_link/value}">
        	<xsl:if test="$view != 'true'">
        	    <div class="toolsbar-holder box-content">
        	    	<xsl:if test="$fp/fp_process">
        	    		<div class="form-group col-md-3 col-sm-6">
        	    	    	<input type="number" placeholder="{$fp/fp_process/label}" id="{$fp/fp_process/@name}" class="form-control number fp_process" name="{$fp/fp_process/@name}" value="{$fp/fp_process/value}"/>
        	    		</div>
        	    	</xsl:if>
        	    	<xsl:if test="$fp/fp_self or $fp/fp_start">
        	    	    <div class="col-md-9 col-sm-6">
        	    	    	<div class="pull-right gen-form-btns">
        	    	    		<xsl:if test="$fp/fp_self">
        	    	    		    <a class="btn btn-secondary fp-btn fp-click" type="self">
        	    	    		    	<i class="fa fa-step-forward"/>
        	    	    		    	<span><xsl:value-of select="$fp/fp_self/label"/></span>
        	    	    		    </a>
        	    	    		</xsl:if>
        	    	    		<xsl:if test="$fp/fp_start">
        	    	    		    <a class="btn btn-info fp-btn fp-click" type="start">
        	    	    		    	<i class="fa fa-play"/>
        	    	    		    	<span><xsl:value-of select="$fp/fp_start/label"/></span>
        	    	    		    </a>
        	    	    		</xsl:if>
        	    	    	</div>
        	    	    </div>
        	    	</xsl:if>
        	    </div>
        	</xsl:if>
        	<div class="box-content">
        		<xsl:if test="$fp/fp_fingerleft">
        		    <div class="col-md-2 col-sm-4 fp-col">
        		    	<div class="fp-left fp-center fp-content" rel="finger">
	        		    	<xsl:if test="$view != 'true'">
	        		    		<a class="btn">
	        		    			<i class="fa fa-hand-o-left fp-click" type="finger"/>
	        		    			<span><xsl:value-of select="$fp/fp_fingerleft/label"/></span>
	        		    		</a>
	        		    	</xsl:if>
	        		    	<div class="fp-box" view="{$view}">
	        		    		<img src="{$fp/fp_fingerleft/value}"/>
	        		    	</div>
        		    	</div>
        			</div>
        		</xsl:if>
        		<xsl:if test="$fp/fp_photo">
        		    <div class="col-md-2 col-sm-4 fp-col">
        		    	<div class="fp-photo fp-center fp-content" rel="face">
	        		    	<xsl:if test="$view != 'true'">
	        		    		<a class="btn">
	        		    			<i class="fa fa-user-o fp-click" type="face"/>
	        		    			<span><xsl:value-of select="$fp/fp_photo/label"/></span>
	        		    		</a>
	        		    	</xsl:if>
	        		    	<div class="fp-box" view="{$view}">
	        		    		<img src="{$fp/fp_photo/value}"/>
	        		    	</div>
        		    	</div>
        			</div>
        		</xsl:if>
        		<xsl:if test="$fp/fp_fingerright">
        		    <div class="col-md-2 col-sm-4 fp-col">
        		    	<div class="fp-right fp-center fp-content" rel="finger">
	        		    	<xsl:if test="$view != 'true'">
	        		    		<a class="btn">
	        		    			<i class="fa fa-hand-o-right fp-click" type="finger"/>
	        		    			<span><xsl:value-of select="$fp/fp_fingerright/label"/></span>
	        		    		</a>
	        		    	</xsl:if>
	        		    	<div class="fp-box" view="{$view}">
	        		    		<img src="{$fp/fp_fingerright/value}"/>
	        		    	</div>
        		    	</div>
        			</div>
        		</xsl:if>
        		<xsl:if test="$fp/fp_signature">
        		    <div class="col-md-6 col-sm-12 fp-col">
        		    	<div class="fp-signature fp-content" rel="sig">
	        		    	<xsl:if test="$view != 'true'">
	        		    		<a class="btn">
	        		    			<i class="fa fa-pencil-square-o fp-click" type="sig"/>
	        		    			<span><xsl:value-of select="$fp/fp_signature/label"/></span>
	        		    		</a>
	        		    	</xsl:if>
	        		    	<div class="fp-box" view="{$view}">
	        		    		<img src="{$fp/fp_signature/value}"/>
	        		    	</div>
        		    	</div>
        			</div>
        		</xsl:if>
        	</div>
        	<xsl:for-each select="$fp/hidden">
      			<input type="hidden" name="{@name}" value="{.}"/>
    		</xsl:for-each>
        </div>
   </xsl:template>
</xsl:stylesheet>