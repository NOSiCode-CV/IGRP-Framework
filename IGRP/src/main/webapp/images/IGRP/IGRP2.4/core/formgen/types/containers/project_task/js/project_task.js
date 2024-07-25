(function(){
    var GEN = VARS.getGen();
    GEN.declareContainer({
      name: "project_task",

        container:function(name,params){
            var component = this;

        const BackgroundProperties = GEN.getGlobalProperty(
            "button-appearance-properties"
          );

        CONTAINER.call(this, name, params);

        component.xml.structure = "form";

            component.includes = {
          css: [{ path: "/components/project_task/project_task.css" }],
            };
        
        component.ready = function () {
          BackgroundProperties(component, {
            name: "color",
            showbtnStyle: false,
            isField: true,
            valuePersist: true,
          });

            component.unsetProprieties(["hasTitle"]);

            component.propertiesOptions.title = {
            name: "title",
            label: "Title",
                isField      : true,
            valuePersist: false,
          };

            component.ready = function(){
                component.setProperty({
              name: "subhead",
              label: "Subtítulo",
              value: "Project Managment",
              isField: "true",
              valuePersist: false,
            });

                // BackgroundProperties(component,{
                //     name: 'color',
                //     showbtnStyle : false,
                //     isField   : true,
                //     valuePersist : true,
                // });
          };
        };
      },
    });
  })();
