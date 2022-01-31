(function(){
	
	var com;

    $.IGRP.component('stepcontent',{
        init:function(){

			com = this;

            $('.step-app').steps({
                onChange: function (currentIndex, newIndex, stepDirection) {
                  
                  return true;
                },
                onFinish: function () {
                  alert('Wizard Completed');
                }
              });

		}
    },true);
})();