(function(){

    class Table {

        table = null;

        name = null;

        constructor(item) {
            this.name = $(item).attr('item-name');
        }

        reset(){
            this.filterFields().each((i,item)=>$(item).val('').trigger('change'))
            this.filter();
        }   

        filter(){

            const object = {};
           
            this.filterFields().serializeArray().forEach( (item,i)=>{
                object[item.name] = item.value;
            }); 

            this.html().addClass('xml-xsl-loading position-relative');
           
            $.get(this.filterUrl(),object).then( (d)=>{
                const { app, page } = $.IGRP.info;
                $.IGRP.utils.xsl.transform({
                    xsl    : `${path}/app/${app}/${page}/${page}.xsl`,
                    xml    : d,
                    nodes  : ['table_1'],
                    replaceSelector : '.table-responsive'
                });
            });

            return false;
        }

        
        html(){
            return $('.igrp-table[item-name="'+this.name+'"]')
        }

        filterFields(){
            return this.html().find('.fields :input[name]');
        }

        filterUrl(){
            return this.html().find('.card-filter').attr('remote-filter')
        }

  
    }

    const IGRPTableComponents = {

        items : {},

        get : (name) => IGRPTableComponents.items[name] || null,

        init:()=>{

            $('.igrp-table').each( function(i,item){
                const table = new Table( item );
                const name = table.name;
                IGRPTableComponents.items[name] = table;
            });

            $(document).on('click', '.igrp-table-filter-action', function(e){
                const actionBtn = this;
                const table = $(actionBtn).parents('.igrp-table');
                const tableID = table.attr('item-name');
                
                IGRPTableComponents.get(tableID)?.filter();
                
                return false;
            });

            $(document).on('click', '.igrp-table-reset-action', function(e){
                const actionBtn = this;
                const table = $(actionBtn).parents('.igrp-table');
                const tableID = table.attr('item-name');
                
                IGRPTableComponents.get(tableID)?.reset();
                
                return false;
            });

        }
    };


    $.IGRP.component('table_ext', IGRPTableComponents, true);

})();