<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- FIELD VALIDATOR -->
<xsl:template name="FIELD_validator">
     <xsl:param name="type" />
     <xsl:param name="required" select="''"/>
     <xsl:param name="rel" select="''"/>
     <xsl:param name="change" select="''"/>
     <xsl:param name="readonly" select="''"/>     
     <xsl:param name="maxlength" select="30"/>
     <xsl:param name="visible" select="''"/>
     <xsl:param name="separator" select="'false'"/>
         
    <xsl:attribute name="class">
    
        <xsl:value-of select="$type" />
                
        <xsl:if test="$required='true'">
        	<xsl:choose>
            	<xsl:when test="$separator = 'true'"><xsl:text> important</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text> required</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        
          <xsl:if test="$change='true'">
            <xsl:text> IGRP_change</xsl:text>
        </xsl:if>
        
         <xsl:if test="$readonly='onchange'">
            <xsl:text> IGRP_change</xsl:text>
        </xsl:if>
        
        <xsl:if test="$type = 'file'"><xsl:text> uploadFile</xsl:text></xsl:if>
        
    </xsl:attribute>
    
    <xsl:if test="$readonly='true' and $type != 'file'">
        <xsl:attribute name="disabled"><xsl:text>disabled</xsl:text></xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$readonly='readonly'  and $type != 'file'">
        <xsl:attribute name="readonly"><xsl:text>readonly</xsl:text></xsl:attribute>
    </xsl:if>
    
     <xsl:if test="$visible='false'">
        <xsl:attribute name="visible"><xsl:text>false</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:if test="$type='date'">
    	<xsl:attribute name="trel"><xsl:text>IGRP_datePicker</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:if test="$type='datetime'">
    	<xsl:attribute name="trel"><xsl:text>IGRP_dateTimePicker</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:if test="$type='time'">
    	<xsl:attribute name="trel"><xsl:text>IGRP_timePicker</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:if test="($type = 'text' or $type = 'number' or $type = 'textarea' or $type = 'texteditor') and $maxlength != ''">
    	<xsl:attribute name="maxlength"><xsl:value-of select="$maxlength" /></xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$rel !=''">
        <xsl:attribute name="rel">
        	<xsl:text>F_</xsl:text><xsl:value-of select="$rel" />
        </xsl:attribute>
    </xsl:if> 
</xsl:template>


<!-- FIELD OPTIONS -->
<xsl:template name="FIELD_options">
    <xsl:param name="list" />   
	<xsl:param name="type_list" select="''"/>
	<xsl:param name="value" select="''"/>
    	<option value=""></option>
        <xsl:for-each select="$list/option[position() &gt; 1]">
            <option value="{value}">
                <xsl:choose>
                    <xsl:when test="$type_list = '1'">
                        <xsl:if test="value = $value">               
                            <xsl:attribute name="selected">selected</xsl:attribute>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="@selected='true'">               
                            <xsl:attribute name="selected">selected</xsl:attribute>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="text" disable-output-escaping="yes"/>
            </option>
    </xsl:for-each>
</xsl:template>        


<!-- INPUT FIELD -->
<xsl:template name="FIELD_input">
    <xsl:param name="type" select="'text'"/>
    <xsl:param name="name" />
    <xsl:param name="value" />
    <xsl:param name="label" />
    <xsl:param name="value_checked" select="'0'"/>
    <xsl:param name="required" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="maxlength" select="'30'"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="js_lookup" select="''"/>
    <xsl:param name="visible" select="''"/>
	<xsl:param name="change" select="''" />
    <xsl:param name="formatColor" select="'hex'"/>
    <xsl:param name="formlist" select="'false'" />
    <xsl:param name="separator" select="'false'"/>
      
        
       <xsl:variable name="v_type">
        <xsl:choose>
         <xsl:when test="$type='date' or $type = 'datetime' or $type = 'time' or $type = 'color'">
       		<xsl:value-of select="'text'"/>
         </xsl:when>
        <xsl:otherwise>
        	<xsl:value-of select="$type"/>
         </xsl:otherwise>
         </xsl:choose>
       </xsl:variable>
       
    <xsl:choose>
    	<xsl:when test="$type = 'file' or $type = 'color' or contains($type,'LOOKUP') or $type = 'date' or $type = 'datetime' or $type = 'time'">
        	<div class="itemIcon">
            	<xsl:if test="$type = 'file'">
            		<input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{$name}"/>
                	<span class="upload"></span>
                </xsl:if>
                <input type="{$v_type}" name="{$name}" value="{$value}" id="id_{$name}">
                    <xsl:call-template name="FIELD_validator">
                        <xsl:with-param name="type" select="$type" />
                        <xsl:with-param name="required" select="$required" />
                        <xsl:with-param name="readonly" select="$readonly" />
                        <xsl:with-param name="maxlength" select="$maxlength"/>
                        <xsl:with-param name="rel" select="$rel" />             
                        <xsl:with-param name="visible" select="$visible" /> 
                        <xsl:with-param name="change" select="$change" />
                        <xsl:with-param name="separator" select="$separator" /> 
                    </xsl:call-template>
                </input>
                <xsl:if test="$type = 'color'">
                	<input type="text" class="colorPicker notForm" relColor="id_{$name}" format="{$formatColor}" defaultColor="{$value}"/>
                </xsl:if>
                <xsl:if test="contains($type,'LOOKUP')">
                	<xsl:variable name="ad_hoc">
                        <xsl:choose>
                        <xsl:when test="$type='LOOKUP'">1</xsl:when>
                        <xsl:otherwise>0</xsl:otherwise>
                        </xsl:choose>
                	</xsl:variable>
        
                    <xsl:call-template name="lookup-tool">
                        <xsl:with-param name="action" select="$type" />
                        <xsl:with-param name="name" select="$name" />
                        <xsl:with-param name="js_lookup" select="$js_lookup" />
                        <xsl:with-param name="ad_hoc" select="$ad_hoc" />
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$type = 'date' or $type = 'datetime' or $type = 'time'"><div class="calendar"/></xsl:if> 
            </div>
        </xsl:when>
        <xsl:when test="$type = 'radio' or $type = 'checkbox'">
        	<div class="col-1-1">
                <input type="{$v_type}" name="{$name}" value="{$value}">
                    <xsl:call-template name="FIELD_validator">
                        <xsl:with-param name="type" select="$type" />
                        <xsl:with-param name="required" select="$required" />
                        <xsl:with-param name="readonly" select="$readonly" />
                        <xsl:with-param name="maxlength" select="$maxlength" />
                        <xsl:with-param name="rel" select="$rel" />             
                        <xsl:with-param name="visible" select="$visible" /> 
                        <xsl:with-param name="change" select="$change" />
                        <xsl:with-param name="separator" select="$separator" />  
                    </xsl:call-template>
                </input>
                <xsl:value-of select="text()" disable-output-escaping="yes"/>
                <xsl:if test="$required = 'true'"><span class="riquired">*</span></xsl:if>
            </div>
        </xsl:when>
        <xsl:otherwise>
            <input type="{$v_type}" name="{$name}" value="{$value}">
                <xsl:call-template name="FIELD_validator">
                    <xsl:with-param name="type" select="$type" />
                    <xsl:with-param name="required" select="$required" />
                    <xsl:with-param name="readonly" select="$readonly" />
                    <xsl:with-param name="maxlength" select="$maxlength" />
                    <xsl:with-param name="rel" select="$rel" />             
                    <xsl:with-param name="visible" select="$visible" /> 
                    <xsl:with-param name="change" select="$change" />
                    <xsl:with-param name="separator" select="$separator" />  
                </xsl:call-template>
            </input>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>


<!-- TEXTAREA FIELD -->
<xsl:template name="FIELD_textarea">  
    <xsl:param name="name" />
    <xsl:param name="value" />  
    <xsl:param name="required" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="maxlength" select="'100'"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="visible" select="''"/>
	<xsl:param name="change" select="''" />
    <xsl:param name="separator" select="'false'"/> 
         
    <textarea name="{$name}">
        <xsl:call-template name="FIELD_validator">
            <xsl:with-param name="type" select="'textarea'" />
            <xsl:with-param name="required" select="$required" />            
            <xsl:with-param name="readonly" select="$readonly" />
            <xsl:with-param name="maxlength" select="$maxlength" />
            <xsl:with-param name="rel" select="$rel" />             
            <xsl:with-param name="visible" select="$visible" />
			<xsl:with-param name="change" select="$change" /> 
            <xsl:with-param name="separator" select="$separator" /> 
        </xsl:call-template>        
        <xsl:value-of select="$value" disable-output-escaping="yes"/>
    </textarea>
</xsl:template>


<!-- RADIO-LIST/CHECKBOX-LIST FIELD -->
<xsl:template name="FIELD_list">
	<xsl:param name="type" />  
    <xsl:param name="name" />
    <xsl:param name="value" />  
    <xsl:param name="rel" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="list" />
    <xsl:param name="visible" select="''" />
	<xsl:param name="change" select="''" />
    
    <xsl:for-each select="$list/option">
    
    	<xsl:variable name="col">
            <xsl:choose>
                <xsl:when test="$list/option/@fildClass != ''"><xsl:value-of select="$list/option/@fildClass"/></xsl:when>
                <xsl:otherwise><xsl:text>col-1-1</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
    
    	<div class="{$col}">
            <input type="{$type}" name="{$name}" value="{value}">
               <xsl:if test="@selected='true'">
                  <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
                <xsl:call-template name="FIELD_validator">
                   <xsl:with-param name="type" select="$type" />
                   <xsl:with-param name="rel" select="$rel" />
                   <xsl:with-param name="readonly" select="$readonly" />                 
                   <xsl:with-param name="visible" select="$visible" />
                   <xsl:with-param name="change" select="$change" /> 
                </xsl:call-template> 
            </input>
            <xsl:value-of select="text" disable-output-escaping="yes"/>
        </div>
    </xsl:for-each>
</xsl:template>


<!-- SELECT/SELECT-LIST FIELD -->
<xsl:template name="FIELD_select">
	<xsl:param name="type" />  
    <xsl:param name="name" />
    <xsl:param name="value" />  
    <xsl:param name="required" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="list" />
    <xsl:param name="visible" select="''"/>
    <xsl:param name="type_list" select="''"/>
	<xsl:param name="change" select="''" />
    <xsl:param name="separator" select="'false'"/> 
    
	
    <select name="{$name}" chosen="select" id="{$name}" data-placeholder="{$list/option[position() = 1]}">
        <xsl:call-template name="FIELD_validator">
            <xsl:with-param name="type" select="'select'" />
            <xsl:with-param name="required" select="$required" />            
            <xsl:with-param name="readonly" select="$readonly" />
            <xsl:with-param name="rel" select="$rel" />
            <xsl:with-param name="change" select="$change" /> 
            <xsl:with-param name="visible" select="$visible" />
            <xsl:with-param name="separator" select="$separator" />           
        </xsl:call-template>
        
        <xsl:if test="$type='selectlist'">
            <xsl:attribute name="multiple">multiple</xsl:attribute>
        </xsl:if>              
    	
        <xsl:call-template name="FIELD_options">
			<xsl:with-param name="type_list" select="$type_list"/>
			<xsl:with-param name="value" select="$value"/>
        	<xsl:with-param name="list" select="$list" />
        </xsl:call-template>
    </select>
</xsl:template>

<!-- FIELD GENERATOR ONLY-->
<xsl:template name="GEN-FIELD-ONLY">
	<xsl:param name="formlist" select="'false'" />
    <xsl:param name="label" />
    <xsl:param name="value" /> 
    <xsl:param name="list" />
    <xsl:param name="value_desc"/>
    <xsl:param name="lookup" select="''" />
	<xsl:param name="type_list" select="''"/>
    <xsl:param name="separator" select="'false'"/>
     
     <xsl:variable name="v_name">
         <xsl:choose>
            <xsl:when test="$formlist = 'true'">
            	<xsl:value-of select="$label/@name"/><xsl:text>_fk</xsl:text>
            </xsl:when>
            <xsl:otherwise>
            	<xsl:value-of select="$label/@name"/>
            </xsl:otherwise>
         </xsl:choose>
     </xsl:variable>
          	
     <xsl:choose>
        <xsl:when test="$label/@type='textarea'">
            <xsl:call-template name="FIELD_textarea">               
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>
                <xsl:with-param name="required" select="$label/@required"/>
                <xsl:with-param name="readonly" select="$label/@readonly"/>
                <xsl:with-param name="maxlength" select="$label/@maxlength"/>
                <xsl:with-param name="rel" select="$label/@rel" />
                <xsl:with-param name="visible" select="$label/@visible" />  
				<xsl:with-param name="change" select="$label/@change" />
                <xsl:with-param name="separator" select="$separator" /> 
            </xsl:call-template>        
        </xsl:when>
        
        <xsl:when test="$label/@type='select' or $label/@type='selectchange' or $label/@type='selectlist'">
            <xsl:call-template name="FIELD_select">
                <xsl:with-param name="type" select="$label/@type"/>               
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>
                <xsl:with-param name="required" select="$label/@required"/>
                <xsl:with-param name="readonly" select="$label/@readonly"/>                
                <xsl:with-param name="rel" select="$label/@rel" />
                <xsl:with-param name="list" select="$list" />
                <xsl:with-param name="visible" select="$label/@visible" />
				<xsl:with-param name="type_list" select="$type_list"/> 
				<xsl:with-param name="change" select="$label/@change" />
                <xsl:with-param name="separator" select="$separator" /> 
            </xsl:call-template>        
        </xsl:when>
      
        <xsl:when test="$label/@type='radiolist'">
            <xsl:call-template name="FIELD_list">
                <xsl:with-param name="type" select="'radio'"/>               
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>                
                <xsl:with-param name="rel" select="$label/@rel" />                
                <xsl:with-param name="readonly" select="$label/@readonly"/>
                <xsl:with-param name="list" select="$list" />
                <xsl:with-param name="visible" select="$label/@visible" />  
				<xsl:with-param name="change" select="$label/@change" />
            </xsl:call-template>     
        </xsl:when>
        
         <xsl:when test="$label/@type='checkboxlist'">
            <xsl:call-template name="FIELD_list">
                <xsl:with-param name="type" select="'checkbox'"/>               
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>                
                <xsl:with-param name="rel" select="$label/@rel" />
                <xsl:with-param name="readonly" select="$label/@readonly"/>
                <xsl:with-param name="list" select="$list" />
                <xsl:with-param name="visible" select="$label/@visible" />
				<xsl:with-param name="change" select="$label/@change" /> 				
            </xsl:call-template>     
        </xsl:when>
        
         <xsl:when test="$label/@type='checkbox'">
            <xsl:call-template name="FIELD_input">
                <xsl:with-param name="type" select="$label/@type"/>
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value_checked" select="$value/text()"/>
                <xsl:with-param name="required" select="$label/@required"/>
                <xsl:with-param name="value" select="'1'"/>
                <xsl:with-param name="rel" select="$label/@rel" />
                <xsl:with-param name="readonly" select="$label/@readonly"/>
                <xsl:with-param name="visible" select="$label/@visible" />
				<xsl:with-param name="change" select="$label/@change" /> 
                <xsl:with-param name="label" select="$label"/> 
                <xsl:with-param name="separator" select="$separator" />
            </xsl:call-template>
        </xsl:when>
              
        <xsl:when test="$label/@type='hidden' or $label/@type='link'"></xsl:when>
        
        <xsl:when test="$label/@type='plaintext' and $formlist = 'false'">
            <xsl:call-template name="plaintext" >
            	<xsl:with-param name="value" select="$value/text()"/>
                <xsl:with-param name="name" select="$v_name"/>
            </xsl:call-template>
        </xsl:when>
        
        <xsl:when test="$label/@type='iframe' and $formlist = 'false'">
            <xsl:call-template name="iframe">
            	<xsl:with-param name="url" select="$value/text()"/>
                <xsl:with-param name="name" select="$v_name"/>
            </xsl:call-template>
        </xsl:when>

        <xsl:when  test="@type='signature' and $formlist = 'false'">
            <xsl:call-template name="signature">
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>
                <xsl:with-param name="desc" select="$value_desc"/>
            </xsl:call-template>
        </xsl:when>

        <xsl:when test="$label/@type='image' and $formlist = 'false'">
            <xsl:call-template name="image">
            	<xsl:with-param name="img" select="$value/text()"/>
                <xsl:with-param name="name" select="$v_name"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$label/@type = 'texteditor'">
            <xsl:call-template name="text-editor">
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>
                <xsl:with-param name="maxlength" select="$label/@maxlength"/>
            </xsl:call-template>
        </xsl:when>
        
        <xsl:when test="contains($label/@type,'vkb_')">
        	<div class="itemIcon">
                <xsl:call-template name="VirtualKeyBoard">
                    <xsl:with-param name="type" select="$label/@type"/>
                    <xsl:with-param name="rel" select="$v_name"/>
                    <xsl:with-param name="input_type" select="'password'"/>
                    <xsl:with-param name="input_name" select="$v_name" />
                </xsl:call-template>
           	</div>
      </xsl:when>
             
        <xsl:otherwise>
            <xsl:call-template name="FIELD_input">
                <xsl:with-param name="type" select="$label/@type"/>
                <xsl:with-param name="name" select="$v_name"/>
                <xsl:with-param name="value" select="$value/text()"/>
                <xsl:with-param name="required" select="$label/@required"/>
                <xsl:with-param name="readonly" select="$label/@readonly"/>
                <xsl:with-param name="rel" select="$label/@rel" />
                <xsl:with-param name="js_lookup" select="$lookup" />
                <xsl:with-param name="maxlength" select="$label/@maxlength"/>
                <xsl:with-param name="visible" select="$label/@visible" /> 
				<xsl:with-param name="change" select="$label/@change" />
                <xsl:with-param name="formatColor" select="$label/@format" />
                <xsl:with-param name="formlist" select="$formlist" /> 
                <xsl:with-param name="separator" select="$separator" /> 
            </xsl:call-template>
        </xsl:otherwise>
     </xsl:choose>         
</xsl:template>    

<!-- FIELD GENERATOR -->
<xsl:template name="GEN-FIELD">
    <xsl:param name="label" />
    <xsl:param name="value" /> 
    <xsl:param name="list" />
    <xsl:param name="value_desc" />
    <xsl:param name="lookup" select="''" />
    <xsl:param name="separator" select="'false'"/> 
    
    <xsl:variable name="col">
    	<xsl:choose>
        	<xsl:when test="$label/@type = 'texteditor' or $label/@type = 'iframe'"><xsl:text>col</xsl:text></xsl:when>
            <xsl:when test="$label/@type = 'textarea' or $label/@type = 'image' or $label/@type = 'radiolist' or $label/@type='checkboxlist'">
            	<xsl:choose>
                	<xsl:when test="$label/@class != ''"><xsl:value-of select="$label/@class"/></xsl:when>
                    <xsl:otherwise><xsl:text>col-1-4</xsl:text></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise><xsl:text>col-1-4</xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
        <xsl:when test="$label/@type='group'">
        	<div class="col" sep-name="{name()}">
                <xsl:call-template name="page-title">
                    <xsl:with-param name="title" select="$label/text()" />
                    <xsl:with-param name="class" select="'subtitle'" />
                </xsl:call-template>
            </div>
        </xsl:when>		
        <xsl:otherwise>
            <xsl:if test="$label/@type!='hidden'">
                <div class="{$col} item" item-name="{name()}">
                    <div class="igrp_item {$label/@type}">
                    	<xsl:if test="$label/@type = 'iframe' or $label/@type = 'image'">
                        	<xsl:attribute name="class">igrp_item <xsl:value-of select="$label/@type"/> addBorder</xsl:attribute>
                        </xsl:if>
                    	<xsl:if test="$label/@type='selectchange' or $label/@readonly='onchange' or $label/@change='true'">
                            <a id="id{$label/@name}" />
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="$label/@type='link'">
                                <xsl:if test="$label/@rel"> 
                                	<input type="link" desc="{$label/text()}" name="{$label/@name}" rel="F_{$label/@rel}" value="{$value/text()}" style="display:none;"/>
                                </xsl:if>
                                <xsl:variable name="_target">
                                    <xsl:choose>
                                        <xsl:when test="@target = '' or not(@target)">_blank</xsl:when>
                                        <xsl:otherwise><xsl:value-of select="@target"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <a href="{$value/text()}" class="link bClick" target="{$_target}" name="{$label/@name}">
                                    <xsl:value-of select="$label/text()" disable-output-escaping="yes"/> 
                                </a>
                            </xsl:when>
                            <xsl:when test="$label/@type = 'radio' or $label/@type = 'checkbox' or $label/@type = 'iframe' or $label/@type = 'image'"></xsl:when>
                            <xsl:otherwise> 
                                <label>
                                    <xsl:if test="$label/@required"><span class="riquired">*</span></xsl:if>        
                                    <xsl:value-of select="$label/text()" disable-output-escaping="yes"/>
                                </label> 
                            </xsl:otherwise>
                        </xsl:choose>                 
                        
                        <xsl:call-template name="GEN-FIELD-ONLY">
                            <xsl:with-param name="label"  select="$label" />
                            <xsl:with-param name="value"  select="$value" /> 
                            <xsl:with-param name="list" select="$list" />
                            <xsl:with-param name="lookup" select="$lookup" />
                            <xsl:with-param name="value_desc"  select="$value_desc"/>
                            <xsl:with-param name="separator" select="$separator" />
                        </xsl:call-template>          
                        <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                </div>
            </xsl:if>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>    


<!-- SIMPLE TABLE GENERATOR -->
<xsl:template name="GEN-SIMPLE-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="dialog" select="''"/>
    <xsl:param name="table" />
    
    <div class="box-table table-responsive">
        <ul class="contextMenu ctxSepListDialog" id="data-{$rel}" sep-name="btn-{$rel}">
            <li rel="{$rel}" class="IGRP_editRow operationTable" item-name="edit-{$rel}">
                <xsl:if test="$dialog != ''">
                    <xsl:attribute name="type"><xsl:value-of select="$dialog"/></xsl:attribute>
                </xsl:if>
                <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                <span><xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/></span>
            </li>
            <li rel="{$rel}" class="IGRP_delRow operationTable" item-name="del-{$rel}">
                <xsl:if test="$dialog != ''">
                    <xsl:attribute name="type"><xsl:value-of select="$dialog"/></xsl:attribute>
                </xsl:if>
                <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                <span><xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/></span>
            </li>
        </ul>
        <table rel="T_{$rel}" data-control="data-{$rel}">
            <thead>
                <tr>
                    <xsl:for-each select="$table/label/*[@type!='hidden' and @type!='group' and not(@visible)]">
                        <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and @type!='hidden'">
                            <th> 
                                <xsl:attribute name="class">
                                    <xsl:if test="@type = 'color'">tdcolor</xsl:if>
                                </xsl:attribute>
                                <xsl:value-of select="text()" disable-output-escaping="yes"/> 
                            </th>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:if test="not($table/value/row[position() = 1]/@nodelete) or not($table/value/row[position() = 1]/@noupdate)">
                        <th class="bEdDel"></th>
                    </xsl:if>
                </tr>
            </thead>
            
            <tbody>
                <xsl:for-each select="$table/value/row">
                    <xsl:variable name="pos" select="position()"/>             
                    <tr row="{$pos}">
                        <xsl:for-each select="*"> 
                            <xsl:variable name="nome" select="@name" />
                                <xsl:variable name="nome_desc">
                                <xsl:value-of select="name()" />
                                <xsl:text>_desc</xsl:text>
                            </xsl:variable>
                            
                            <xsl:variable name="separator_id"><xsl:value-of select="concat($rel,'_id')" /></xsl:variable>
                            
                            <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')"> 
                            
                                <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                                <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                                
                                <xsl:variable name="v_type">
                                    <xsl:choose>
                                        <xsl:when test="@visible or @type='group'"><xsl:value-of select="'hidden'"/></xsl:when>							
                                        <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                
                                <xsl:choose> 
                                    <xsl:when test="$v_type='hidden'">
                                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                        <xsl:if test="position()=1">
                                        	<input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                        </xsl:if>
                                    </xsl:when>

                                    <xsl:when test="$v_type='color'">
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                            <span class="color" style="background-color:{$value_desc}"></span>
                                            <input type="hidden" name="{@name}_fk" value="{text()}" />
                                            <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:when>
                                    
                                    <xsl:when test="$v_type='link' or $v_type='file'">
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">   
                                            <xsl:choose>
                                                <xsl:when test="text()!=''">
                                                    <xsl:variable name="_target">
                                                        <xsl:choose>
                                                            <xsl:when test="@target = '' or not(@target)">_blank</xsl:when>
                                                            <xsl:otherwise><xsl:value-of select="@target"/></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <a href="{text()}" class="link bClick" target="{$_target}">
                                                    <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                    </a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                	<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                </xsl:otherwise>
                                            </xsl:choose>                                 
                                            <input type="hidden" name="{@name}_fk" value="{text()}" />
                                            <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                            <xsl:if test="position()=1">
                                            	<span class="showResponsiveTable ctxmenu"></span>
                                            	<input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>        
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                            <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                            <input type="hidden" name="{@name}_fk" value="{text()}" />
                                            <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                            <xsl:if test="position()=1">
                                                <span class="showResponsiveTable ctxmenu"></span>
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:otherwise> 
                                </xsl:choose>                        
                            </xsl:if>
                        </xsl:for-each>
                        <td data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}"  data-row="{$pos}" class="bEdDel">
                            <xsl:if test="not(@noupdate)">
                                <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-{$rel}" rel="{$rel}" class="IGRP_editRow{$dialog}"/>
                            </xsl:if>
                            <xsl:if test="not(@nodelete)">
                                <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-{$rel}" rel="{$rel}" class="IGRP_delRow"/>
                            </xsl:if>					 
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>   
    </div>
</xsl:template>


<!-- LIST TABLE GENERATOR -->
<xsl:template name="GEN-LIST-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="sep" select="'0'" />
    <xsl:param name="table" />
    
    <div class="box-table table-responsive">  
        <table rel="T_{rel}" data-control="data-{$rel}" class="IGRP_table default-table">
            <thead>
                <tr>
                    <xsl:for-each select="$table/label/*[@type!='hidden' and not(@visible)]">
                        <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and @type!='hidden'">
                        
                            <xsl:choose>
                                <xsl:when test="@type='checkbox'">
                                    <th class="checkbox sorttable_nosort" align="center">
                                        <input type="checkbox" name="{@name}_all" value="" class="IGRP_checkall" />
                                        <xsl:value-of select="text()" disable-output-escaping="yes"/>
                                    </th>
                                </xsl:when>
                                <xsl:otherwise>                   	
                                	<th> <xsl:value-of select="text()" disable-output-escaping="yes"/></th>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </tr>
            </thead>
            
            <tbody>
                <xsl:for-each select="$table/value/row">
                    <xsl:variable name="pos" select="position()"/>
                    <tr row="{$pos}" class="default">
                        <xsl:for-each select="*"> 
                            <xsl:variable name="nome" select="@name" />
                                <xsl:variable name="nome_desc">
                                <xsl:value-of select="name()" />
                                <xsl:text>_desc</xsl:text>
                            </xsl:variable>
                            
                            <xsl:variable name="nome_check">
                                <xsl:value-of select="name()" />
                                <xsl:text>_check</xsl:text>
                            </xsl:variable>
                            
                            <xsl:variable name="separator_id"><xsl:value-of select="concat($rel,'_id')" /></xsl:variable>
                            
                            <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')">
                            
                                <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                                <xsl:variable name="value_check" select="../*[name()=$nome_check]/text()" />
                                <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                                
                                <xsl:variable name="v_type">
                                    <xsl:choose>
                                        <xsl:when test="@visible"><xsl:value-of select="'hidden'"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                
                                <xsl:choose>
                                    <xsl:when test="$v_type='hidden'"></xsl:when>
                                    <xsl:when test="$v_type='checkbox' or $v_type='radio'">
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}" class="checkbox">
                                            <xsl:if test="text()!='-0'">
                                                <input type="{@type}" name="{@name}" value="{text()}">
                                                <xsl:if test="$value_check=text()">
                                                	<xsl:attribute name="checked">checked</xsl:attribute>
                                            	</xsl:if>
                                            	</input>
                                            </xsl:if>
                                            <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:when>
                                    <xsl:when test="$v_type='link' or $v_type='file'">
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                            <xsl:choose>
                                                <xsl:when test="text()!=''">
                                                    <xsl:variable name="_target">
                                                        <xsl:choose>
                                                            <xsl:when test="@target = '' or not(@target)">_blank</xsl:when>
                                                            <xsl:otherwise><xsl:value-of select="@target"/></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <a href="{text()}" class="link bClick" target="{$_target}">
                                                    	<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                    </a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                	<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                            <xsl:value-of select="." disable-output-escaping="yes"/>
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>   
    </div>
</xsl:template>


<!-- FORM TABLE GENERATOR -->
<xsl:template name="GEN-FORM-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="table" />
    	<xsl:if test="not($table/value/row[position() = 1]/@noupdate)">
            <div class="col showResponsiveTable" item-name="add-{$rel}">
                <div class="addRowFormlist addRow">
                    <a rel="{$rel}" class="IGRP_addRowForm" >
                        <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                        <span><xsl:value-of select="$lngPath/separatorlist_dialog/add" disable-output-escaping="yes"/></span>
                    </a>
                </div>
            </div>
    	</xsl:if>
     <div class="box-table table-responsive">  
         <table class="IGRP_formlist" rel="T_{$rel}" data-control="data-{$rel}">
            <thead>
                <tr>
                  <xsl:for-each select="$table/label/*[@type!='hidden' and not(@visible)]">
                   <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and @type!='hidden'">
                    <th> <xsl:value-of select="text()" disable-output-escaping="yes"/> </th>
                   </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="not($table/value/row[position() = 1]/@nodelete) or not($table/value/row[position() = 1]/@noupdate)">
                  	<th class="fBtn">
                      <xsl:if test="not($table/value/row[position() = 1]/@noupdate)">
                        <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/add.png" name="add_{$rel}" rel="{$rel}" class="IGRP_addRowForm"/>
                      </xsl:if>
                  	</th>
                  </xsl:if>
                </tr>
                </thead>
             
              <tbody>
                <xsl:for-each select="$table/value/row">  
               	<xsl:variable name="pos" select="position()"/>           
                  <tr row="{$pos}">
                    <xsl:for-each select="*"> 
                    
                     <xsl:variable name="nome" select="@name" />
                     <xsl:variable name="tag" select="name()" />
                         <xsl:variable name="nome_desc">
                         	<xsl:value-of select="name()" />
                            <xsl:text>_desc</xsl:text>
                          </xsl:variable>
                       
					   		<xsl:variable name="nome_check">
                         	<xsl:value-of select="name()" />
                            <xsl:text>_check</xsl:text>
                          </xsl:variable>
                     
                           <xsl:variable name="separator_id">
                         	<xsl:value-of select="concat($rel,'_id')" />
                          </xsl:variable>
                          
                    
                    	 <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')"> 
                         
                          <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
						  <xsl:variable name="value_check" select="../*[name()=$nome_check]/text()" />
						  <xsl:variable name="check_value" select="../*[name()=$tag]/text()" />
                         <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                       
                          
                           <xsl:variable name="v_type">
                            <xsl:choose>
                              <xsl:when test="@visible">
                                <xsl:value-of select="'hidden'"/>
                             </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@type"/>
                             </xsl:otherwise>
                             </xsl:choose>
                           </xsl:variable>
                              
                              
                         <xsl:choose> 
                       <xsl:when test="$v_type = 'hidden'">
                                <input type="hidden" name="{@name}_fk" value="{text()}" />
                                <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                 <xsl:if test="position()=1">
                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                            	<td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                            	<xsl:choose>
                                	<xsl:when test="$v_type='file'">                             
                                    	<input type="file" name="{@name}_fk" />
                            			<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                    </xsl:when>
                                    <xsl:when test="$v_type='link'">
                                        <xsl:choose>
                                            <xsl:when test="text()!=''">
                                                <xsl:variable name="_target">
                                                    <xsl:choose>
                                                        <xsl:when test="@target = '' or not(@target)">_blank</xsl:when>
                                                        <xsl:otherwise><xsl:value-of select="@target"/></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:variable>
                                                <a href="{text()}" class="link bClick" target="{$_target}">
                                                    <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                            </xsl:otherwise>
                                        </xsl:choose>                               
                                        <input type="hidden" name="{@name}_fk" value="{text()}"/>
                                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                    </xsl:when>
                                    <xsl:when test="($v_type='text' and $value_desc != '')">
                                    	<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                    </xsl:when>
                                    <xsl:when test="$v_type='texteditor'">
                                    	<input type="text" name="{@name}_fk" value="{text()}" />
                                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                    </xsl:when>
                                    <xsl:when test="$v_type='checkbox' and (($value_desc != '' and $check_value != '') or ($check_value != ''))">
                                    	<xsl:if test="$check_value!='-0'">
                                           <input type="checkbox" name="{@name}_fk" value="{$check_value}">
                                            <xsl:if test="$value_check = $check_value">
                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                    		</xsl:if>	
                                    		</input>
                                   			<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
										</xsl:if>
                                   		<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    	<xsl:call-template name="GEN-FIELD-ONLY">
                                            <xsl:with-param name="formlist" select="'true'"/>
                                            <xsl:with-param name="label" select="ancestor::form/label/*[name()=$tag]" />
                                            <xsl:with-param name="value" select="." />
                                            <xsl:with-param name="type_list" select="1"/>
                                            <!--<xsl:with-param name="name" select="ancestor::form/label/*[name()=$tag]"/>-->
                                            <xsl:with-param name="list" select="ancestor::form/list/*[name()=$tag]" />
                                            <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$tag]" />
                                     	</xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="position()=1">
                                	<xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-{$rel}">
                                            <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="{$rel}" class="IGRP_delRowForm"/>
                                        </span>
                                    </xsl:if>
                                    <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                 </xsl:if>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose> 
                        	
                        </xsl:if>
                    </xsl:for-each>
                     <xsl:if test="not(@nodelete) or not(@noupdate)">
                    <td class="fBtn" data-row="{$pos}">
                        <xsl:if test="not(@nodelete)">
                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-{$rel}" rel="{$rel}" class="IGRP_delRowForm"/>
                        </xsl:if>
                     </td>
                      </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>   
        </div>
</xsl:template>


	<!-- ALL FORM FIELD GENERATOR -->
	<xsl:template name="GEN-FORM">
        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
        <div class="col addMarginTop addPaddingBottom10" sep-name="form">
            <xsl:for-each select="rows/content/form/label/*[@type!='hidden']">
                <xsl:variable name="nome" select="name()" />
                <xsl:variable name="nome_desc">
                    <xsl:value-of select="$nome"/><xsl:text>_desc</xsl:text>
                </xsl:variable>
                <xsl:choose>
                    <!-- SEPARADOR -->
                    <xsl:when test="@type='separator'">
                    	<div class="box-content resetPadding" sep-name="{name()}">
                            <xsl:call-template name="titlecollapser">
                            	<xsl:with-param name="title" select="text()"/>
                            </xsl:call-template>
                            <div class="box-collapser">
                                <xsl:for-each select="ancestor::form/la/*[(@rel=$nome)]">
                                	<xsl:if test="not(substring(@name,(string-length(name())-4),5) =  '_desc')">
                                    	<xsl:variable name="nome2" select="name()" />
                                        <xsl:call-template name="GEN-FIELD">
                                            <xsl:with-param name="label" select="." />
                                            <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome2]" />
                                            <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome2]" />
                                            <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome2]" />
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:for-each>
                            	<div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        
                        <!--<div class="col" rel="{name()}" name="sep_{name()}">             
                            <xsl:call-template name="page-title">
                            	<xsl:with-param name="title" select="text()" />
                            </xsl:call-template> 
                        </div>-->             
                    </xsl:when>
                    
                    <!-- biometric and  biometric_view-->
              	 	<xsl:when test="@type='biometric' or @type='biometric_view'">
                    	<xsl:variable name="view_only">
                            <xsl:choose>
                                <xsl:when test="@type='biometric'">
                                    <xsl:value-of select="'false'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'true'" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                    	<div class="col" sep-name="{name()}">
                        	<xsl:apply-templates mode="fingerprint" select="../../../fingerprint">
                            	<xsl:with-param name="view_only" select="$view_only"/>
                                <xsl:with-param name="vTitle" select="text()"/>
                            </xsl:apply-templates>
                        </div>
                    </xsl:when>
                    <!-- SEPARADOR LISTA-->
                    <xsl:when test="@type = 'separatorlist'">
                        <div class="box-content resetPadding" sep-name="{name()}">
                            <xsl:call-template name="titlecollapser">
                            	<xsl:with-param name="title" select="text()"/>
                            </xsl:call-template>
                            <div class="box-collapser">
                            	<div class="col" sep-name="group-{name()}"> 
                                    <xsl:for-each select="ancestor::form/label/*[(@rel=$nome)]">
                                        <xsl:if test="not(substring(@name,(string-length(name())-4),5) =  '_desc')">
                                            <xsl:variable name="nome2" select="name()" />
                                            <xsl:call-template name="GEN-FIELD">
                                                <xsl:with-param name="label" select="." />
                                                <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome2]"/>
                                                <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome2]"/>
                                                <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome2]"/>
                                                <xsl:with-param name="separator" select="'true'"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:for-each>
                                	<div class="_clear"/>
                                </div>
                                <xsl:call-template name="tools-bar-form-group">
                                    <xsl:with-param name="rel" select="name()"/>
                                </xsl:call-template>
                                <div class="col" sep-name="list-{name()}">
                                    <xsl:call-template name="GEN-SIMPLE-TABLE">
                                        <xsl:with-param name="rel" select="name()" />
                                        <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
                                    </xsl:call-template>
                                </div>
                            	<div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </xsl:when>
                    <!-- SEPARADOR Dialog-->
                    <xsl:when test="@type = 'separatordialog'">
                    	<div class="box-content resetPadding" sep-name="{name()}">
                            <xsl:call-template name="titlecollapser">
                            	<xsl:with-param name="title" select="text()"/>
                            </xsl:call-template>
                            <div class="box-collapser">
                            	<div class="D_{name()} IGRP_dialogbox" sep-name="group-{name()}">
                                	<div class="IGRP_dialogboxTop">
                         				<div class="titlecollapser"><xsl:value-of select="text()" disable-output-escaping="yes"/></div>
                            			<div class="IGRP_btn_close" rel="{name()}"/>
                         			</div>
                                    <div class="IGRP_dialogboxCenter">
                                        <xsl:for-each select="ancestor::form/label/*[(@rel=$nome)]">
                                            <xsl:if test="not(substring(@name,(string-length(name())-4),5) =  '_desc')">
                                                <xsl:variable name="nome2" select="name()" />
                                                <xsl:call-template name="GEN-FIELD">
                                                    <xsl:with-param name="label" select="." />
                                                    <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome2]"/>
                                                    <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome2]"/>
                                                    <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome2]"/>
                                                    <xsl:with-param name="separator" select="'true'"/>
                                                </xsl:call-template>
                                            </xsl:if>
                                        </xsl:for-each>
                                    	<div class="_clear"/>
                                    </div>
                                    <div class="dialog_btnContainer" sep-name="op-{name()}">
                                        <div class="col">
                                            <div class="addRow separador">
                                                <a rel="{name()}" class="IGRP_row_confirm" item-name="save-{name()}">
                                                	<img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" />
                                                	<span>
                                                    	<xsl:value-of select="$lngPath/separatorlist_dialog/save" disable-output-escaping="yes"/>
                                                    </span>
                                                </a>
                                                <a rel="{name()}" class="IGRP_row_confirmClose" item-name="save-close-{name()}">
                                                	<img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" />
                                                	<span>
                                                    	<xsl:value-of select="$lngPath/separatorlist_dialog/save_close" disable-output-escaping="yes"/>
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                	<div class="_clear"/>
                                </div>
                                <xsl:call-template name="tools-bar-form-group">
                                	<xsl:with-param name="class" select="'IGRP_addRow_diag'"/>
                                    <xsl:with-param name="rel" select="name()"/>
                                </xsl:call-template>
                                <div class="col" sep-name="list-{name()}">
                                    <xsl:call-template name="GEN-SIMPLE-TABLE">
                                        <xsl:with-param name="rel" select="name()" />
                                        <xsl:with-param name="dialog" select="'_diag'" />
                                        <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
                                    </xsl:call-template>
                                </div>
                            	<div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </xsl:when>
                    <!-- Lista simples-->
                    <xsl:when test="@type='list'">
                    	<div class="box-content resetPadding" sep-name="{name()}">
                            <xsl:call-template name="titlecollapser">
                            	<xsl:with-param name="title" select="text()"/>
                            </xsl:call-template>
                            <div class="box-collapser">
                                <xsl:call-template name="GEN-LIST-TABLE">
                                    <xsl:with-param name="rel" select="name()" />
                                    <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
                                </xsl:call-template>
                            	<div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </xsl:when>
                    <!-- iframe-->
                    <xsl:when test="@type='iframe'">
                    	<xsl:if test="not(@rel)">
                            <div class="box-content resetPadding" sep-name="{name()}">
                                <xsl:call-template name="iframe">
                                    <xsl:with-param name="url" select="ancestor::form/value/*[name()=$nome]"/>
                                    <xsl:with-param name="name" select="ancestor::form/value/*[name()=$nome]/@name"/>
                                </xsl:call-template>
                            </div>
                        </xsl:if>
                    </xsl:when>
                    <!-- images-->
                    <xsl:when test="@type='image'">
                    	<xsl:if test="not(@rel)">
                            <div class="box-content resetPadding" sep-name="{name()}">
                                <xsl:call-template name="image">
                                    <xsl:with-param name="img" select="ancestor::form/value/*[name()=$nome]"/>
                                    <xsl:with-param name="name" select="ancestor::form/value/*[name()=$nome]/@name"/>
                                </xsl:call-template>
                            </div>
                        </xsl:if>
                    </xsl:when>
                    <!-- plaintext-->
                    <xsl:when test="@type='plaintext'">
                    	<xsl:if test="not(@rel)">
                            <div class="box-content resetPadding" sep-name="{name()}">
                                <xsl:call-template name="plaintext">
                                    <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome]"/>
                                    <xsl:with-param name="name" select="ancestor::form/value/*[name()=$nome]/@name"/>
                                </xsl:call-template>
                            </div>
                        </xsl:if>
                    </xsl:when>
                    <!-- texteditor-->
                    <xsl:when test="@type='texteditor'">
                    	<xsl:if test="not(@rel)">
                            <div class="box-content resetPadding" sep-name="{name()}">
                                <xsl:call-template name="text-editor">
                                    <xsl:with-param name="name" select="ancestor::form/value/*[name()=$nome]/@name"/>
                                    <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome]"/>
                                    <xsl:with-param name="maxlength" select="ancestor::form/label/*[name()=$nome]/@maxlength"/>
                                </xsl:call-template>
                            </div>
                        </xsl:if>
                    </xsl:when>
                    <!--formlist-->
                    <xsl:when test="@type='formlist'">
                    	<div class="box-content resetPadding" sep-name="{name()}">
                            <xsl:call-template name="titlecollapser">
                            	<xsl:with-param name="title" select="text()"/>
                            </xsl:call-template>
                            <div class="box-collapser">
                                <xsl:call-template name="GEN-FORM-TABLE">
                                    <xsl:with-param name="rel" select="name()" />
                                    <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
                                </xsl:call-template>
                            	<div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </xsl:when>
                    <!-- OUTROS CAMPOS-->
                    <xsl:otherwise>
                        <xsl:if test="not(@rel) and @type != 'group'">
                            <xsl:call-template name="GEN-FIELD">
                                <xsl:with-param name="label" select="." />
                                <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome]" />
                                <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome]" />
                                <xsl:with-param name="value_desc" select="ancestor::form/value/*[name()=$nome_desc]/text()"/>
                                <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome]" />
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>