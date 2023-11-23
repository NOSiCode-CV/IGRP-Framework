(function(){

    const selector = '.select-choices';

    $.IGRP.component('choices',{

        list : {},

        get : (id)=>{
            return $.IGRP.components.choices.list[id]
        },

        init : (elements = null,options)=>{

            var elements = elements ? elements : $(selector);
            
            elements.each( (i,el)=>{
                const id = $(el).attr('id') || $.IGRP.utils.unique()+'-select';
               
                if(!$.IGRP.components.choices.list[id]){
                    $(el).attr(id);
                    $.IGRP.components.choices.list[id] = new Choices( el );
                }

            });
        }

    }, true)

})();