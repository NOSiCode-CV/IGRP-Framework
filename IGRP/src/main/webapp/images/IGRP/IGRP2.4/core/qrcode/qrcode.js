(function(){
   var com;
   $.IGRP.component('qrcode',{
   	set  : function(p){
   		$(p.obj).empty().qrcode({
   			   size      : p.size,
               //render  : "table",
	    		  color      : p.color,
	    		  text       : p.text,
	    		  background : p.background
   			});
   		},
     	init : function(){
        	com = this;

        	$('.qrcode').each(function(i,e){
        		console.log($(e));
    			com.set({
    				obj         : $(e).attr('rel'),
               size        : $(e).attr('size')       || 120,
    				color       : $(e).attr('color')      || '#333',
    				text        : $(e).attr('text'),
    				background  : $(e).attr('background') || '#fff'
    			});
  			});
      	}
   },true);
})();
