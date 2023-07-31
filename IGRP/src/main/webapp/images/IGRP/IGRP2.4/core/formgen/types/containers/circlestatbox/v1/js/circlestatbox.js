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

			container.unsetProprieties(['title','hasTitle']);

			container.setProperty({
				name      :'tit',
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
				value     :'58',
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
		}

		container.onDrawEnd = function(){
		    $.IGRP.components.circlestatbox.init();
        }
	}
});