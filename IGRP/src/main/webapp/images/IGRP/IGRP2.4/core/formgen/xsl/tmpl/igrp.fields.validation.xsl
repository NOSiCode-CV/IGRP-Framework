<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="igrp-field-validation">
	<style>
		.field-annotation-input{
			display:none;
		}
		.validations-message{
			padding:0 20px;
		}
		#igrp-field-annotations-list{
			padding:0;
			margin-top:-15px;
		}
	</style>
	<div class="box gen-container-item clean" gen-class="" item-name="field_validations">
	<div class="validations-message"></div>
	  <div class="box-body IGRP-separatorlist" id="igrp-field-annotations-list" tag="field_validations" dialog="false">
	    <div class="splist-form-holder">
	      <div class="splist-form" role="form">
	        <div class="col-sm-6 form-group gen-fields-holder" item-name="annotation" item-type="select">
	          <label for="annotation">Annotation</label>
	          <select class="form-control select2 " id="field_validations_annotation" name="annotation"></select>
	        </div>
	        <div class="form-group col-sm-6 gen-fields-holder field-annotation-input" item-name="value" item-type="text">
	          <label for="value">
	            <span>Value</span>
	          </label>
	          <input type="text" value="" class="form-control " id="value" name="value" placeholder=""/>
	        </div>
	        <div class="form-group col-sm-3 gen-fields-holder field-annotation-input" item-name="integer" item-type="number">
	          <label for="integer">
	            <span>Integer</span>
	          </label>
	          <input type="number" value="" min="" max="" class="form-control " id="integer" name="integer" maxlength="250" placeholder=""/>
	        </div>
	        <div class="form-group col-sm-3 gen-fields-holder field-annotation-input" item-name="numeric" item-type="number">
	          <label for="numeric">
	            <span>Decimals</span>
	          </label>
	          <input type="number" value="" min="" max="" class="form-control " id="numeric" name="numeric" maxlength="250" placeholder=""/>
	        </div>
	        <div class="form-group col-sm-3 gen-fields-holder field-annotation-input" item-name="min" item-type="number">
	          <label for="min">
	            <span>Min</span>
	          </label>
	          <input type="number" value="" min="" max="" class="form-control " id="min" name="min" maxlength="250" placeholder=""/>
	        </div>
	        <div class="form-group col-sm-3 gen-fields-holder field-annotation-input" item-name="max" item-type="number">
	          <label for="max">
	            <span>Max</span>
	          </label>
	          <input type="number" value="" min="" max="" class="form-control " id="max" name="max" maxlength="250" placeholder=""/>
	        </div>
	        <div class="form-group col-sm-12 gen-fields-holder" item-name="message" item-type="text">
	          <label for="message">
	            <span>Message</span>
	          </label>
	          <input type="text" value="" class="form-control " id="message" name="message" maxlength="250" placeholder=""/>
	        </div>
	      </div>
	    </div>
	    <div class="table-box box-body box-table-contents splist-table">
	      <table rel="T_field_validations" id="field_validations" class="table table-striped gen-data-table">
	        <thead>
	          <tr>
	            <th align="" item-name="annotation">
	              <span>Annotation</span>
	            </th>
	            
	            <th align="" item-name="message">
	              <span>Message</span>
	            </th>
	            <th class="table-btn">
	              <a class="table-row-add btn-xs btn btn-primary" title="Add" data-toggle="tooltip" data-placement="left">
	                <i class="fa fa-plus"/>
	              </a>
	            </th>
	          </tr>
	        </thead>
	        <tbody></tbody>
	      </table>
	    </div>
	  </div>
	</div>
	
	</xsl:template>
	
</xsl:stylesheet>