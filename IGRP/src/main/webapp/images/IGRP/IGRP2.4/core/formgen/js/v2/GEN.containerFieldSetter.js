
(function(){

    var gen = VARS.getGen();

    const availableWrapper = $('.available-wrapper');
    const availableSearcherWrapper = $('.container-field-setter-search-wrapper');

    let currentContainer = null;

    var setAvailableFields = (container)=>{

        const availableFieldsWrapper = $('.available-fields',availableWrapper);
        
        availableFieldsWrapper.html('');

        availableSearcherWrapper.hide();

        availableSearcherWrapper.find('input').val('').trigger('keyup');

        if(container?.acceptableFields?.length > 2 )
            availableSearcherWrapper.show();

        const acceptableList = container.menuItemType && container.contents ? [container.menuItemType] : container?.acceptableFields;
        
        acceptableList?.map( (field)=>{
			const elem = $('.treeview-menu li.gen-declared-fields[name="'+field+'"]');
			const title = $('a span', elem).text();
			const icon = $('i',elem).attr('class');

			var render = Handlebars.compile(availableItemTemplate);
            var template = render({
                field,title,icon
            });
            availableFieldsWrapper.append(template);
			
			
		});
   
    }
 
    var setCurrentFields = (container)=>{
        const currentFieldsWrapper = $('.current-fields','#gen-edition-modal');
        const currentActionsWrapper = $('.actions-wrapper','#gen-edition-modal');
        const currentActionsFieldsWrapper = $('.current-action-fields','#gen-edition-modal');
        
        currentFieldsWrapper.html('');
        currentActionsFieldsWrapper.html('');
        
        $('.no-fields-message','#gen-edition-modal').hide();

        currentActionsWrapper.hide();

        const settedFields = container.contents && container.contents[0] ? container.contents :  container.GET.fields();

        if(settedFields.length || container.GET.contextMenuFields().length){

            console.log(settedFields)

            settedFields.forEach(field => { 
                var render = Handlebars.compile(currentItemTemplate);
                var template = render( {
                    ...field.proprieties,
                    label : field.proprieties?.label || field.proprieties?.tag,
                    id:field.id
                } );
                currentFieldsWrapper.append(template);
            });

            if(container.contextMenu && container.GET.contextMenuFields().length){
                currentActionsWrapper.show();
                container.GET.contextMenuFields().forEach(field => { 
                    var render = Handlebars.compile(currentItemTemplate);
                    var template = render( {
                        ...field.proprieties,
                        label : field.proprieties?.label || field.proprieties?.tag,
                        id:field.id
                    } );
                    currentActionsFieldsWrapper.append(template);
                });
            }

            setCurrentSortable();

        }else{
            $('.no-fields-message','#gen-edition-modal').show();
        }
            
    }

    var addField = (name)=>{
    
        if(currentContainer){
            if(currentContainer.addMenu){
                currentContainer.addMenu();
                setCurrentFields(currentContainer);
            }else{

                var f    = gen.getDeclaredField(name);
                if(f){
                    var field = new f.field(name,{
                        properties:null
                    });
                    currentContainer.SET.fields([field],null,function(){
                        setCurrentFields(currentContainer);
                    });
                }

            }
            
            return false;
        }
        
    }

    var handleEdition = (container)=>{
        const acceptableFields = container.acceptableFields;
        const fieldsMenu = $('ul li[rel="fields"]','#gen-edition-modal');

        currentContainer = null;
        fieldsMenu.hide();

        if(acceptableFields[0] || container.addMenu){
            currentContainer = container;
            fieldsMenu.show();
            setCurrentFields(container);
            setAvailableFields(container)
        }
        
    }

    var handleFieldEdit = (ev)=>{
        const id = $(ev.currentTarget).parents('[gen-field-id]').attr('gen-field-id');
       // const field = currentContainer?.GET.field(id) || currentContainer?.contextMenu?.getField(id) || currentContainer?.getMenuById(id);
        const field = currentContainer.getMenuById ? currentContainer?.getMenuById(id) :  currentContainer?.GET.field(id) || currentContainer?.contextMenu?.getField(id);
       
        if(field && gen.edit.object){
            gen.confirmEdition({
                hide:false
            });
            $(VARS.edition.modal).data('current-container-on-edition', currentContainer.id);
            gen.edit(field);
        }      
    }

    var handleFieldRemove = (ev)=>{
        const id = $(ev.currentTarget).parents('[gen-field-id]').attr('gen-field-id');
        if(id)
            currentContainer?.removeField(id, true, true, ()=>{
                setCurrentFields(currentContainer);
            });
    }

    var handleSearchAvailableField = (ev)=>{
        const input = availableSearcherWrapper.find('.container-field-setter-search');
        const elements = availableWrapper.find('.container-field-item');
        const messageWrapper  = availableWrapper.find('.no-search-field-result-msg');
        const val = input?.val();

        messageWrapper.hide();

        if(val.length > 0){
            const filtered = elements.filter('[field-name*="'+val+'"]');

            elements.each( (i,e)=>$(e).parent().hide() )

            if(filtered[0])
                filtered.each( (i,e)=>$(e).parent().show() );
                
            else
                messageWrapper.show();
        }else
            elements.each( (i,e)=>$(e).parent().show() )
    }

    var setCurrentSortable = ()=>{

        var startPos;

        $('.current-fields','#gen-edition-modal').sortable({
            containment: ".current-wrapper",
            stop:(e,ui)=>{
                if(currentContainer.contents && currentContainer.addMenu && currentContainer.updateContents){
                    const id = ui.item.attr('gen-field-id');
                    if(id){
                        const field = currentContainer.getMenuById(id);
                        field.holder.insertBefore(  field.holder.parent().find('>li').eq( ui.item.index()  )[0]  );
                        currentContainer.updateContents();
                    }
                }else
                    currentContainer?.reorderFieldsByElements( $('.current-fields > div') )
            }
        });

        $('.current-action-fields','#gen-edition-modal').sortable({
            containment: ".current-wrapper",
            start : (e,ui)=>{
                startPos = ui.item.index();
            },
            stop:(e,ui)=>{
                var endPos = ui.item.index();
                ArrayMove(currentContainer?.contextMenu?.items,startPos,endPos);
                startPos = null;
                currentContainer.Transform();
            }
        });

    }
    
    var init = ()=>{

        $(document).on('gen-container-edition', (ev,container)=> handleEdition(container) );

        $(document).on('click', '.container-field-item' ,(ev)=> addField( $(ev.currentTarget).attr('field-name') ) );

        $(document).on('click', '[gen-field-id] .edit-field' , handleFieldEdit );

        $(document).on('click', '[gen-field-id] .remove-field' , handleFieldRemove );

        $(VARS.edition.modal)[0].addEventListener('hidden.bs.modal', function () {
            var previousContainerId = $(VARS.edition.modal).data('current-container-on-edition');
            if(previousContainerId){
                var container = gen.getContainer(previousContainerId);
                gen.edit(container,{
                    tab : 'fields'
                });
            }
            $(VARS.edition.modal).data('current-container-on-edition', null);
        });
        
        $('.container-field-setter-search' ).on('keyup', handleSearchAvailableField );

    }
    

    init();
    
    const currentItemTemplate = `
        <div class="d-flex w-100 py-2 align-items-center border-bottom border-light" gen-field-id="{{id}}">
            <div class="me-1">
                <i class="mdi mdi-drag"/>
            </div>
            <div>
                {{label}}
                <br/>
                <small class="small text-black-50" style="font-size:10px;">[{{type}}]</small>
            </div>
            <div class="d-flex align-items-center ms-auto ps-2">
                <a href="#" class=" px-2 clone-field d-none">
                    <i class="ri-file-copy-line"></i>
                </a>
                <a href="#" class="text-success px-2 edit-field">
                    <i class="ri-edit-2-line"></i>
                </a>
                <a href="#" class="text-danger px-2 remove-field">
                    <i class="ri-delete-bin-line"></i>
                </a>
            </div>
        </div>
    `;

    const availableItemTemplate = `
        <div class="col-lg-6 ">
            <div field-name="{{field}}" class="cursor-pointer container-field-item text-truncate d-flex flex-column align-items-center justify-content-center text-truncate">
                <i class="{{icon}}" style="font-size:16px;margin-bottom:4px" ></i>
                <span class="text-truncate">{{title}}</span>
            </div>
        </div>
    `;

})();


