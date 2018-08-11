(function(){
   	var com;
   	$.IGRP.component('html2pdf',{
   		onLoad : function(){
   			var pdf = new jsPDF('p', 'mm', 'a4');
	        /*var canvas = pdf.canvas;
	        canvas.height = 72 * 11;
	        canvas.width=72 * 8.5;*/
	        // var width = 400;
	        html2pdf(
	        	document.body, pdf, function(pdf) {
		            var iframe = document.createElement('iframe');
		            iframe.setAttribute('style','position:absolute;right:0; top:0; bottom:0; height:100vh; width:100%');
		            iframe.setAttribute('type','application/pdf');
		           $('body').html('');
		            document.body.appendChild(iframe);
		            iframe.src = pdf.output('datauristring');
	            }
	        );
   		},
   		init : function(){
        	com = this;

        	//com.onLoad();
        }
	},true);
})();