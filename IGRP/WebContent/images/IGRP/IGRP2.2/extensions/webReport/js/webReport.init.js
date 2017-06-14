/*
  WEBREPORT - variavel global criada no ficheiro webReport.vars.js
  CKEDITOR - text edidor 
*/
$(function(){
  CKEDITOR.config.protectedSource.push( /(<xsl:[^\>]+>[\s|\S]*?<\/xsl:[^\>]+>)|(<xsl:[^\>]+\/>)/gi );
  CKEDITOR.config.forceEnterMode = true;
  CKEDITOR.config.forcePasteAsPlainText = true;
  CKEDITOR.config.toolbarCanCollapse = true;
  CKEDITOR.config.height = $(window).height() - 205;
  var vData         = '', 
    vArrayTable     = [], 
    vTableItem      = [], 
    vTagItem        = [], 
    vItem           = [], 
    vIdApp          = null,
    vIdDataSorce    = null, 
    vIdResports     = null, 
    vChart          = false, 
    vReportTitle    = null,
    vArrayCharts    = [], 
    vDocFrame       = null ,
    vPreview        = false, 
    vLoadDataSource = false, 
    vCodigoReport   = null,
    vOcourid        = null;

  var sTrXsl = function(value){
    return value.substring(value.indexOf('[')+1,value.lastIndexOf(']')).toLowerCase();
  };

  //filtar elemento a ser transformado em xsl
  function webReportValue(){
    vData = CKEDITOR.instances[WEBREPORT.textEditor].getData();
    var vXslpath = 'rows/content/form/value/';
    var filter = new CKEDITOR.htmlParser.filter({
      text: function(value) {
        return value;
      },
      elements:{
        img:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos,
            no      = element.attributes.no;
          if(attr != undefined){
            element.attributes.src ='{rows/content[position()='+pos+']/'+no+'/value/'+attr+'}';
            delete element.attributes.rel;
            delete element.attributes.pos;
            delete element.attributes.no;
          }
        },
        table:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos;
          if(attr != undefined){
            delete element.attributes.rel;
            delete element.attributes.pos;
            var td = '', th = '', 
              vTagName = false, vHas = false, vHasRel = [], vHasAllRel = [],
              vVariableTag = '', vNVariableTag = '',
              vConditions = '', vIdx = 0,
              vPath = (element.attributes.type == 'separator')?
                'rows/content[position()='+pos+']/form/table/'+attr:
                'rows/content[position()='+pos+']/'+attr;

             delete element.attributes.type;

             element.forEach(function(node){
                if (node.name == 'th') {
                  th+='<th>'+
                    IGRP_htmlDecode(node.getHtml().capitalizeFirstLetter())+
                  '</th>';
                }
                if (node.name == 'td') {
                  var vNode = node.getHtml().replace(/&nbsp;/g, " ").replace(/\s+/g," "),
                    vNodeRel = node.attributes.rel;
                    if(vNodeRel != undefined){
                      vVariableTag += '<xsl:variable name="v'+vNodeRel+'" select="'+vNodeRel+'"/>';
                      vIdx += 1;
                      if (vIdx > 1) {
                        vConditions +=' and ';
                      }
                      vConditions +='$v'+vNodeRel+' = '+vNodeRel; 
                      vHasAllRel.push(vNodeRel);
                    }
                    
                  var filterTable = new CKEDITOR.htmlParser.filter({
                    text:function(valueTable){
                      return '';
                    },
                    elements:{
                      ul:function(elementTable){
                        vTagName = true, vNConditions = '';
                        var vLi = '',  nattr = elementTable.attributes.rel,
                          npos = elementTable.attributes.pos, 
                          vNPath = (elementTable.attributes.type == 'separator')?
                            '//rows/content[position()='+npos+']/form/table/'+nattr:
                            '//rows/content[position()='+npos+']/'+nattr;
                         vNConditions = 'vCONDv';
                         
                        if(nattr == attr){
                          vNPath         = '//'+vPath;
                        }else{
                          if(vNodeRel != undefined){
                            vNVariableTag  += '<xsl:variable name="v'+vNodeRel+'" select="'+vNodeRel+'"/>';
                            vNConditions   = '$v'+vNodeRel+' = '+vNodeRel;
                            vHas           = true;
                            vHasRel.push(vNodeRel);
                          }
                        }

                        elementTable.forEach(function(nodeTable){
                          if (nodeTable.name == 'li') {
                            vLi+='<li><xsl:value-of select="'+nodeTable.attributes.rel+'"/></li>';
                          }
                        });
                        
                        elementTable.setHtml('<xsl:for-each select="'+vNPath+'/value/row['+vNConditions+']">'+vLi+'</xsl:for-each>');
                        delete elementTable.attributes.rel;
                        delete elementTable.attributes.pos;
                        delete elementTable.attributes.type;
                      },
                      ol:function(elementTable){
                        vTagName = true, vNConditions = '';
                        var vLi = '',  nattr = elementTable.attributes.rel,
                          npos = elementTable.attributes.pos, 
                          vNPath = (elementTable.attributes.type == 'separator')?
                            '//rows/content[position()='+npos+']/form/table/'+nattr:
                            '//rows/content[position()='+npos+']/'+nattr;
                         vNConditions = 'vCONDv';
                        if(nattr == attr){
                          vNPath         = '//'+vPath;
                        }else{
                          vNVariableTag  += '<xsl:variable name="v'+vNodeRel+'" select="'+vNodeRel+'"/>';
                          vNConditions   = '$v'+vNodeRel+' = '+vNodeRel;
                          vHas           = true;
                          vHasRel.push(vNodeRel);
                        }

                        elementTable.forEach(function(nodeTable){
                          if (nodeTable.name == 'li') {
                            vLi+='<li><xsl:value-of select="'+nodeTable.attributes.rel+'"/></li>';
                          }
                        });
                        
                        elementTable.setHtml('<xsl:for-each select="'+vNPath+'/value/row['+vNConditions+']">'+vLi+'</xsl:for-each>');
                        delete elementTable.attributes.rel;
                        delete elementTable.attributes.pos;
                        delete elementTable.attributes.type;
                      }
                    }
                  });
                  var fragmentTable = CKEDITOR.htmlParser.fragment.fromHtml(vNode);
                  var writerTable = new CKEDITOR.htmlParser.basicWriter();

                  filterTable.applyTo(fragmentTable);
                  fragmentTable.writeHtml(writerTable);

                  td+=(writerTable.getHtml() != '')?
                    '<td>'+writerTable.getHtml()+'</td>':
                    '<td><xsl:value-of select="'+vNodeRel+'"/></td>';
                }
              });
              var vXslForeach   = '<xsl:for-each select="'+vPath+'/value/row">',
                vXslEndForeach  = '</xsl:for-each>',
                vXslPreceding   = '',
                vValConditions  = '';
              if (vTagName) {
                vHasRel = !vHas?vHasAllRel:vHasRel;
                var vPreceding = '', vX = 0;
                if (vHasRel.length > 0) {
                  vHasRel.forEach(function(p){
                    vX += 1;
                    if (vX > 1) {
                      vPreceding +=' or ';
                    }
                    vPreceding +='not('+p+'=preceding::row/'+p+')';
                  });
                }

                vVariableTag = vHas?vNVariableTag:vVariableTag;
                vXslForeach  = '<xsl:for-each select="'+vPath+'/value/row['+vPreceding+']">';
                vPreceding = '';
              }else
                vVariableTag = '';

              var vDataTable = '<thead><tr>'+th+'</tr></thead>'+
              '<tbody>'+vXslForeach+vVariableTag+vXslPreceding+
              '<tr>'+td+'</tr>'+vXslEndForeach+'</tbody>';
            
              if(vTagName && !vHas){
                vDataTable = vDataTable.replace(/vCONDv/g,vConditions);
                vHasRel = [];
              }
            element.setHtml(vDataTable);

          }
        },
        ul:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos;
          if(attr != undefined){
            delete element.attributes.rel;
            delete element.attributes.pos;
            var li = '',
             vPath = (element.attributes.type == 'separator')?
             'rows/content[position()='+pos+']/form/table/'+attr:
             'rows/content[position()='+pos+']/'+attr;

            delete element.attributes.type;

            element.forEach(function(node){
              if (node.name == 'li') {
                li+='<li><xsl:value-of select="'+node.attributes.rel+'"/></li>';
              }
            });
            element.setHtml('<xsl:for-each select="'+vPath+'/value/row">'+li+'</xsl:for-each>');
          }
        },
        ol:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos;
          if(attr != undefined){
            delete element.attributes.rel;
            delete element.attributes.pos;
            var li = '',
             vPath = (element.attributes.type == 'separator')?
             'rows/content[position()='+pos+']/form/table/'+attr:
             'rows/content[position()='+pos+']/'+attr;

            delete element.attributes.type;

            element.forEach(function(node){
              if (node.name == 'li') {
                li+='<li><xsl:value-of select="'+node.attributes.rel+'"/></li>';
              }
            });
            element.setHtml('<xsl:for-each select="'+vPath+'/value/row">'+li+'</xsl:for-each>');
          }
        },
        span:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos,
            no      = element.attributes.no,
            type    = element.attributes.type;
          if(attr){
            if(element.attributes.charttype) {
              element.setHtml('<xsl:call-template name="igrp-graph">'+
              '<xsl:with-param name="table" select="rows/content[position()='+pos+']/'+attr+'"/>'+
              '<xsl:with-param name="chart_type" select="rows/content[position()='+pos+']/'+attr+'/chart_type"/>'+
              '<xsl:with-param name="height" select="rows/content[position()='+pos+']/'+attr+'/height"/>'+
              '<xsl:with-param name="title" select="rows/content[position()='+pos+']/'+attr+'/caption"/>'+
              '</xsl:call-template>');
              delete element.attributes.charttype;
            }else{
              var vPath = '<xsl:value-of select="rows/content[position()='+pos+']/'+no+'/value/'+attr+'"/>';
              if (type) {
                vPath = (type == 'link')?'<a href="{rows/content[position()='+pos+']/'+no+'/value/'+attr+'}">'+
                '<xsl:value-of select="rows/content[position()='+pos+']/'+no+'/label/'+attr+'"/></a>':
                '<xsl:value-of select="rows/content[position()='+pos+']/'+no+'/list/'+attr+'/option[@selected='+"'"+'true'+"'"+']"/>';
              }
              element.setHtml(vPath);
              delete element.attributes.type;
              delete element.attributes.no;
            }
            delete element.attributes.rel;
            delete element.attributes.pos;
            delete element.attributes.key;
          }
        }
      }
    });

    var fragment = CKEDITOR.htmlParser.fragment.fromHtml(vData);
    var writer = new CKEDITOR.htmlParser.basicWriter();
      filter.applyTo( fragment );
      fragment.writeHtml( writer );
      /*console.log(writer.getHtml());
      console.log('----------');*/

      return writer.getHtml();
  }

  function creatTabel(pTable){
    var td = ''; th = '';
    pTable.forEach(function(e,i){
      th+='<th rel="'+vTagItem[i]+'">'+e+'</th>';
      td+='<td rel="'+vTagItem[i]+'">Text '+(i+1)+'</td>';
    });
    return{th:th,td:td};
  }

  function setItemArray(pItem,pRel){
    if($.inArray(pItem,vItem) == -1){
      vItem.push(pItem);
      vTagItem.push(pRel);
      return true;
    }else
      return false;
  }

  function readItemArray(pObj){
    if(pObj.pObj[0]){
      if (pObj.pType == 'node') {
        if ((pObj.pCol*1) > $('thead tr th',pObj.pObj).length) {
          vItem = [];
          vTagItem = [];
        }
      }else{
        if (!$('thead tr th[rel="'+pObj.pRel+'"]',pObj.pObj)[0]) {
          if($.inArray(pObj.pItem,vItem) != -1){
            vItem.splice(vItem.indexOf(pObj.pItem), 1);
            vTagItem.splice(vTagItem.indexOf(pObj.pItem), 1);
          }
        }
      }
    }
  }
  var vArrayItemTable = []
  /*EDSON*/
  function setItemArrayTable(arr){
    var vNotExist = false;
    if (vArrayItemTable.length > 0) {
      vArrayItemTable.forEach(function(e,i){
        if (e.value != arr.value)
          vNotExist = true;
      });

      console.log(vNotExist);
      if (vNotExist)
        vArrayItemTable.push(arr);
    }else
    vArrayItemTable.push(arr);
  }

  function readArrayTable(pRel){
    if (vArrayTable.length > 0) {
      vArrayTable.forEach(function(arr,irr){
        if (arr.name == pRel){
          arr.value.forEach(function(e,i){
            if($.inArray(e,vArrayTable) != -1){
              console.log(e);
              vArrayTable.splice(vArrayTable.indexOf(e), 1);
            }
          });
        }else{
          vArrayTable.push({name:pRel,value:vArrayItemTable});
        }
      });
    }else{
      vArrayTable.push({name:pRel,value:vArrayItemTable});
    }
  }

  //mostrar dialog
  function showAddReports(){
    $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']").removeClass('error');
    IGRP_blackBody({pType:true});
    $(WEBREPORT.dialogReport.id).addClass('active');
  }

  // cancelar dialog 
  function cancelAddReports(){
    $(WEBREPORT.dialogReport.id).on('click',WEBREPORT.dialogReport.cancel,function(){
      $(WEBREPORT.dialogReport.id).removeClass('active');
      IGRP_blackBody({pType:false});
      $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val('');
    });
  }

  //campos obrigatorios no momento de gravar template report
  function requiredFild(){
    if (vIdApp == null){
      $('#'+WEBREPORT.aplicacao.selectName+'_chosen a').addClass('error');
      $(WEBREPORT.tabMenu.classItem).removeClass('active');
      $("ul#tabs li").removeClass('active');
      $("ul#tabs li[rel='"+WEBREPORT.tabMenu.id+"1']").addClass('active');
      $('#'+WEBREPORT.tabMenu.id+'1').addClass('active');
    }
    /*if(vIdDataSorce == null){
      $('#'+WEBREPORT.dataSource.selectName+'_chosen ul:first').addClass('error');
      $(WEBREPORT.tabMenu.classItem).removeClass('active');
      $("ul#tabs li").removeClass('active');
      $("ul#tabs li[rel='"+WEBREPORT.tabMenu.id+"2']").addClass('active');
      $('#'+WEBREPORT.tabMenu.id+'2').addClass('active');
    }*/

    /*IGRP_message({pObjt:vObjForm,pType:"error",pMessage:JSMSG_ERROR_FILD_REQUIRED +' ('+app+' & '+dataSource+')',pPos:'before'});*/
    IGRP_message({pObjt:vObjForm,pType:"error",pMessage:JSMSG_ERROR_FILD_REQUIRED +app,pPos:'before'});
  }
  
  //adeciona template report
  $(WEBREPORT.listReport.add).on('click',function(){
    if (vIdApp != null){// && vIdDataSorce != null
      $('.title',WEBREPORT.dialogReport.id).html(WEBREPORT.dialogReport.addTitle.title);
      $('.message',WEBREPORT.dialogReport.id).html(WEBREPORT.dialogReport.addTitle.message);
      showAddReports();
      $(WEBREPORT.dialogReport.id).unbind("click").on('click',WEBREPORT.dialogReport.ok,function(){
        var vValReport = $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val(),
          vCodigo = $("input[name='"+WEBREPORT.dialogReport.addTitle.inputCodName+"']",WEBREPORT.dialogReport.id).val();
        if(vValReport!= '' && vValReport!= null){
          vReportTitle = vValReport;
          vCodigoReport = vCodigo;
          $(WEBREPORT.listReport.classItem).removeClass('active');//retirar ativado de qq item da lista dos templates
          $(WEBREPORT.listReport.reportTitle, WEBREPORT.listReport.showTitle).html(vValReport);//adeciona o titulo
          $(WEBREPORT.listReport.showTitle).addClass('active');
          $(WEBREPORT.dialogReport.id).removeClass('active');
          IGRP_blackBody({pType:false});
          $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val('');
          $("input[name='"+WEBREPORT.dialogReport.addTitle.inputCodName+"']",WEBREPORT.dialogReport.id).val('');
          if(vIdResports != null)
            CKEDITOR.instances[WEBREPORT.textEditor].setData('');

          vIdResports = null;
        }else
          $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).addClass('error');
      });
    }
    else{
      requiredFild();
    }
    cancelAddReports();
  });

  function validateOcorencia(xml){
    try{
      if(window.opener){
        var vForm = window.opener.document.formular_default;
        if($('#p_fwl_relboxopen')[0] && $('#p_fwl_relboxopen').val() != '' && $('#p_fwl_relboxopen').val() != null){
          var vWTrel = $('#p_fwl_relboxopen').val(),
            vWTable = $('table[rel="T_'+vWTrel+'"]',vForm); 
            
          if($('#p_fwl_'+vWTrel+'tr')[0]){
            var vTr   = $('#p_fwl_'+vWTrel+'tr').val(),
            vLinkhref = $("tbody tr:eq("+vTr+") a",vWTable),
            vHref = vLinkhref.attr('href'),
            vWname = vLinkhref.attr('name'),
            vOcour = $(xml).find('row p_fwl_id_ocor').text();
            if(vOcour != '' && vOcour != null){
              vOcourid = vOcour;
              $("tbody tr:eq("+vTr+") input[name='p_"+vWTrel+"_id']",vWTable).val(vOcour);
              if(vHref.indexOf('p_fwl_id_ocor')== -1){
                vHref = IGRP_getUrl(vHref)+'p_fwl_id_ocor='+vOcour;
                vLinkhref.attr('href',vHref);
                $("tbody tr:eq("+vTr+") input[name='"+vWname+"_fk']",vWTable).val(vHref);
                $("tbody tr:eq("+vTr+") input[name='"+vWname+"_fk_desc']",vWTable).val(vHref);
              }
            }
          }
        }
      }
    }catch(e){IGRP_blackBody({pType:false});console.log(e.description);}
  }

  //gravar template de report
  function sendNameReport (pObj) {
    console.log(pObj.pArrayItem);
    IGRP_submitStringAsFile({
      pUrl:pObj.pUrl,
      pMessage:true,
      pLoading:true,
      pParam:{
        pArrayFiles:pObj.pParam,
        pArrayItem:pObj.pArrayItem
      },
      pComplete:function(xml){
        $('#'+WEBREPORT.aplicacao.selectName).trigger('change');
        $(WEBREPORT.dialogReport.id).removeClass('active');
        $(WEBREPORT.tabMenu.classItem).removeClass('active');
        $("ul#tabs li").removeClass('active');
        $("ul#tabs li[rel='"+WEBREPORT.tabMenu.id+"1']").addClass('active');

        if($(xml).find('p_id').text()!= '' && $(xml).find('p_id').text() != null)
          vIdResports = $(xml).find('p_id').text();

        $('#'+WEBREPORT.tabMenu.id+'1').addClass('active');
        if(vIdResports != null)
          $(WEBREPORT.listReport.id+" ul li a#"+vIdResports).trigger('click');

        IGRP_blackBody({pType:false});
        validateOcorencia(xml);
        console.log('B');
          console.log(vPreview);
        /*if(vPreview)
          $('.bWebReport[target="alert_submit"]').trigger('click');*/
      }
    });
  }

  //gravar e preview de report
  function buttonWebReportClick(){
    $(WEBREPORT.toolsBar).unbind("click").on('click',function(e){
      e.preventDefault();
      var vB = $(this),
      vUrl = vB.attr('href')?vB.attr('href'):vB.attr('fw_href');
      
      try{
        if(vUrl.indexOf('p_fwl_id_ocor')== -1){
          if($("#p_fwl_id_ocor")[0] && $("#p_fwl_id_ocor").val() != '' && $("#p_fwl_id_ocor").val() != null){
            vUrl = IGRP_getUrl(vUrl)+'p_fwl_id_ocor='+$("#p_fwl_id_ocor").val();
          }else if(vOcourid != null){
            vUrl = IGRP_getUrl(vUrl)+'p_fwl_id_ocor='+vOcourid;
          }
        }
      }catch(e){console.log(e.description);null;}

      switch(vB.attr('target').toLowerCase()){
        case 'submit':// caso submit
        // adecionar os ficheiros do cabesalho
        
        var vHead = WEBREPORT.envelopeXsl.includCss+WEBREPORT.envelopeXsl.includeJs,
          vInclud = '';

        if(vChart){//verificar si exite grafico na report para adecionar os ficheros js e o template xsl do grafico
          vHead += WEBREPORT.envelopeXsl.includJsCharts;
          vInclud = WEBREPORT.envelopeXsl.includTmplCharts;
        }
        //creat envelope xsl of report
        var vXslData = WEBREPORT.envelopeXsl.initEnvelope+vHead+
          WEBREPORT.envelopeXsl.initBody+
          WEBREPORT.envelopeXsl.header+
          //xsl gerado
          webReportValue().replace(/&nbsp;/g, " ")+
          WEBREPORT.envelopeXsl.footer+
          WEBREPORT.envelopeXsl.endBody+vInclud+
          WEBREPORT.envelopeXsl.endEnvelope;

        vData = $.trim(vData.replace(/"/g, "'").replace(/\s+/g," "));//texto do report para podemos fazer edicao
        /*console.log(vXslData);
        console.log('-------------.replace(/&nbsp;/g, " ")');
        console.log(vData);*/
        var vArrayItem = [], vKeyArray = []; //array de parametros a ser envidos, array dos chaves associado ao template report
        //criar os campos chaves do template report
        $(WEBREPORT.dataSource.options+' .btn input:checked',WEBREPORT.dataSource.id).each(function(ikey,ekey){
          if ($.inArray($(ekey).val(),vKeyArray) == -1) {
            vArrayItem.push({name:WEBREPORT.dialogReport.listKeys.inputName,value:$(ekey).val()});
            vKeyArray.push($(ekey).val());
          }
        });
        try{
          if(vUrl.indexOf("?")>-1){
            var param = vUrl.substring(vUrl.indexOf("?")+1),
              p = param.split("&");
            for(var i=0;i<p.length;i++){
              var p1 = p[i].split("=");
              vArrayItem.push({name:p1[0],value:p1[1]});
            }
          }
        }catch(e){null;}

        vKeyArray = [];//lipar array dos chaves
        if (vIdApp != null){//caso exite id de aplicacao e data source   && vIdDataSorce != null
          //adecionar id da app ao template a ser gravado
          vArrayItem.push({name:WEBREPORT.aplicacao.selectName,value:vIdApp});
          if(vIdDataSorce != null){
            vIdDataSorce.forEach(function(e,i){//adecionar id do data source ao template a ser gravado
              vArrayItem.push({name:e.name,value:e.value});
            });
          }
          
          //adecionar os campos que vao ser submitido como ficheiros
          var vParam  = [
            {name:WEBREPORT.save.fileXsl,value:vXslData},
            {name:WEBREPORT.save.fileText,value:vData}
          ];
          if (vIdResports != null) {//caso o id do report existe
            //adecionar o id de report aos restante parametros 
            vArrayItem.push({name:WEBREPORT.save.idReport,value:vIdResports});
            IGRP_submitStringAsFile({//fazer submit dos conteudos do template report obs: funsao criado no fichero IGRP.handler.js
              pUrl:vUrl,
              pMessage:true,
              pLoading:true,
              pParam:{
                pArrayFiles:vParam,
                pArrayItem:vArrayItem
              },pComplete:function(xml){
                //$('#p_env_fk').trigger('change');
                //$("#listReports ul li a#"+vIdResports).trigger('click');
                validateOcorencia(xml);
                if($(xml).find('p_id').text()!= '' && $(xml).find('p_id').text() != null)
                  vIdResports = $(xml).find('p_id').text();
                console.log('A');
                console.log(vPreview);
                /*if(vPreview)
                  $('.bWebReport[target="alert_submit"]').trigger('click');*/
              }
            });
          }else{
            if (vReportTitle == null) {// casa ainda nao temos o titulo do template report
              $('.title',WEBREPORT.dialogReport.id).html(WEBREPORT.dialogReport.addTitle.title);
              $('.message',WEBREPORT.dialogReport.id).html(WEBREPORT.dialogReport.addTitle.message);
              showAddReports();//mostrar o dialog para adecionar titulo do template report
              $(WEBREPORT.dialogReport.id).unbind("click").on('click',WEBREPORT.dialogReport.ok,function(){//caso clicamos no botao OK
                if(!$(WEBREPORT.dialogReport.id).data('key')){//caso dialog na tem o atributo key
                    vReportTitle = $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val();//get name report
                    vCodigoReport = $("input[name='"+WEBREPORT.dialogReport.addTitle.inputCodName+"']",WEBREPORT.dialogReport.id).val();//get codigo report
                  if (vReportTitle!= '' && vReportTitle!= null) {//caso temos titulo
                    $(WEBREPORT.dialogReport.id).removeClass('active');//esconder o dialog
                    vArrayItem.push({name:WEBREPORT.save.title,value:vReportTitle});//adecionar o titulo no array dos parametros
                    
                    if (vCodigoReport != null) //verificar se temos codigo de report e adeciona-lo
                      vArrayItem.push({name:WEBREPORT.dialogReport.addTitle.inputCodName,value:vCodigoReport});

                    sendNameReport({pUrl:vUrl,pParam:vParam,pArrayItem:vArrayItem});//fazer submit dos dados
                  }
                  else{
                    //caso input titulo encontra vazio adecionar class error
                    $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).addClass('error');
                  }
                }
              });
              //caso clicamos no botao cancelar 
              cancelAddReports();
            }else{
              //caso ja temos titulo do template report
              vArrayItem.push({name:WEBREPORT.save.title,value:vReportTitle});
              if (vCodigoReport != null) //verificar se temos codigo de report e adeciona-lo
                vArrayItem.push({name:WEBREPORT.dialogReport.addTitle.inputCodName,value:vCodigoReport});

              sendNameReport({pUrl:vUrl,pParam:vParam,pArrayItem:vArrayItem});
            }
          }
        }
        else{
          requiredFild();//caso nao temos nem id da aplicacao e nem da data source
        }
        break;
        case 'alert_submit'://caso preview
          //if (vLoadDataSource) {//caso ja temos data source 
            if(vIdResports != null){// caso ja temos id do template report
              vUrl = IGRP_getUrl(vUrl)+'p_id='+vIdResports;//adecionamos o id ao url
              var vInputKey = '', vKeyArray = [];
              //criar os campos chaves para ser adecionado os valores
              $(WEBREPORT.dataSource.options+' .btn input:checked',WEBREPORT.dataSource.id).each(function(ikey,ekey){
                if ($.inArray($(ekey).attr('name'),vKeyArray) == -1) {
                  vInputKey += '<div class="igrp_item"><div class="col-1-4"><label>'+$(ekey).attr('label').capitalizeFirstLetter()+'</label></div>'+
                  '<div class="col-9-12"><input type="text" name="'+$(ekey).attr('name')+'"/></div><div class="_clear"/></div>';
                  vKeyArray.push($(ekey).attr('name'));
                }
              });
              vKeyArray = [];
              if(vInputKey!= ''){//caso temos campos que soa chaves
                vInputKey ='<div class="col">'+vInputKey+'</div>';
                $('.title',WEBREPORT.dialogReport.id).html(WEBREPORT.dialogReport.listKeys.title);//mudar o titulo do dialog
                $('.message',WEBREPORT.dialogReport.id).html(vInputKey);//adecionar os campos chave no dialog
                IGRP_blackBody({pType:true});//escorece ecra
                $(WEBREPORT.dialogReport.id).data('key','true').addClass('active');//adecionar atributo chaves e mostrar o dialog

                var vInputKeys = '', vInputKeysName = '';
                $(WEBREPORT.dialogReport.id).unbind("click").on('click',WEBREPORT.dialogReport.ok,function(){//caso clicamos no botao OK
                  if ($(WEBREPORT.dialogReport.id).data('key') == 'true') {//e o dialog ja tem o atributo key
                    var vIndx = 0;
                    $('input',$('.message',WEBREPORT.dialogReport.id)).each(function(ikey,ekey){//pegar todos os valores dos campos chaves
                      var vKeyVal = $(ekey).val()
                      if(vKeyVal!= '' && vKeyVal != null){
                        vIndx+= 1;
                        if (vIndx > 1){
                          vInputKeys+='&';
                          vInputKeysName+='&';
                        }

                        vInputKeys+=WEBREPORT.dialogReport.listKeys.arrValue+'='+vKeyVal;
                        vInputKeysName+=WEBREPORT.dialogReport.listKeys.arrName+'='+$(ekey).attr('name');
                      }
                    });
                    
                    if(vInputKeys != ''){//caso temos alguns campo chaves com valor adecionamos-los ao url
                      vUrl+='&'+vInputKeysName+'&'+vInputKeys;
                    }
                    //OPen window print report
                    IGRP_openWin({pUrl:vUrl,
                      pWidth:($(window).width()-100),
                      pHeight:($(window).height()-100),
                      pWin:'Preview Report'
                    });
                    vInputKeys = '';
                    IGRP_blackBody({pType:false});//retirar o escoricimento do ecra
                    $(WEBREPORT.dialogReport.id).data('key','false').removeClass('active');//esconder o dialog e retirar o atributo key
                  }
                });
                cancelAddReports();//caso clicamos no cancelar esconde o dialog
              }else{//caso nao temo nenhum campo chave
                //OPen window print report
                IGRP_openWin({pUrl:vUrl,
                  pWidth:($(window).width()-100),
                  pHeight:($(window).height()-100),
                  pWin:'Preview Report'
                });
              }
            }else{//caso nao temos id do template report forsamos click no botao submit 
              vPreview = true;
              $(WEBREPORT.toolsBar+'[target="submit"]').trigger('click');
            }
          //} 
        break;
        default:
      }
      return false;
    });
  }
 
 function reportDraggble(){
  $(WEBREPORT.classDrag).draggable({
      helper:'clone',
      iframeFix: true,
      cursor: "move"
    });
 }

 function creatListObjType(pType){
  var vObj = '';
  switch(pType.toLowerCase()){
    case 'table':
     vObj = creatTabel(vItem);
    break;
    default:
      vObj = '';
      vItem.forEach(function(e,i){
        vObj+='<li rel="'+vTagItem[i]+'">'+e.capitalizeFirstLetter()+'</li>';
      });
    break;
  }
  vItem = [];
  vTagItem = [];
  return vObj;
 }
 
 function creatLisType(pObj){
  var vItemList = '';
  WEBREPORT.listType.forEach(function(e){
     vItemList+='<div class="col-1-3"><input type="radio" name="listType" value="'+e+'" class="radio"/>'+
     '<img src="'+path+'/extensions/webReport/img/'+e+'.png" class="listType"/></div>';
  });
  $('.title',WEBREPORT.dialogReport.id).html('List Type');//mudar o titulo do dialog
  $('.message',WEBREPORT.dialogReport.id).html('<div class="igrp_item">'+vItemList+'</div>');//adecionar os campos chave no dialog
  IGRP_blackBody({pType:true});//escorece ecra
  $(WEBREPORT.dialogReport.id).data('key','listType').addClass('active');//adecionar atributo chaves e mostrar o dialog
  $(WEBREPORT.dialogReport.id).unbind("click").on('click',WEBREPORT.dialogReport.ok,function(){//caso clicamos no botao OK
    if ($(WEBREPORT.dialogReport.id).data('key') == 'listType') {//e o dialog ja tem o atributo key
      vType = $('input[name="listType"]:checked',WEBREPORT.dialogReport.id).val();
      if (vType) {
        var vObj = '';
        switch(vType.toLowerCase()){
          case 'ul':
            vObj = '<ul rel="'+pObj.pRel+'" type="'+pObj.pTagType+'" pos="'+pObj.pPos+'">'+creatListObjType(vType)+'</ul>';
          break;
          case 'ol':
            vObj = '<ol rel="'+pObj.pRel+'" type="'+pObj.pTagType+'" pos="'+pObj.pPos+'">'+creatListObjType(vType)+'</ol>';
          break;
          default:
            var table = creatListObjType(vType);
            vObj = '<table rel="'+pObj.pRel+'" type="'+pObj.pTagType+'" pos="'+pObj.pPos+'" class="IGRP_table default-table">'+
              '<thead><tr>'+table.th+'</tr></thead>'+
              '<tbody><tr>'+table.td+'</tr></tbody></table>';
          break;
        }
        if (vObj) {
          CKEDITOR.instances[WEBREPORT.textEditor].insertHtml(vObj);
          CKEDITOR.instances[WEBREPORT.textEditor].insertHtml(' ');
        }
        $(WEBREPORT.dialogReport.id).removeData('key').removeClass('active');
        IGRP_blackBody({pType:false});
      }
    }
  });
  cancelAddReports();//caso clicamos no cancelar esconde o dialog
 }

 //droppable element on text editor
  CKEDITOR.on('instanceReady', function (ev) { 
    ev.editor.execCommand( 'removeFormat', ev.editor.getSelection() ); 
    vDocFrame = $('.cke_contents').find('iframe').contents();
    reportDraggble();

    $('.cke_contents').droppable({
      accept:WEBREPORT.classDrag,
      drop:function(e,ui){
        var vThis = ui.helper;
        
        var vText     = vThis.text(),
          vTag        = '['+vText+']',
          vThisParent = vThis.parents('li'),
          vType       = vThisParent.attr('type'),
          vRel        = vThisParent.attr('rel'),
          vPos        = vThis.parents('li.head').attr('pos'),
          vElement    = vThisParent.attr('tag'),
          vNoType     = vThisParent.attr('notype'),
          vNo         = vThis.parents('li.no:first').attr('no'),
          vTagType    = vThisParent.attr('tagtype')?vThisParent.attr('tagtype'):'list',
          vKey        = $(WEBREPORT.dataSource.options+' .btn input[name="p_'+vRel+'"]').is(':checked'),
          vHtml       = vKey?'<span key="true" rel="'+vRel+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>':
            '<span rel="'+vRel+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>';
          
        if(vElement == 'table'){
          vRel = (vType == 'node')?vRel:vThis.parents('ul').attr('rel');
          var vSetItem = true, vTable = $('body table[rel="'+vRel+'"]',vDocFrame.find('body'));
          creatLisType({pRel:vRel,pPos:vPos,pTagType:vTagType});

          /*if(!vTable[0]){
            vItem = [];
            vTagItem = [];
          }*/
          
          if(vType == 'node') {
            var vCol = $('ul[rel="'+vRel+'"]',vThisParent).attr('col');
            readItemArray({pObj:vTable,pType:vType,pCol:vCol});
            $('ul[rel="'+vRel+'"] li a span',vThisParent).each(function(e,i){
              var vThisText = $(this).text(), vThisRel = $(this).parents('li').attr('rel');
              vSetItem = setItemArray(vThisText,vThisRel);
              //setItemArrayTable({name:vThisRel,value:vThisText});
            });
            
          }else{
            readItemArray({pObj:vTable,pItem:vText,pRel:vRel});
            vSetItem = setItemArray(vText,vThisParent.attr('rel'));
            //setItemArrayTable({name:vText,value:vThisParent.attr('rel')});
          }
         // readArrayTable(vRel);
          //TAVARES
          //console.log(vArrayTable);

          creatLisType({pRel:vRel,pPos:vPos,pTagType:vTagType});
          /*if(vSetItem){
            if(vTable[0]){
              vTable.remove();
            }
              
            var table = creatTabel(vItem);
            vHtml = '<table rel="'+vRel+'" type="'+vTagType+'" pos="'+vPos+'" class="IGRP_table default-table">'+
              '<thead><tr>'+table.th+'</tr></thead>'+
              '<tbody><tr>'+table.td+'</tr></tbody></table>';
          }
          else*/
            vHtml = null;
          
        }else if(vElement == 'image'){
          vHtml = '<img src="'+path+'/iconApp/default.png" pos="'+vPos+'" no="'+vNo+'" rel="'+rel+'" style="height:80px; margin:5px; width:80px"/>';
        }else if(vElement == 'chart'){
          vHtml = null;
          var chartType = vThisParent.attr('charttype'), vChartExist = false, vChartExistVal = null;
          //var vUrl = $("input[name='"+WEBREPORT.aplicacao.link+"']").val();
          var vUrl ='http://igrpresp.teste.gov.cv/images/IGRP/app/RED/xml/RED_REPORT_REP_dash.xml';
          vArrayCharts.forEach(function(e,i){
            if (e.name == vRel){
              vChartExist = true;
              vChartExistVal = e.value;
            }
          });
          
          if (vChartExist) {
            if(vChartExistVal!= null){
              CKEDITOR.instances[WEBREPORT.textEditor].insertHtml(vChartExistVal);
              CKEDITOR.instances[WEBREPORT.textEditor].insertHtml(' ');
            }
          }else{
            IGRP_submitAjax({
              pUrl:vUrl,
              pTransf:true,
              pDiv:$('.gTransform','#transfome'),
              pMatch:'rows content > '+vRel,
              pXsl:path+"/xsl/tmpl/IGRP-graph.tmpl.xsl",
              pComplete:function(){
                var vDwidth ='400';
                setTimeout(function(){
                  vDwidth = $('.gTransform','#transfome').width();
                  if(chartType != 'tablecharts'){
                    $('g.highcharts-button',$(".gTransform",'#transfome')).remove();
                    $(".gTransform .highcharts-container svg",'#transfome').toImage();
                  }
                },1000);
                setTimeout(function(){
                  var vHtmlData = (chartType == 'tablecharts')?$(".gTransform .table_graph",'#transfome').html():
                    $(".gTransform .highcharts-container",'#transfome').html();
                  vHtml = '<span rel="'+vRel+'" pos="'+vPos+'" chartType="'+chartType+'" class="col" style="width:'+vDwidth+'px">'+
                    vHtmlData+'</span>';
                    
                  vArrayCharts.push({name:vRel,value:vHtml});
                  vHtml+='&nbsp;';
                  CKEDITOR.instances[WEBREPORT.textEditor].insertHtml(vHtml);
                  $('*[rel="'+vRel+'"]',vDocFrame.find('body')).attr('contenteditable','false');
                  $(".gTransform .IGRP_graph",'#transfome').highcharts().destroy();
                  $('.gTransform .IGRP_graph','#transfome').remove();
                  $('.gTransform','#transfome').html('');
                  vChart = true;
                },1100);
              }
            });
          }
        }else{
          if(vNoType == 'select' || vNoType == 'selectlist' || vNoType == 'checkboxlist' || vNoType == 'link'){
            vHtml = vKey?'<span key="true" rel="'+vRel+'" type="'+vNoType+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>':
              '<span rel="'+vRel+'" type="'+vNoType+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>';
          }
        }

        if(vHtml!= null){
          vHtml+='&nbsp;';
          CKEDITOR.instances[WEBREPORT.textEditor].insertHtml(vHtml);
          //$('*[rel="'+vRel+'"]',vDocFrame.find('body')).attr('contenteditable','false');
        }
      }
    });
  });

  function creatArrayDataSource(pArray){
    var vArray = [], dataSource = '';
    pArray.forEach(function(e,i){
      vArray.push({name:WEBREPORT.dataSource.selectName,value:e});
      dataSource += i > 0?'&p_id='+e:'p_id='+e;
    });
    return {vArrayId:vArray,vStringId:dataSource};
  }

  //change select datasource
  $('body').on('change','#'+WEBREPORT.dataSource.selectName,function(){
    $('#'+WEBREPORT.dataSource.selectName+'_chosen ul:first').removeClass('error');
    var vVal = $(this).val(), vName = $(this).attr('name'),
      vUrl = $("input[name='"+WEBREPORT.dataSource.link+"']").val();
      //vUrl = IGRP_getUrl('http://igrpresp.teste.gov.cv/images/IGRP/app/RED/xml/RED_REPORT_REP_dash.xml');
    if (vVal != '' && vVal != null) {
      var vValAux = creatArrayDataSource(vVal);
      vIdDataSorce = vValAux.vArrayId;
      vUrl = IGRP_getUrl(vUrl)+vValAux.vStringId;
      if (vIdResports!= null) {
        vUrl+='&p_template_id='+vIdResports;
      }
      IGRP_submitAjax({
        pUrl:vUrl,
        pTransf:true,
        pDiv:$(WEBREPORT.dataSource.id),
        pXsl:path+WEBREPORT.dataSource.tmplXsl,
        pComplete:function(){
          vLoadDataSource = true;
          reportDraggble();
          if ($('#'+WEBREPORT.dataSource.add).attr('href')) {
            $(WEBREPORT.dataSource.edit).attr('href',IGRP_getUrl($('#'+WEBREPORT.dataSource.add).attr('href'))+vName+'='+vIdDataSorce);
            $(WEBREPORT.dataSource.edit).addClass('active');
          }
        }
      });
      vItem = [];
      vTagItem = [];
    }else{
      $(WEBREPORT.dataSource.id).html('');
      vIdDataSorce = null;
      $(WEBREPORT.dataSource.edit).removeClass('active');
    }
  });

  //preencher select datasource com change app
  function remoteCombobox(pObj){
    var vOption = null, vOptionSelect = false;
    if(pObj.pXml!='' && pObj.pXml!= null) {
      $(WEBREPORT.listReport.add).addClass('active');//caso temos valor mostrar o botao adecionar novo template de report
      $("option",pObj.pSel).remove();// remover todos option do select
      pObj.pSel.trigger("chosen:updated");//actualiza o select
      var vLi = [];
      pObj.pXml.find('option').each(function(i,e){//precorrer todos option do selet
        var vText = $(e).find("text").text(),//pegar texto do option
          vOptionVal = $(e).find("value").text();//pegar valor do option
          vLi.push(vOptionVal);
        try{
          vOptionSelect = $(e).attr('selected');//verificar si temos campo seleccionado
        }catch(e){null;}

        vOption = new Option(vText, vOptionVal);//criar o option

        if(vOptionSelect)//caso temos campo seleccionado
          vOption.selected = true;//atriburir campo atributo select

        pObj.pSel.append(vOption);//adecionar no campo select
      });
      pObj.pSel.trigger("chosen:updated");//actualiza o select
      //pObj.pSel.val(vLi).multiselect("refresh");
    }else{
      $(WEBREPORT.listReport.add).removeClass('active');//esconder o botao adecionar template report
    }
    pObj.pSel.trigger('change');//e fazer chande no select
  }

  //change select app
  $('body').on('change','#'+WEBREPORT.aplicacao.selectName,function(){
    $('#'+WEBREPORT.aplicacao.selectName+'_chosen a').removeClass('error');
    $(WEBREPORT.listReport.showTitle).removeClass('active');//esconder titulo report
    var vVal = $(this).val(), vName = $(this).attr('name'),
      vUrl = $("input[name='"+WEBREPORT.aplicacao.link+"']").val(),
      vSelectDataSorce = $("select[name='"+WEBREPORT.dataSource.selectName+"']");
      //vUrl = 'http://igrpresp.teste.gov.cv/images/IGRP/app/RED/xml/RED_REPORT_REP_dash.xml',
    if (vVal != '' && vVal != null) {
      var vData = vName+'='+vVal;
      vIdApp = vVal;
      IGRP_submitAjax({//fazer submit do url da item obs:funsao criada no fichero IGRP-hamdler.js
        pUrl:vUrl,
        pData:vData,
        pTransf:true,
        pDiv:$(WEBREPORT.listReport.id),
        pXsl:path+WEBREPORT.aplicacao.tmplXsl,
        pXslParam:{vpath:path_tmpl},
        pAjaxComplete:function(data){//caso submit foi feito com sucesso
          var vXml = $(data.responseXML).find(WEBREPORT.dataSource.macthXmlDataSource);//pegar valores do campo select data sorce
          var vLink = $(data.responseXML).find(WEBREPORT.dataSource.macthXmlLinkAddDataSource).text();//pegar o link para os campor adecionar e editar data source
          if (vLink!= null && vLink!= ''){
            $('.'+WEBREPORT.dataSource.add).attr('href',vLink);//adecionar os links caso exita
            $('#'+WEBREPORT.dataSource.add).addClass('active');//mostrar os botoes
          }
          remoteCombobox({pXml:vXml,pSel:vSelectDataSorce});//adecionar valor ao select data source
        }
      });
      vItem = [];
      vTagItem = [];
    }else{//caso nao exista valor 
      $(WEBREPORT.listReport.add).removeClass('active');//esconder o botao adecionar template report
      $('.'+WEBREPORT.dataSource.add).removeClass('active');//esconder o botao adecionar data source
      $(WEBREPORT.listReport.id).html('');//limpar a lista dos templates report
      vIdApp = null;//limpar id da aplicacao
      vIdResports = null;//limpar id de report
      CKEDITOR.instances[WEBREPORT.textEditor].setData('');//limpar textEditor
      vSelectDataSorce.find("option").removeAttr("selected");//remover option selecionado do select data source
      vSelectDataSorce.trigger("chosen:updated");//actualizar o select data source
      vSelectDataSorce.trigger('change');//fazer change do select data source
    }
  });

  vIdApp = $("select[name='"+WEBREPORT.aplicacao.selectName+"']").val();
  if (vIdApp!= '' && vIdApp != null) {
    $("select[name='"+WEBREPORT.aplicacao.selectName+"']").trigger('change');
  }else{
    vIdApp = null;
  }

  function loadTemplate(p){
    IGRP_submitAjax({//fazer submit do url da item obs:funsao criada no fichero IGRP-hamdler.js
      pUrl:p.pRel,
      pAjaxComplete:function(data){//caso submit foi feito com sucesso
        var vText = data.responseText.replace(/\s+/g," ");//pagar o string retornado e retirar caso hover duplo espaco
        var vJson = $.parseJSON(vText);//converter o string e json para ser mas rapido manipulacao
        CKEDITOR.instances[WEBREPORT.textEditor].setData(vJson.textreport);//adecionar a parte editavel no textEditor
       
        if(p.pThis)
          p.pThis.addClass('active');//activar o item clicado

        $(WEBREPORT.listReport.showTitle).addClass('active');//show titulo report
        if($("select[name='"+WEBREPORT.dataSource.selectName+"']")[0]){
          var vIdSel = vJson.datasorce_app;//pegar o id de data source retornado obs: id do data source associado ao template report
          if (vIdSel != '' && vIdSel != null) {//caso exita id
            var vSelectDataSorce = $("select[name='"+WEBREPORT.dataSource.selectName+"']");//selecionar o select data source
            vSelectDataSorce.find("option").removeAttr("selected");//removel o valor selecionado
            var vLi = [];

            vIdSel = vIdSel.split(',');
            for (var i = 0; i < vIdSel.length; i++) {
              vSelectDataSorce.find("option").each(function(ix,ex){//precorrer todos os item o select data source e comparar o id com o id retornado
                if ($(ex).val() == vIdSel[i]) {//caso exita o id
                  $(ex).attr("selected","selected");//selecionar o valor como valor do select
                  vLi.push($(ex).val());
                }
              });
            }
            vSelectDataSorce.val(vLi).trigger("chosen:updated");//atualizar campo select source
            vSelectDataSorce.trigger('change');//fazer change do campo select data source
          }
        }
      }
    });
  }

  //Template click Report
  $('body').on('click',WEBREPORT.listReport.classItem,function(e){
    if(!$(e.target).hasClass("img")){
      vIdResports = $(this).attr('id');//pegar id do template report
      vLoadDataSource = false;//colocar variavel loadDataSource negativo
      $(WEBREPORT.listReport.reportTitle, WEBREPORT.listReport.showTitle).html($(this).text());//adeciona o titulo
      $(WEBREPORT.listReport.classItem).removeClass('active');//retirar ativado de qq item da lista
      loadTemplate({pRel:$(this).attr('rel'),pThis:$(this)});
      vItem = [];
      vTagItem = [];
    }
  });

  //Template Report hover btn
  $('body').on('mouseover',WEBREPORT.listReport.info,function(e){
    var vTop = $(e.currentTarget).parents('li:first').position().top+4, 
      vInfo = $(this).parents('a').attr('info'),
      vBodyHeight = $(e.delegateTarget).height();
      $(WEBREPORT.listReport.divInfo).html(vInfo);
    var vInfoHolder = $(WEBREPORT.listReport.divInfo).height();
    $(WEBREPORT.listReport.divInfo).removeClass("active bottom").removeAttr('style');
    
    var vInfoTop = window.ActiveXObject?(vTop+(vInfoHolder*2)):(vInfoHolder+vTop+(vInfoHolder/2))
    if(vInfoTop >= vBodyHeight) {
      $(WEBREPORT.listReport.divInfo).addClass("bottom");
      vTop -=vInfoHolder; 
    }
    
    $(WEBREPORT.listReport.divInfo).css({top:vTop}).addClass("active");
  });
  
  $('body').on('mouseout',WEBREPORT.listReport.info,function(e){
    $(WEBREPORT.listReport.divInfo).removeClass("active bottom").removeAttr('style');
  });

  $('body').on('click',WEBREPORT.listReport.edit,function(e){
    var vThisParent = $(this).parents('a:first'),
      vText = vThisParent.text(),
      vParamEdit = WEBREPORT.save.idReport+'='+vThisParent.attr('id');
    $('.title',WEBREPORT.dialogReport.id).html(JSMSG_EDIT+' '+WEBREPORT.dialogReport.addTitle.title);
    $('.message',WEBREPORT.dialogReport.id).html(WEBREPORT.dialogReport.addTitle.message);
    $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val(vText);
    $("input[name='"+WEBREPORT.dialogReport.addTitle.inputCodName+"']",WEBREPORT.dialogReport.id).val(vThisParent.attr('codigo'));
    showAddReports();//mostrar o dialog para adecionar titulo do template report
    $(WEBREPORT.dialogReport.id).unbind("click").on('click',WEBREPORT.dialogReport.ok,function(){//caso clicamos no botao OK
      var vTitle =  $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val(),
        vCodigo =   $("input[name='"+WEBREPORT.dialogReport.addTitle.inputCodName+"']",WEBREPORT.dialogReport.id).val();
      if (vTitle != '' && vTitle != null) {
        vParamEdit +='&'+WEBREPORT.save.title+'='+vTitle;
        if (vCodigo != '' && vCodigo != null)
          vParamEdit+='&'+WEBREPORT.dialogReport.addTitle.inputCodName+'='+vCodigo;

        vUrl = $("input[name='"+WEBREPORT.listReport.linkEdit+"']").val();
        IGRP_blackBody({pType:false});
        $(WEBREPORT.dialogReport.id).removeClass('active');//esconder o dialog
        IGRP_submitAjax({
          pUrl:vUrl,
          pData:vParamEdit,
          pAjaxComplete:function(data){
            $(WEBREPORT.listReport.id).XMLTransform({
              xsl:path+WEBREPORT.aplicacao.tmplXsl,
              xml:$("input[name='"+WEBREPORT.aplicacao.link+"']").val(),
              xslParams:{vpath:path_tmpl},
              xmlData:WEBREPORT.aplicacao.selectName+'='+vIdApp,
              complete:function(){
                if (vIdResports != null) {
                  if ( vIdResports == vThisParent.attr('id')) {
                    $(WEBREPORT.listReport.reportTitle, WEBREPORT.listReport.showTitle).html(vTitle);//adeciona o titulo
                    $(WEBREPORT.listReport.showTitle).addClass('active');
                  }
                  $("#"+vIdResports+WEBREPORT.listReport.classItem).addClass('active');//retirar ativado de qq item da lista
                }
                $("input[name='"+WEBREPORT.dialogReport.addTitle.inputName+"']",WEBREPORT.dialogReport.id).val(''),
                $("input[name='"+WEBREPORT.dialogReport.addTitle.inputCodName+"']",WEBREPORT.dialogReport.id).val('');
              }
            });
          }
        });
      }
    });
    cancelAddReports();//caso clicamos no cancelar esconde o dialog
  });

  buttonWebReportClick();//chamada da funcsao submit ou preview do template reportif

  if($('#p_fwl_load_template')[0]){
    if($('#p_fwl_tmplconfig').val() == 1){
      vIdResports = $('#p_fwl_id').val();//pegar id do template report
      $(WEBREPORT.listReport.reportTitle, WEBREPORT.listReport.showTitle).html($('#p_fwl_name').val());//adeciona o titulo
      var vUrl = IGRP_getUrl($('#p_fwl_load_template').val())+'p_id='+vIdResports;
      if($('#p_fwl_id_ocor')[0] && $('#p_fwl_id_ocor').val() != ''  && $('#p_fwl_id_ocor').val() != null)
        vUrl+='&p_fwl_id_ocor='+$('#p_fwl_id_ocor').val();

      loadTemplate({pRel:vUrl});
      setTimeout(function(){
        var data = CKEDITOR.instances[WEBREPORT.textEditor].getData();
        if(data == '' || data == null)
          //location.reload(true);
          loadTemplate({pRel:vUrl});
      },1100);
    }
  }
});