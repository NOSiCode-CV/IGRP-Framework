$(function() {
	var options = {
		'size':100,
		'color':'#3a3',
		'text':qrcodeResult
	}; 
	$(containerQrcode).empty().qrcode(options);
});