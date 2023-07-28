(function(){
    
    const SeparatorComponent = function(el,id){
        const com = this;
        const card = $(el).parents('.card')[0];
        const formWrapper = $('.splist-form-holder', el);
        const table = $('table', card);
        const noDataMsg = $('.no-data-message', card);


        const setControllers = ()=>{
            $(card).on('click','.show-add-row',  (e)=>com.showForm());
            $(card).on('click', '.cancel-add-row', (e)=>com.cancelAddEdit(e));
            $(card).on('click', '.confirm-add-row', (e)=>com.confirmAdd());
            $(card).on('click', '.export-data', (e)=>com.export());
        }
        
        const setEvents = ()=>{
            $(el).on('row-edit-start', (e,data)=>com.onEdition(data) );
            $(el).on('row-add', checkNoDataMessage );
            $(el).on('row-remove', checkNoDataMessage );

            checkNoDataMessage();
        }

        const checkNoDataMessage = ()=>{
            console.log('check:' + $('tbody tr',table).length)
            if( $('tbody tr',table).length ){
                noDataMsg.hide()
            }else{
                noDataMsg.show();
            }
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
            else{
                checkNoDataMessage();
            }

            
        }

        com.showAddRow = (row)=>{
            const html = `
            <tr class="created-row-tr">
                <td colspan="${this.countHeaders()}" class="table-form-wrapper bg-light">
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
            }else
                table.find('tbody').prepend(html);
            
            formWrapper.prependTo( $('.table-form-wrapper', table) );

        }

        com.showForm = ( row )=>{
            com.showAddRow(row);
            formWrapper.addClass('active');
            $('.show-add-row', card).prop('disabled',true).attr('disabled',true).addClass('disabled');
            noDataMsg.hide();
        }
        
        com.hideForm = (ev)=>{
            formWrapper.removeClass('active');
            $('.show-add-row', card).prop('disabled',false).attr('disabled',false).removeClass('disabled');
        }

        com.cancelAddEdit = ()=>{
            el.resetForm();
            com.removeFormTr();
            com.hideForm();

            checkNoDataMessage();

            return false;
        }

        com.removeFormTr = ()=>{
            formWrapper.removeClass('active').prependTo( $('.card-body',card) );
            $('.created-row-tr', table).remove();
        }

        com.getTitle = ()=>{
            return $('.card-title',card).text() || 'IGRP List Export'
        }
        com.export = ()=>{
            const data = JSON.stringify(el.toJSON());
            const blob = new Blob([data], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const link = document.createElement('a');

            link.href = url;
            link.download = com.getTitle();

            const clickEvent = new MouseEvent('click', {
                view: window,
                bubbles: true,
                cancelable: false
            });

            link.dispatchEvent(clickEvent);
       
            URL.revokeObjectURL(url);
        }

        if(el.setTemplates){
            el.setTemplates({
                rowOptions: `
                <td data-row="" class="table-btn" style="vertical-align:middle">
                    <div class="d-flex align-items-center">
                        <span class="table-row-undo btn btn-ghost-dark d-none" rel="${id}">
                            <i class="ri-arrow-go-back-line"/>
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
        init : (elements)=>{
          const Separators = elements || $('.IGRP-separatorlist:not(.old-version)');
          Separators.each( (i,el)=>{
            const id = $(el).attr('tag');
            const component = new SeparatorComponent(el,id);
            
            app.list[id] = component;
          });

          
        }
    };

    $.IGRP.component('separatorlist-ext', app, true);

})();