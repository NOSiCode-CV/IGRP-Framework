// JavaScript Document Form Lista @NOSi 2014
(function($){
	$.fn.IGRP_formlist = function(options){
		var defaults = {
          btnDelete		: true,
          btnAdd        : true,
          btnObjAdd 	: '.IGRP_addRowForm',
          btnObjDelete  : '.IGRP_delRowForm',
          imgAdd        : path_tmpl+"/img/icon/tools-bar/add.png",
          imgDelete     : path_tmpl+"/img/icon/tools-bar/delete.png",
          onAdd			: null,
          beforeAdd		: null,
          afterAdd		: null,
          onDelete		: null,
          beforeDelete 	: null,
          afterDelete	: null
        };
        var _this = this;
        var settings	= $.extend( {}, defaults, options);
        var TABLE		= $(this);
        var vRel 		= TABLE.attr('rel');
        try{
        	vRel		= vRel.substring(2,vRel.length);
        }catch(e){null}
        
        _this.getLength = function(){
        	return $("tbody tr",TABLE).length;
        }

        _this.getRow = function(i){
        	return i?$("tbody tr[row='"+i+"']",TABLE):$("tbody tr",TABLE);
        }

        /*_this.hide = function(){
        	return _this.hide();
        }

        _this.show = function(){
        	return _this.show();
        }*/

        function resetFildsRow(vObjTr){
            $("*",vObjTr).each(function(idx,element){
                if($(element).attr("type")=='text' || $(element).attr("type")=='texteditor' || $(element).attr("type")=='number'){
                    $(element).val('');
                    $(element).attr("value",'');
                }
                if($(element).attr("type")=='radio' || $(element).attr("type")=='checkbox')
                    $(element).removeAttr("checked").prop("checked",false);
                    
                if($(element).prop('tagName').toLowerCase() == 'textarea')
                    $(element).text('');

                if(($(this).prop('tagName')).toLowerCase() == "select"){
                    $(this).find("option").removeAttr("selected");
                    $(this).trigger("chosen:updated");
                }
            });
        }

        function hideShowItem(){
        	(settings.btnDelete)?$("tbody tr:first-child",TABLE).removeClass("noDelete"):
			$("tbody tr:first-child",TABLE).addClass("noDelete");
        }

        function getCloneRow(){
        	var vTrObj = $("tbody tr:last",TABLE) ,vTrRow = (vTrObj.attr("row")*1)+1,
        		vObjTr = !settings.btnDelete?vTrObj.clone(!1):vTrObj.removeClass('noDelete').clone(!1);
				vObjTr = vObjTr.attr("row",vTrRow);
			return vObjTr;
        }

        function ROW_id(pRel,pObj){
            return  $("input[name='p_"+pRel+"_id']", pObj)[0]?$("input[name='p_"+pRel+"_id']", pObj).val():null;
        }

        function IGRP_delRowForm(pObj){ 
            var vVal = ROW_id(pObj.pRel,pObj.pObjt);
            
            if(vVal != null && vVal != "")//{
                $("form").append(FIELD({pType:'hidden',pName:'p_'+pObj.pRel+"_del",pValue:vVal}));
                if(_this.getLength() > 1 && settings.btnDelete)
                    $(pObj.pObjt,"table[rel='T_"+pObj.pRel+"']").remove();
                else
                    resetFildsRow(pObj.pObjt);
            /*}else
                IGRP_message({pObjt:$("table[rel='T_"+pObj.pRel+"']").parents(".box-table:first"),pType:"warning",
                    pMessage:JSMSG_WARNING_DELETE_ITEM_TABLE,pPos:"before"});*/
        }

        function creatBtnAddDel(){
            var vBtn = $("thead tr th:last-child img"+settings.btnObjAdd,TABLE);
           
            if(!vBtn[0]){
                var vCbtnAdd = settings.btnObjAdd.substring(1,settings.btnObjAdd.length),
                    vCbtnDel = settings.btnObjDelete.substring(1,settings.btnObjDelete.length);

                $("thead tr",TABLE).append('<th class="fBtn"><img src="'+settings.imgAdd+'" rel="'+vRel+'" class="'+vCbtnAdd+'"></th>');
                $("tbody tr",TABLE).each(function(i,tr){
                    $(tr).append('<td class="fBtn"><img src="'+settings.imgDelete+'" rel="'+vRel+'" class="'+vCbtnDel+'"></td>');
                });
            }
        }

        var getObjTable = function(rel){
            return $('table[rel="T_'+rel+'"]');
        }

        var addRowForm = function(){
            var vObjTr  = getCloneRow(TABLE);

            resetFildsRow(vObjTr);

            if(($("div.chosen-container")[0],vObjTr)){
                $("div.chosen-container",vObjTr).remove();
                $("select[chosen='select'] option:selected",vObjTr).removeAttr("selected");
            }
        
            $("tbody",TABLE).append(vObjTr);
            if($("select[chosen='select']"[0],vObjTr)){
                IGRP_selectChosen();
            }
        };

        var _delete = function(pObj){
            IGRP_delRowForm({pRel:vRel,pObjt:pObj});
        };

        var onAdd = function(){
            if(settings.beforeAdd)
                settings.beforeAdd(TABLE,_this.getLength(),getCloneRow());

            settings.onAdd?settings.onAdd(TABLE,_this.getLength(),getCloneRow()):addRowForm();
            
            if(settings.afterAdd)
                settings.afterAdd(TABLE,_this.getLength(),getCloneRow());
        };

        $('body').on('click',settings.btnObjAdd,function(){
            TABLE = getObjTable($(this).attr('rel'));
            onAdd();
        });

        var onDelete = function(pObj){
            if(settings.beforeDelete)
                settings.beforeDelete(TABLE,_this.getLength(),pObj);

            settings.onDelete?settings.onDelete(TABLE,_this.getLength(),pObj):_delete(pObj);

            if(settings.afterDelete)
                settings.afterDelete(TABLE,_this.getLength(),pObj);
        };

        $('body').on('click',settings.btnObjDelete,function(){
            TABLE = getObjTable($(this).attr('rel'));
            onDelete($(this).parents("tr:first"));
        });

        this.each(function(i,e){
        	var onInit = function(){
        		$("tbody tr",e).each(function(i,tr){
        			if(!$(tr).attr('row')){
        				$(tr).attr('row',i);
        				var idx = i;
        				$('td',$(tr)).each(function(itd,td){
        					if (!$(td).attr('data-row'))
        						$(td).attr('data-row',idx);
        				});
        			}
        		});

                /*try{
                    creatBtnAddDel(); 
                }catch(e){null;} */   

        		hideShowItem();
                if(!settings.btnAdd)
                    $(settings.btnObjAdd).hide();

                if(!settings.btnAdd && !settings.btnDelete){
                    $("thead tr th:last-child",e).hide();
                    $("tbody tr",e).each(function(i,tr){
                        $("td:last-child",tr).hide();
                    });
                }
        	};

	        onInit();
		});
	    return _this;
	};
})(jQuery);

$(function(){
	var table = $('.IGRP_formlist').IGRP_formlist();
});