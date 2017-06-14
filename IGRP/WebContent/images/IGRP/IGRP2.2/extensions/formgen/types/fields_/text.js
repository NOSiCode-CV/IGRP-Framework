var TEXTFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;


	/*field.templates.view ='<div class="groupView borderColor">'+
				    		'<span class="viewLabel">#label#</span>'+
				    		'<span class="viewValue">#value#</span>'+
						'</div>';
							
							
	field.templates.form ='<div class="col-1-4 item" item-name="#tag#">'+
                            '<div class="igrp_item text">'+
                              '<label>'+
                                '<xsl:if test="string-length(#labelPath#) >45">'+
                                  '<xsl:attribute name="title">#label#</xsl:attribute>'+
                                '</xsl:if>'+
                                '#label#'+
                              '</label>'+
                              '<input type="text" name="#nameAttr#" value="#valueAttr#" class="text" maxlength="#.maxLength/attr.#" rel="F_#parentTag#">'+
                                '<xsl:call-template name="FIELD_validator">'+
                                  '<xsl:with-param name="field" select="#labelPath#"/>'+
                                '</xsl:call-template>'+
                              '</input>'+
                              '<div class="_clear"/>'+
                            '</div>'+
                           ' <div class="_clear"/>'+
                          '</div>';

	field.templates.table ='<th>#label#</th>';	*/			
}

this[VARS.name].declareField({
	type:'text',
	field:TEXTFIELD
});