(function(){

    var GEN = VARS.getGen();
    
    GEN.convertTo2dot4 = (data)=>{
        //transform toolsbar
        transformComponents(data, 'toolsbar', (component)=>{
            if(component.fields && component.fields[0]){
                component.fields.forEach( (field)=>{
                    setButtonProps(field);
                })
            }
        });

        //table ctx menu
        transformComponents(data, 'table', (component)=>{
            if(component.contextMenu && component.contextMenu[0]){
                component.contextMenu.forEach( (field)=>{
                    setButtonProps(field);
                    field.properties.btnStyle = "btn-ghost";
                })
            }
        });

        //form ctx menu
        transformComponents(data, 'form', (component)=>{
            if(component.contextMenu && component.contextMenu[0]){
                component.contextMenu.forEach( (field)=>{
                    setButtonProps(field);
                   
                })
            }
        });
    }

    const setButtonProps = (btn)=>{
        btn.properties.iconLib = "fontawesome";
        btn.properties.iconPosition = "left";
        if(btn.properties.class == "black")
            btn.properties.class = "dark";
        if(btn.properties.class == "grey")
            btn.properties.class = "dark";
    }


    const transformComponents = (data, type, transformer)=>{
        if(data?.rows && data.rows[0]){
            data.rows.forEach( (row)=>{
               if(row.columns[0]){
                row.columns.forEach( (col)=>{
                    if(col.containers[0]){
                        col.containers.forEach( (com)=>{
                            if(com.proprieties.type ===type)
                                transformer(com);
                        })
                    }
                });
               }
            })
        }
    }

    const iconsMapFaToRemix = {
        "fa-trash" : ""
    }

    

})();