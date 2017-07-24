(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "jquery.validate.min"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: PT (Portuguese; português)
 * Region: PT (Portugal)
 */
 try{
	$.extend($.validator.messages, {
		required: JSMSG_VALIDATE_FILD_REQUIRED,
		remote: "Por favor, corrija este campo.",
		email: JSMSG_VALIDATE_FILD_EMAIL,
		url: JSMSG_VALIDATE_FILD_URL,
		date: JSMSG_VALIDATE_FILD_DATE,
		dateISO: "Por favor, introduza uma data v&aacute;lida (ISO).",
		number: JSMSG_VALIDATE_FILD_NUMBER,
		digits: "Por favor, introduza apenas d&iacute;gitos.",
		creditcard: "Por favor, introduza um n&uacute;mero de cart&atilde;o de cr&eacute;dito v&aacute;lido.",
		equalTo: "Por favor, introduza de novo o mesmo valor.",
		extension: "Por favor, introduza um ficheiro com uma extens&atilde;o v&aacute;lida.",
		maxlength: $.validator.format("Por favor, n&atilde;o introduza mais do que {0} caracteres."),
		minlength: $.validator.format("Por favor, introduza pelo menos {0} caracteres."),
		rangelength: $.validator.format("Por favor, introduza entre {0} e {1} caracteres."),
		range: $.validator.format("Por favor, introduza um valor entre {0} e {1}."),
		max: $.validator.format("Por favor, introduza um valor menor ou igual a {0}."),
		min: $.validator.format("Por favor, introduza um valor maior ou igual a {0}."),
		nifES: "Por favor, introduza um NIF v&aacute;lido.",
		nieES: "Por favor, introduza um NIE v&aacute;lido.",
		cifES: "Por favor, introduza um CIF v&aacute;lido."
	});
 }catch(e){null;}

}));