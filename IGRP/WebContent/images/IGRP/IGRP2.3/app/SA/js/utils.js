//JQUERY CONTAINS INSENSITIVE
$.expr[":"].contains = $.expr.createPseudo(function(arg) {
    return function( elem ) {
        return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
    };
});

var utils = {
	showNotify:function(p){
		$.notify({
				message:p.message,
			},{
				type:p.type,
				placement: {
					from: "top",
					align: "rigth"
				},
				animate: {
					enter: 'animated fadeInDown',
					exit: 'animated fadeOutUp'
				}
			}
		);
	},
	htmlEncode:function(str){
		return str?jQuery('<div />').text(str).html():"";
	},
	htmlDecode:function(str){
		return str?jQuery('<div />').html(str).text():"";
	},
	getUrl:function(url){
		return url += url.indexOf('?') !=-1?'&':'?'; 
	},
	callNsweb:function(p){
		$('.sa-nsweb').attr('src',"nsweb:"+JSON.stringify(p));
	}
}