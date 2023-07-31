<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="igrp-field-validation">
		<div id="igrp-field-validation" class="row">
		
		</div>
		
		<div class="box box-table-contents gen-container-item " item-name="igrp-validation-fl">
		  <div class="box-body table-box " id="igrp-validation-fl-wrapper">
		    <table id="igrp-validation-fl" class="table table-striped gen-data-table IGRP_formlist noupdate nodelete" rel="T_igrp-validation-fl" data-control="data-igrp-validation-fl">
		      <thead>
		        <tr>     
		          <th class=" gen-fields-holder" align="" ></th>
		          <th align="" show-label="" class="plaintext gen-fields-holder">
		            <span>Annotation</span>
		          </th>
		           
		          <th align="" show-label="" class="text gen-fields-holder">
		            <span>Message</span>
		          </th>
		          <th align="" show-label="" class="text gen-fields-holder">
		            <span>Value</span>
		          </th>
		        </tr>
		      </thead>
		      <tbody>
		      	
		      	<tr row="0" class="validation-clonable-tr">
  
				  <input type="hidden" name="p_igrp-validation-fl_id" value=""/>
				
				  <td class="validation-check-type" align="" data-row="0" item-name="check" item-type="radio" style="width:55px">
				    <div class="" item-name="check" item-type="radio">
				      <label class="container-box">
				        <input type="hidden" name="p_check_fk_desc" value="1" />
				        <input type="radio" name="p_check_fk" value="1" class="validation-check-input" rel="F_igrp-validation-fl"/>
				        <span class="mark-class"/>
				      </label>
				    </div>
				  </td>
				
				  <td align="" data-row="0" data-title="" class="plaintext" item-name="annotation" item-type="plaintext">
				    <input type="hidden" name="p_annotation_fk_desc" value=""/>
				    <input type="hidden" name="p_annotation_fk" value="" class="plaintext form-control" rel="F_igrp-validation-fl"/>
				    <p item-name="annotation" item-type="plaintext"></p>
				  </td>
				  
				  
				
				  <td align="" data-row="0" data-title="" class="text" item-name="message" style="width:220px;">
				    <input type="hidden" name="p_message_fk_desc" value=""/>
				    <div class="form-group" item-name="message" item-type="text">
				      <input type="text" disabled="true" name="p_message_fk" value="" class="text form-control" rel="F_igrp-validation-fl" placeholder="Message"/>
				    </div>
				  </td>
				  
				  <td align="" data-row="0" data-title="" class="text" item-name="value" item-type="text"  style="width:120px;">
				    <input type="hidden" name="p_value_fk_desc" value=""/>
				    <div class="form-group" item-name="value" item-type="text">
				      <input type="text"  name="p_value_fk" value="" class="text form-control" rel="F_igrp-validation-fl" placeholder=""/>
				    </div>
				  </td>
				
				</tr>
		      
		      </tbody>
		    </table>
		  </div>
		</div>
		
	</xsl:template>
	
</xsl:stylesheet>