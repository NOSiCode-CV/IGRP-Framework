(function(){
    
    const SeparatorComponent = (el,id)=>{
        const com = this;
        const card = $(el).parents('.card')[0];
        const formWrapper = $('.splist-form-holder', el);
        const table = $('table', card);

        const setControllers = ()=>{
            $(card).on('click','.show-add-row',  ()=>com.showForm());
            $(card).on('click', '.cancel-add-row', ()=>com.cancelAddEdit());
            $(card).on('click', '.confirm-add-row', ()=>com.confirmAdd());
        }
        
        const setEvents = ()=>{

            $(el).on('row-edit-start', (e,data)=>com.onEdition(data) );

        }
        


        com.countHeaders = ()=>{
            return table.find('thead>tr>th').length;
        }

        com.onEdition = (data)=>{
            com.removeFormTr();
            com.showForm( $(data.row) )
        }

        com.confirmAdd = ()=>{
            var edition = $(el).attr('row-action') === 'edit';
            $('.table-row-add',card).click();
            if(edition)
                com.cancelAddEdit();
        }

        com.showAddRow = (row)=>{
            const html = `
            <tr class="created-row-tr">
                <td colspan="${this.countHeaders()}" class="table-form-wrapper">
                    <div class="d-flex align-items-center justify-content-end">
                        <a href="#" class="btn btn-sm btn-light text-capitalize cancel-add-row me-2">
                            ${$.IGRP.locale.get('cancel')}
                        </a>
                        <a href="#" class="btn btn-sm btn-soft-success text-capitalize confirm-add-row">
                            ${$.IGRP.locale.get('confirm')}
                        </a>
                        
                    </div>
                </td>
            </tr>`;
          
            if(row){

                const rowIndex = $(row).index();

                $(`tbody tr:nth-child(${rowIndex +1 })`, table).after(html);

            }
                
            else
                table.find('tbody').prepend(html);
            
            formWrapper.prependTo( $('.table-form-wrapper', table) );

        }

        com.showForm = ( row )=>{
            com.showAddRow(row);
            formWrapper.addClass('active');
            $('.show-add-row', card).prop('disabled',true).attr('disabled',true).addClass('disabled')
        }
        
        com.hideForm = (ev)=>{
            formWrapper.removeClass('active');
            $('.show-add-row', card).prop('disabled',false).attr('disabled',false).removeClass('disabled');
        }

        com.cancelAddEdit = ()=>{
            el.resetForm();
            com.removeFormTr();
            com.hideForm();
        }

        com.removeFormTr = ()=>{
            formWrapper.removeClass('active').prependTo( $('.card-body',card) );
            $('.created-row-tr', table).remove();
        }

        if(el.setTemplates){
            el.setTemplates({
                rowOptions: `
                <td data-row="" class="table-btn" style="vertical-align:middle">
                    <div class="d-flex align-items-center">
                        <span class="table-row-undo btn btn-ghost-info" rel="${id}">
                            <i class="fa fa-undo"/>
                        </span>
                        <span class="table-row-edit btn btn-ghost-success " rel="${id}" >
                            <i class="ri-edit-2-line"/>
                        </span>
                        <span class="table-row-remove btn btn-ghost-danger" rel="${id}" >
                            <i class="ri-delete-bin-line"/>
                        </span>
                    </div>
                </td>`
            });
            
        }

        setControllers();
        setEvents();

        return com;
    }   
   
    const app = {
        list : {},
        init : ()=>{
          const Separators = $('.IGRP-separatorlist');
          Separators.each( (i,el)=>{
            const id = $(el).attr('tag');
            const component = SeparatorComponent(el,id);
            
            app.list[id] = component;
          });
        }
    };

    $.IGRP.component('separatorlist-ext', app, true);

})();