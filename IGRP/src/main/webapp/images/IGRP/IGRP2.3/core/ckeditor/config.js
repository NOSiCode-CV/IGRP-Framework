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
	ev.editor.on('change',function(ed){
		ed.editor.element.setValue(ed.editor.getData());
	});
});
