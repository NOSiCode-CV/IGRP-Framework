(function () {
  var GEN = VARS.getGen();

  GEN.declareContainer({
    name: "tilebox",

    container:function(name, params) {
      var component = this;

      const BackgroundProperties = GEN.getGlobalProperty(
        "button-appearance-properties"
      );

      const IconProperties = GEN.getGlobalProperty("icons-property");

      CONTAINER.call(component, name, params);

      component.xml.structure = 'form';

      component.includes = {

        js :[ { path:'/components/tilebox/tilebox.js' }],
        css:[ { path:'/components/tilebox/tilebox.css'}]

    };

      component.ready = function () {

        component.unsetProprieties(["hasTitle"]);

        component.propertiesOptions.title = {
            name         : 'title',
            label        : 'Title',
            isField      : true,
            valuePersist : false

        }

        component.setProperty({
          name      :'txt',
          label     :'Url Text',
          value     :'Read More...',
          isField   : true,
          //valuePersist : true 
        });
  
        component.setProperty({
          name      :'url',
          label     :'Url',
          value     :'http://www.example.com' ,
          isField   : true,
          //valuePersist : true 
        });

        component.setPropriety({
            name    : 'val',
            label   : 'Valor',
            value   : ""+Math.floor((Math.random() * 99) + 1),
            isField : true,
            valuePersist : false
        });
        
        component.setPropriety({
            name    : 'perc',
            label   : 'Percentagem',
            value   : ""+Math.floor((Math.random() * 99) + 1),
            isField : true,
            valuePersist : false
        });

        BackgroundProperties(component,{
            name: 'color',
            showbtnStyle : false,
            isField   : true,
            valuePersist : true,
        });

        IconProperties(component,{
					name:'icn',
					value:'fa-info',
					isField   : true,
					valuePersist : false,
					showPosition : false
				});
        
      };
    },
  });
})();
