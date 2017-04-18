<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

     <!--====================Template Generate Fields====================================-->
    <xsl:template name="field">
    	<xsl:param name="value" />
    	<xsl:param name="type" /> 
    	<xsl:param name="formName"/>
    	<xsl:param name="position"/>   	
    	<xsl:for-each select="$value/*">
    		<xsl:value-of select="$enter" />
    		<xsl:value-of select="$tab" />    		
			<xsl:if test="$type = 'filter'">
				<xsl:text>$</xsl:text>
				<xsl:value-of select="$formName"/>
				<xsl:value-of select="$pointer" />				
				<xsl:text>field</xsl:text>
			</xsl:if>
			<xsl:if test="$type = 'form'">
				<xsl:text>$</xsl:text>
				<xsl:value-of select="$formName"/>
				<xsl:value-of select="$pointer" />
				<xsl:text>field</xsl:text>
			</xsl:if>    	    
	    	<xsl:value-of select="$left_p" />
	    	<xsl:choose>
	    		<xsl:when test="$position = ''">
	    			<xsl:value-of select="$model" />	  
	    		</xsl:when>
	    		<xsl:otherwise>
					<xsl:value-of select="concat($model,$position)" />
	    		</xsl:otherwise>
	    	</xsl:choose>	    	
	    	<xsl:value-of select="$comma" />
	    	<xsl:value-of select="$quotes" />	    	    	
	    	<xsl:call-template name="uppercase">
	    		<xsl:with-param name="value" select="local-name()"/>
	    	</xsl:call-template> 
	    	<xsl:value-of select="$quotes" />
	    	<xsl:value-of select="$rigth_p" />	    	    		
	    	<xsl:call-template name="typeField">
	    		<xsl:with-param name="type" select="@type" />
	    	</xsl:call-template>	        
	    </xsl:for-each>
    </xsl:template>

    <!-- ===========================Template type of fields===================================-->
    <xsl:template name="typeField">
    	<xsl:param name="type" />    	
	    	<xsl:choose>
	    		<xsl:when test="$type='number'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>textInput</xsl:text>
	    			<xsl:value-of select="$left_p" />	    			
	    			<xsl:value-of select="$typeNumber" />
	    			<xsl:value-of select="$rigth_p" />
	    			<xsl:value-of select="$endline" />
	    		</xsl:when>
	    		<xsl:when test="$type='text'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>textInput</xsl:text>
	    			<xsl:value-of select="$left_p" />
	    			<xsl:value-of select="$rigth_p" />
	    			<xsl:value-of select="$endline" />
	    		</xsl:when>
	    		<xsl:when test="$type='hidden'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>hiddenInput();</xsl:text>
	    		</xsl:when>
	    		<xsl:when test="$type='email'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>textInput(['type' =&gt; '</xsl:text>
	    			<xsl:value-of select="$type" />
	    			<xsl:text>']);</xsl:text>
	    		</xsl:when>
	    		<xsl:when test="$type='select'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>comboBox</xsl:text>
	    			<xsl:value-of select="$left_p" />
	    			<xsl:text>$</xsl:text><xsl:value-of select="local-name()" />
	    			<xsl:value-of select="$comma" />
	    			<xsl:value-of select="$space" />
	    			<xsl:text>['prompt' =&gt; '---']</xsl:text>
	    			<xsl:value-of select="$rigth_p" />
	    			<xsl:value-of select="$endline" />
	    		</xsl:when>
	    		<!--
	    		<xsl:when test="$type='radiolist'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>hiddenInput();</xsl:text>
	    		</xsl:when>
	    	    -->
	    		<xsl:when test="$type='image'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>image();</xsl:text>
	    		</xsl:when>	    		 
	    		<xsl:when test="$type='link'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>hyperlink();</xsl:text>
	    		</xsl:when>
	    		<xsl:when test="$type='password'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>passwordInput();</xsl:text>
	    		</xsl:when>
	    		<xsl:when test="$type='separator'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>separator();</xsl:text>
	    		</xsl:when>
	    		<xsl:when test="$type='date'">
	    			<xsl:value-of select="$pointer" />
	    			<xsl:text>dateInput();</xsl:text>
	    		</xsl:when>
	    		<xsl:otherwise />   		
	    	</xsl:choose>    	
    </xsl:template>      

     <!-- =========================== Field Name ===================================-->
    <xsl:template name="element-field">  
    	<xsl:param name="value" />  	
    	<xsl:for-each select="$value/*">
			<xsl:value-of select="$quotes" />	    	    	
	    	<xsl:call-template name="uppercase">
	    		<xsl:with-param name="value" select="local-name()"/>
	    	</xsl:call-template>
	    	<xsl:value-of select="$quotes" />
	    	<xsl:value-of select="$comma" /> 
	    	<xsl:value-of select="$enter" />
	    	<xsl:value-of select="$tab2" />
	    	<xsl:value-of select="$tab" />	    	
    	</xsl:for-each>
    </xsl:template>

</xsl:stylesheet>