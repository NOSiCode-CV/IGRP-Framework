(function(){
   
    var calendars = {},
     _opts     = {
        locale:'pt'
    },
    com;

    $.IGRP.component('calendar',{ 
        get:function(id){
            return calendars[id];
        },
        init:function(id,p){
            var options = $.extend(_opts,p);
            var cal      = $('.igrp-calendar#'+id);

            cal.on('contextmenu', function (e) {
                e.preventDefault();
            });
            
            var holder = cal.parent();

            var calendar = cal.fullCalendar({
                header:{
                    left    : 'prev,title,next',
                    center  : '',
                    right   : 'month,agendaWeek,agendaDay,today'
                },
                displayEventEnd :{
                    month     : true,
                    basicWeek : true,
                    default   : true
                },
                locale      :options.locale,
                editable    :true,
                eventLimit  : true,
                //events: p.events,
                events:p.eventsUrl,
                eventAfterRender:function( event, element, view ) {
                    var ctxParams = event["context-param"];
                    element.attr('CTX_PARAM_COUNT',ctxParams.length);
                    
                    ctxParams.forEach(function(c,i){
                        var idx = i+1;
                        element.attr('ctx_p'+idx,c);
                    });

                    element.bind('mousedown', function (e) {
                        if (e.which == 3) {
                            //contextMenu
                            $.IGRP.components.contextMenu.set(holder,{
                                scope :'.fc-event-container>a',
                                menu  :'.igrp-calendar-ctx',
                                setPosition:function(e,p){

                                    var parent     = $(p.ctxMenu.parents('.box')[0])
                                    var parentLeft = parent.offset().left;
                                    var parentTop  = parent.offset().top;

                                    var ctxLeft = e.pageX-parentLeft;
                                    var ctxTop  = e.pageY-parentTop

                                    if ( e.pageX-parentLeft+p.ctxMenu.width() > parent.width())
                                        ctxLeft = ctxLeft - p.ctxMenu.width()
                                    
                                    p.ctxMenu.css({
                                        top  : ctxTop,
                                        left : ctxLeft
                                    });

                                }
                            });
                        }
                    });

                }
            });
            console.log(id);
            console.log(calendar);
            
            calendars[id] = calendar;

        }
    },true);
})();
