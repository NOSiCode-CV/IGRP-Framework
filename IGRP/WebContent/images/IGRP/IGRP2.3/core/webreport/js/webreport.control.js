var wbControl = {
	pageControl : function(){

	},
	qrcode : function(){
		var options = {
	    	'size':100,
	    	'color':'#3a3',
	    	'text':qrcodeResult
	  	}; 

	  	$('div[size="A4"] .footer').each(function(i,e){
    		$(containerQrcode, $(e)).empty().qrcode(options);
  		});
	},
	init: function(){
		wbControl.qrcode();
	}
};

$(function() {
	wbControl.init();
});