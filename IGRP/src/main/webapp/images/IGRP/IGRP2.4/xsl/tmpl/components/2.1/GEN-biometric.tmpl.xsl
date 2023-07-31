<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="GEN-biometric">
		
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="data" select="//rows/content/form/fingerprint"/>
    <xsl:param name="view" select="'false'"/>

    <xsl:if test="count($data/label/*) &gt; 0">

    	<div class="box-body fp" href="{$data/value/link}" item-name="{$tag}" id="id-{$tag}">
    		
    		<xsl:if test="$view != 'true'">
    			<div class="toolsbar-holder box-content">
    				<xsl:if test="$data/label/number_process">
    	    		<div class="form-group col-md-3 col-sm-6 fp-col">
    	    	    	<input type="number" placeholder="{$data/label/number_process}" id="{$data/label/number_process/@name}" class="form-control number fp_process" name="{$data/label/number_process/@name}" value="{$data/label/value}"/>
    	    		</div>
    	    	</xsl:if>

    	    	<xsl:if test="$data/label/self_service or $data/label/process_start">
  	    	    <div class="col-md-9 col-sm-6 fp-col">
  	    	    	<div class="pull-right gen-form-btns">
  	    	    		<xsl:if test="$data/label/self_service">
  	    	    		    <a class="btn btn-secondary fp-btn fp-click" type="self">
  	    	    		    	<i class="fa fa-step-forward"/>
  	    	    		    	<span><xsl:value-of select="$data/label/self_service"/></span>
  	    	    		    </a>
  	    	    		</xsl:if>
  	    	    		<xsl:if test="$data/label/process_start">
  	    	    		    <a class="btn btn-info fp-btn fp-click" type="start">
  	    	    		    	<i class="fa fa-play"/>
  	    	    		    	<span><xsl:value-of select="$data/label/process_start"/></span>
  	    	    		    </a>
  	    	    		</xsl:if>
  	    	    	</div>
  	    	    </div>
  	    	</xsl:if>

    			</div>
    		</xsl:if>
    		<div class="box-content">

    			<xsl:if test="$data/label/fingerleft_link">
    		    <div class="col-md-2 col-sm-4 fp-col">
    		    	<div class="fp-left fp-center fp-content" rel="finger">
      		    	<xsl:if test="$view != 'true'">
      		    		<a class="btn fp-click" type="finger">
      		    			<i class="fa fa-hand-o-left "/>
      		    			<span><xsl:value-of select="$data/label/fingerleft_link"/></span>
      		    		</a>
      		    	</xsl:if>
      		    	<div class="fp-box" view="{$view}">
      		    		<img src="{$data/value/fingerleft_link}"/>
      		    	</div>
    		    	</div>
    				</div>
      		</xsl:if>

      		<xsl:if test="$data/label/photo_link">
    		    <div class="col-md-2 col-sm-4 fp-col">
    		    	<div class="fp-photo fp-center fp-content" rel="face">
      		    	<xsl:if test="$view != 'true'">
      		    		<a class="btn fp-click" type="face">
      		    			<i class="fa fa-user-o " />
      		    			<span><xsl:value-of select="$data/label/photo_link"/></span>
      		    		</a>
      		    	</xsl:if>
      		    	<div class="fp-box" view="{$view}">
      		    		<img src="{$data/value/photo_link}"/>
      		    	</div>
    		    	</div>
    			</div>
    		</xsl:if>

      		<xsl:if test="$data/label/fingerright_link">
    		    <div class="col-md-2 col-sm-4 fp-col">
    		    	<div class="fp-left fp-center fp-content" rel="finger">
      		    	<xsl:if test="$view != 'true'">
      		    		<a class="btn fp-click" type="finger">
      		    			<i class="fa fa-hand-o-left " />
      		    			<span><xsl:value-of select="$data/label/fingerright_link"/></span>
      		    		</a>
      		    	</xsl:if>
      		    	<div class="fp-box" view="{$view}">
      		    		<img src="{$data/value/fingerright_link}"/>
      		    	</div>
    		    	</div>
    				</div>
      		</xsl:if>
      		<xsl:if test="$data/label/signature_link">
    		    <div class="col-md-6 col-sm-12 fp-col">
    		    	<div class="fp-signature fp-content" rel="sig">
      		    	<xsl:if test="$view != 'true'">
      		    		<a class="btn fp-click" type="sig">
      		    			<i class="fa fa-pencil-square-o " />
      		    			<span><xsl:value-of select="$data/label/signature_link"/></span>
      		    		</a>
      		    	</xsl:if>
      		    	<div class="fp-box" view="{$view}">
      		    		<img src="{$data/value/signature_link}"/>
      		    	</div>
    		    	</div>
    			</div>
    		</xsl:if>
    		<xsl:for-each select="$data/hidden">
      			<input type="hidden" name="{@name}" value="{.}"/>
    		</xsl:for-each>
    		</div>

    	</div>

    </xsl:if>

	</xsl:template>

</xsl:stylesheet>