// JavaScript Document Form Lista @NOSi 2016
(function($){

	$.fn.IGRP_formlist = function(options){

        if(this[0]){

            var defaults = {
              btnDelete     : true,
              btnAdd        : true,
              btnObjAdd     : '.formlist-row-add',
              btnObjDelete  : '.formlist-row-remove',
              //imgAdd        : path_tmpl+"/img/icon/tools-bar/add.png",
              //imgDelete     : path_tmpl+"/img/icon/tools-bar/delete.png",
              onAdd         : null,
              beforeAdd     : null,
              afterAdd      : null,
              onDelete      : null,
              beforeDelete  : null,
              afterDelete   : null,
              data          : []
            };

            var _this = this;
            var settings    = $.extend( defaults,options );
            var TABLE       = $(this);
            var vRel        = TABLE.attr('rel'),
                type        = TABLE.attr('type') ? TABLE.attr('type') : 'table',
                obj         = type == 'table' ? 'tbody tr' : '.fl-box';
            
            try{
                vRel        = vRel.substring(2,vRel.length);
            }catch(e){null}
            
            _this.getLength = function(){

                return $(obj,TABLE).length;
            }

            _this.getRow = function(i){
                return i?$(obj+"[row='"+i+"']",TABLE):$(obj,TABLE);
            }
            
            function resetFildsRow(vObjTr){

                var row = $.IGRP.utils.resetFields(vObjTr);

                var checkers = vObjTr.find('td input[type="checkbox"],td input[type="radio"] ');

                setTimeout(function(){

                    checkers.each(function(i,checker){

                        var td = $(checker).parents('td').first(),

                            tdIndex = td.index()-1,//-1 because of the hidden input

                            th = td.parents('table').first().find('thead th:eq('+tdIndex+')');

                        if( th.attr('checked-default') == 'true' )

                            $(checker).prop( 'checked', true )
                            
                    });

                },20);

                TABLE[0].events.execute('row-reset',row);
            }

            function hideShowItem(){
                (settings.btnDelete)?$("tbody tr:first-child",TABLE).removeClass("noDelete"):
                $("tbody tr:first-child",TABLE).addClass("noDelete");
            }

            function getCloneRow(tb){

                var T      = tb || TABLE;
                    vTrObj = $(obj,T).last() ,
                    vTrRow = (vTrObj.attr("row")*1)+1,
                    vObjTr = !settings.btnDelete?vTrObj.clone(!1):vTrObj.removeClass('noDelete').clone(!1);
                    vObjTr = vObjTr.attr("row",vTrRow);

                $(document).trigger('formlist:row-clone', [{

                    row : vObjTr[0]

                }]);

               TABLE[0].events.execute("row-clone", vObjTr);

                return vObjTr;
            }

            function ROW_id(pRel,pObj){
                return  $("input[name='p_"+pRel+"_id']", pObj)[0]?$("input[name='p_"+pRel+"_id']", pObj).val():null;
            }

            function IGRP_delRowForm(pObj){ 

                var vVal = ROW_id(pObj.pRel,pObj.pObjt);
                
                if(vVal != null && vVal != "")//{
                    $("form").append('<input type="hidden" name="p_'+pObj.pRel+'_del" value="'+vVal+'"/>');
                  
                if(_this.getLength() > 1 && settings.btnDelete){

                    $(pObj.pObjt).remove();

                    TABLE[0].events.execute("row-remove",pObj.pObjt);
                     //_this.events.execute('row-remove',$(pObj.pObjt,"table[rel='T_"+pObj.pRel+"']"));
                }
                else{
          
                    resetFildsRow(pObj.pObjt);
                }


              /*}else
                    IGRP_message({pObjt:$("table[rel='T_"+pObj.pRel+"']").parents(".box-table:first"),pType:"warning",
                        pMessage:JSMSG_WARNING_DELETE_ITEM_TABLE,pPos:"before"});*/
            }

            var getObjTable = function(rel){
                return $('*[rel="T_'+rel+'"]');
            }

            var addRowForm = function(t){
                
                var vObjTr  = getCloneRow(TABLE);

                resetFildsRow(vObjTr);

                type == 'table' ? $("tbody",TABLE).append(vObjTr) : vObjTr.insertAfter(t);

                TABLE[0].events.execute("row-add",vObjTr);

                TABLE.trigger('formlist:add-row', [{

                    row : vObjTr

                }]);

            };

            var _delete = function(pObj){
                IGRP_delRowForm({pRel:vRel,pObjt:pObj});
            };

            var onAdd = function(t){

                if(settings.beforeAdd)
                    settings.beforeAdd(TABLE,_this.getLength(),getCloneRow(),t);

                settings.onAdd?settings.onAdd(TABLE,_this.getLength(),getCloneRow(),t):addRowForm(t);
                
                if(settings.afterAdd)
                    settings.afterAdd(TABLE,_this.getLength(),getCloneRow(),t);
            };

            var GetFieldHolder = function(field, element){

                var label = field.label || field.name.capitalizeFirstLetter(),

                    th    = $('<th><span>'+label+'</span></th>'),

                    td    = $('<td data-row="0" class="'+field.type+'" item-name="'+field.name+'"></td>'),

                    rel   = $(element).attr('rel').split('T_')[1];

                switch (field.type){

                    case 'select':

                        var options = "<option></option>";

                        if(field.options ){

                            var Options = typeof field.options === 'function' ? field.options() : field.options;

                            if(Options[0]){

                                Options.forEach(function(o){

                                    options+='<option value="'+o.value+'">'+o.text+'</option>'

                                });

                            }

                        }
       
                        td.append('<div class="form-group" item-name="'+field.name+'" item-type="select">'+

                          '<select class="form-control select2 " id="'+rel+'_'+field.name+'" input-rel="p_'+field.name+'_fk" rel="F_'+rel+'">'+
                            options+
                          '</select>'+

                          '<input name="p_'+field.name+'_fk" type="hidden" />'+

                        '</div>');

                    break;

                    case 'checkbox':
                    case 'radio':

                        var checked = field.checked ? ' checked=""' : '';

                        th.addClass('bs-checkbox');

                        th.attr('checked-default', field.checked);

                        th.attr('align', 'center');
                        
                        if(field.type == 'checkbox')

                            th.append('<input type="checkbox" class="IGRP_checkall" check-rel="'+field.name+'" >');

                        td.append('<div class="form-group" item-name="'+field.name+'" item-type="'+field.type+'">'+
                          '<input '+checked+'  type="'+field.type+'" name="p_'+field.name+'_fk" class="'+field.type+' checkdcontrol" rel="F_'+rel+'" check-rel="'+field.name+'" style="margin-top:-5px;"></input>'+
                        '</div>');

                    break;

                    default:

                        td.append('<div class="form-group" item-name="'+field.name+'" item-type="'+field.type+'">'+
                          '<input type="'+field.type+'" name="p_'+field.name+'_fk" class="'+field.type+' form-control" rel="F_'+rel+'"></input>'+
                        '</div>');

                };

                td.append('<input type="hidden" name="p_'+field.name+'_fk_desc"/>');

                if(field.style)

                    td.css(field.style);

                $('tbody tr',element).append( td );

                $('thead',element).append( th );

                

            };

            var DrawFields = function(fields,element){
                
                var rel = $(element).attr('rel').split('T_')[1];

                if(fields){

                    for(var fieldName in fields){

                       var fieldOptions = fields[fieldName];

                       fieldOptions.name = fieldName;

                       GetFieldHolder(fieldOptions, element);

                    }

                    $('thead',element).append( '<th class="table-btn add">'+
                        '<a class="formlist-row-add btn btn-primary" rel="'+rel+'">'+
                            '<i class="fa fa-plus"/>'+
                        '</a>'+
                    '</th>' );

                    $('tbody tr',element).append( '<td class="table-btn delete" data-row="0">'+
                        '<span class="formlist-row-remove btn btn-danger" rel="'+rel+'">'+
                            '<i class="fa fa-times"/>'+
                        '</span>'+
                    '</td>' );

                    //TABLE[0].events.execute('fields-draw', $('tbody tr',element))

                    $(document).trigger('formlist:fields-draw', [element]);

                }

            };

            this.on('click',settings.btnObjAdd,function(){
                vRel  = $(this).attr('rel');
                TABLE = getObjTable(vRel);
                var element = type == 'table' ? "tr:first" : '.fl-box';
                onAdd($(this).parents(element));
            });

            var onDelete = function(pObj){

                if(settings.beforeDelete)
                    settings.beforeDelete(TABLE,_this.getLength(),pObj);

                settings.onDelete?settings.onDelete(TABLE,_this.getLength(),pObj):_delete(pObj);

                if(settings.afterDelete)
                    settings.afterDelete(TABLE,_this.getLength(),pObj);

            };

            this.on('click',settings.btnObjDelete,function(ele){
               
                vRel  = $(this).attr('rel');

                TABLE = getObjTable(vRel);
                
                var element = type == 'table' ? "tr:first" : '.fl-box';

                onDelete($(this).parents(element));
            });

            var  removeChar = function(str, searchstr){
                       
                var index = str.indexOf(searchstr);
                if (index === -1) {
                    return str;
                }
                return str.slice(0, index) + str.slice(index + searchstr.length);
            }

            this.each(function(i,e){

                e.events    = new $.EVENTS(["ready","row-add","row-remove","row-reset","row-clone","fields-draw"]);

                if(settings.fields)

                    DrawFields( settings.fields, e );

                e.events.execute('ready');

                e.DeleteRow = function(row){

                    IGRP_delRowForm({

                        pRel : $(e).attr('id'),

                        pObjt : $(row)

                    });

                }

                e._export = function(){
                    
                    var arr = [];

                    $(e).find('tbody tr').each(function(i,tr){
                        
                        var cols = {};

                        $(tr).find(':input').not('[name*="_desc"]').each(function(x,input){

                            var name = $(input).attr('name');

                            if(name){
                                
                                var inputType = $(input).attr('type') ? $(input).attr('type') : $(input).is('select') ? 'select' : 'textarea' ;

                                var val =  inputType == 'checkbox' || inputType == 'radio' ? $(input).is(':checked') : $(input).val(),

                                    xname = removeChar(removeChar(name,'p_'),'_fk');

                                cols[xname] = val;

                            }

                        });

                       /* $(tr).find('td').each(function(x,td){


                            
                            var name = $(td).attr('item-name') || $(td).find('>.form-group').attr('item-name');
                            
                            if(name){

                                var val = $('[name="p_'+name+'_fk"]',tr).val();

                                cols[name] = val;

                            }

                        });*/


                       arr.push(cols);

                    });


                    return arr;

                };

                e._import = function(data, merge){

                   var rows = [];

                    data.forEach(function(d){

                        var tr = getCloneRow(e),

                            tdLength = tr.find('td[item-name]').length;

                        resetFildsRow(tr);

                        for(var name in d){

                            var input = tr.find('[name="p_'+name+'_fk"], [input-rel="p_'+name+'_fk"]'),

                                text  = tr.find('p[item-name="'+name+'"][item-type="plaintext"]');

                            if(input[0])

                                input.val( d[name] ).trigger('change');

                            if(text[0])

                                text.text( d[name] );

                            if(input.attr('type') == 'checkbox' || input.attr('type') == 'radio'){
                                
                                setTimeout(function(){
                                    
                                    input.prop('checked', d[name]);

                                },25)
                                

                            }

                        }

                        /*if(tdLength == Object.keys(d).length){

                            for(var name in d)

                                tr.find('[name="p_'+name+'_fk"], [input-rel="p_'+name+'_fk"]').val(d[name]).trigger('change');

                        }  */

                        TABLE[0].events.execute("row-add",tr);

                        rows.push(tr[0]);

                    });

                    if( merge ){

                         $('tbody',e).append(rows);

                    }else{

                        $('tbody',e).html(rows);

                    }
                    
                    return rows;

                };

                var onInit = function(){
                    $(obj,e).each(function(i,tr){
                        if(!$(tr).attr('row')){
                            $(tr).attr('row',i);
                            if (type == 'table') {
                                var idx = i;
                                $('td',$(tr)).each(function(itd,td){
                                    if (!$(td).attr('data-row'))
                                        $(td).attr('data-row',idx);
                                });
                            }
                        }
                    });

                    hideShowItem();

                    if(!settings.btnAdd)
                        $(settings.btnObjAdd,e).hide();

                    if(!settings.btnAdd && !settings.btnDelete){
                        if (type=='table') {
                            $("thead tr th:last-child",e).hide();
                            $("tbody tr",e).each(function(i,tr){
                                $("td:last-child",tr).hide();
                            });
                        }else{
                            $(settings.btnObjDelete,e).hide();
                        }
                    }

                    $(document).trigger('formlist:init', [e]);
                    
                };

                onInit();

                if(settings.data && settings.data[0])

                    e._import(settings.data);


            });

            return _this;
        }
		
	};
})(jQuery);

(function(){

    $('.IGRP_formlist').IGRP_formlist();

    /*$('.IGRP_formlist [item-type="plaintext"]').each(function(){

        var item = $(this),

            itemName = item.attr('item-name');

        console.log( $('input[name="p_'+itemName+'_fk"]', item) )

    });*/

    

})();
