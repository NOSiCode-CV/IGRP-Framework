(function(){

    class Table {

        element = null;
        table = null;
        name = null;
        datatable = null;
        
        constructor(item) {
            this.element = item;
            this.name = $(item).attr('item-name');
            this.table = $('table',item);

            this.events();
            
            if( $(item).hasClass('datatable') )
                this.setDataTable();  
        }

        transform ( url, params ){
            $.get( url, params).then( ( d )=>{
                const { app, page } = $.IGRP.info;
                $.IGRP.utils.xsl.transform({
                    xsl    : `${path}/app/${app}/${page}/${page.capitalizeFirstLetter()}.xsl`,
                    xml    : d,
                    nodes  : ['table_1'],
                    method:'replace',
                    replaceSelector : '.card-body',
                    success: (o)=>{
                        IGRPTableComponents.init( o.itemHTML );
                    }
                });
            });
        }
        

        setDataTable(){ 
            console.log('set data tabe')
            try{

                const defaultOptions = {
                    pagination : false,
                    search: false,
                    searching : true,
                    lengthChange: true,
                    pageLength:5,
                    dom : "t <'d-lg-flex align-items-lg-center' i<'ms-auto' p > >",
                    language: {
                        url: `${path}/components/table/locale/pt.json`,
                    },
                    error: function (settings, techNote, message) {
                        console.log('An error occurred: ' + message);
                        // You can replace the above line with your custom error handling logic.
                    }
                    
                }
    
                this.datatable = new DataTable( this.table[0], defaultOptions );
    
                this.datatable.on('init', ()=>{
                    console.log('init')
                })
    
                this.datatable.on('draw', ()=>{
                    console.log('draaw')
                })

            }catch(err){
                console.log(err);

            }
            
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
           
            this.transform( this.filterUrl(), object );

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

        events(){
         

            $('.igrp-table-filter-action',this.element).off('click').on('click',(e)=>{

                this.filter();
                
                return false;
            });

            $('.igrp-table-reset-action',this.element).off('click').on('click', (e)=>{

                this.reset();
                
                return false;
            });

            $('.igrp-table-searcher',this.element).off('keyup').on('keyup', (e)=>{

                const val = e.target.value;
                this.datatable.search( val ).draw();
                
                return false;
            });

   
        }
  
    }

    const IGRPTableComponents = {

        items : {},

        get : (name) => IGRPTableComponents.items[name] || null,

        init:( context )=>{

            context = context || document;

            const elements = $(context).is('.igrp-table') ? $(context) : $( '.igrp-table', context );

            elements.each( function(i,item){
                const table = new Table( item );
                const name = table.name;
                IGRPTableComponents.items[name] = table;
            });

        }
    };


    $.IGRP.component('table_ext', IGRPTableComponents, true);

})();