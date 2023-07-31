/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.removePlugins = 'save,newpage,format,pagebreak';
	config.allowedContent = true;
	config.jqueryOverrideVal = true;
	config.resize_minHeight = 400;
};

CKEDITOR.on( 'instanceReady', function(ev) {
	var element = $(ev.editor.element.$);

	if(element.parents('.form-group:first').attr('required'))
		element.addClass('required');

	ev.editor.on('change',function(ed){
		var element = ed.editor.element,
			parents = $(element.$).parents('.form-group:first'),
			value   = ed.editor.getData(),
			error   = $('label.form-validator-label',parents);

		element.setValue(value);

		if(error[0]){
			
			var length = value.replace(/<[^>]*>/gi, '').trim().length ? 'hide' : 'show';

			error[length]();
		}	
	});
});
