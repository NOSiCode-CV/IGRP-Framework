(function(){

   VARS.getGen().GroupContainerMenus = () => {

    const menus = $(".treeview-menu.gen-containers");

    const accordionId = "gen-containers-accordion-wrapper";
  
    const accordionElement = $(
      `<div class="accordion mt-2" id="${accordionId}"></div>`
    );
  
    const groups = {
      form: {
        title : 'Formulários',
        list : []
      },
  
      table: {
        title : 'Listas',
        list : []
      },
  
      menu : {
        title : 'Ações',
        list : []
      },

      content:{
        title : 'Conteúdos',
        list : []
      },

      layout : {
        title : 'Layout',
        list : []
      },

      chart: {
        title : 'Gráficos',
        list : []
      },

      map : {
        title : 'Mapa',
        list : []
      },
  
      widget: {
        title : 'Widgets',
        list : []
      },
  
      other: {
        title : 'Outros',
        list : []
      },
      
    };
  
    const setGroups = ()=>{
      
      menus.find(">li.gen-declared-containers").each(function (i, el) {
        var groupAttr = $(el).attr('group');
        var group = groups[groupAttr] ? groupAttr : 'other';
        groups[group].list.push({
          element : el,
          index : i
        })
      });
    };
    

    const groupContent = (list)=>{
      const content = $('<ul class="treeview-menu gen-containers menu-open row g-3"></ul>');
      list?.map((item,i)=>content.append(item.element));
      return content;
    } 

    const drawGroups = ()=>{
      for (const groupKey in groups) {
        const group = groups[groupKey];

        var itemElement = $(VARS.templates.accordionItemHtml({
          headingId:`heading-group-${groupKey}`,
          id:'gen-group-'+groupKey,
          title: group.title || capitalizeFirstLetter(groupKey),
          parentId:accordionId,
          
        }));

        itemElement.find('.accordion-body').append( groupContent(group.list) );
        if(itemElement.find('.gen-containers>li')[0])
          accordionElement.append(itemElement)

      }
    }
  
    setGroups();

    drawGroups();

    $('#gen-list-components').prepend(accordionElement);
    
  };
  
  

})();
