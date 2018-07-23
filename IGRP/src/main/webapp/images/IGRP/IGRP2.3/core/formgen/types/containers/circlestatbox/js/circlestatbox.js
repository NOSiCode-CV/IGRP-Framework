this[VARS.name].declareContainer({
	name:'circlestatbox',
	container:function(name,params){
		CONTAINER.call(this,name,params);

		var GEN = VARS.getGen();
		var container = this;

		container.xml.structure = 'form';

		container.includes = {
			//xsl: ['circlestatbox'],
			css: [ { path:'/plugins/circlestatbox/circlestatbox.css' } ],
            js : [
                { path:'/plugins/circlestatbox/jquery.knob.modified.js' },
                { path:'/plugins/circlestatbox/igrp.circlestatbox.init.js' }
            ]
		};

		container.ready = function(){

			container.unsetProprieties(['hasTitle']);

			container.setProperty({
				name      :'title',
				label     :'Circle Box Title',
				value     :'Circle Box Title',
				isField   : true,
				valuePersist : true
			});

            container.setProperty({
                name      :'lbl',
                label     :'Percent Text',
                value     :'percent',
                isField   : true,
                valuePersist : true
            });

			container.setProperty({
				name      :'val',
				label     :'Percent Value',
				value     :""+((Math.random() * 99) + 1).toFixed(1),
				isField   : true
			});

			container.setProperty({
				name      :'desc',
				label     :'Description',
				value     :'Some Text Here',
				isField   : true,
				valuePersist : true
			});

			container.setProperty({
				name      :'url',
				label     :'Link',
				value     :'http://www.example.com',
				isField   : true
			});

			GEN.setTargetAttr(container,{
				value:'modal'
			});

			container.setPropriety({
				name:'bg',
				label:'Background',
				value:{
					value:'cp-cyan',
					list:{
						items: $.IGRP.components.colorPalettes.colors ,
						itemTemplate:'<span label="#label#" class="#value#" style="height:20px;width:20px;"></span>',
					},
					size:'12'
				},
				isField   : true,
				valuePersist : true
			});

            container.setPropriety({
                name:'csize',
                label :'Size',
                value:{
                    value: 'small',
                    options:[
                        {value : 'small', label : 'Small'},
                        {value : 'medium', label : 'Medium'},
                        {value : 'big', label : 'Big'}
                    ]
                }
            });
            
		}

		container.onDrawEnd = function(){
		    $.IGRP.components.circlestatbox.init();
        }
	}
});