/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'pt';
	//config.uiColor = '#AADC6E';
	config.allowedContent = true;
	config.removePlugins = 'save,newpage,format,pagebreak';
	config.jqueryOverrideVal = true;
	config.resize_minHeight = 400;
	config.extraPlugins = 'newpage2';
};