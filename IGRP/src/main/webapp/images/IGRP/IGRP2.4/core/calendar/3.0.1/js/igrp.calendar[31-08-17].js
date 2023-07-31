(function(IGRP){
   
    var calendars = {};

    var _opts     = {
        locale:'pt'
    }

    var calendarComponent = new IGRP.component('calendar',{
        get:function(id){
            return calendars[id];
        },
        getViewParam : function(id){
            var view = $.IGRP.components.calendar.get(id).fullCalendar('getView');

            $.IGRP.utils.createHidden({
                name :'p_start',
                value:view.intervalStart.format().igrpDateFormat(),
                class:'submittable'
            });

            $.IGRP.utils.createHidden({
                name :'p_end',
                value:view.intervalEnd.format().igrpDateFormat(),
                class:'submittable'
            });

            $.IGRP.utils.createHidden({
                name :'p_view',
                value:view.type,
                class:'submittable'
            });
        },
        resizeORdropEvent : function(p){
            var param = 'p_event_id='+p.event.id;

            param +='&p_start='+p.event.start.format();

            if (p.event.end)
                param +='&p_end='+p.event.end.format();

            $.ajax({
                url : p.url,
                data: param
            }).done(function(e){
                /*$.IGRP.notify({
                    message : $.IGRP.utils.htmlDecode(e.msg),
                    type    : e.type
                });*/
            }).fail(function(d){
                p.revert();
            });
        },
        init:function(id,p){
            var options = $.extend(_opts,p),
                cal     = $('.igrp-calendar#'+id),
                view    = p.defaultview ? p.defaultview : 'month',
                date    = p.defaultdate ? p.defaultdate.replace(/(\d*)-(\d*)-(\d*)/,'$2-$1-$3') : new Date().toJSON().slice(0,10);
           
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
                locale      : options.locale,
                defaultDate : date.iSoDateFormat(),
                editable    : true,
                eventLimit  : true,
                defaultView :view,
                //events: p.events,
                events:p.loadevents,
                eventColor: '#4496C1',
                loading:function(isLoading, view ){
                    if(isLoading)
                        $.IGRP.utils.loading.show(holder);
                    else
                        $.IGRP.utils.loading.hide(holder);
                },
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
                                scope : '.fc-event-container>a',
                                menu  : '.igrp-calendar-ctx',
                                setPosition:function(e,p){

                                    var parent      = $(p.ctxMenu.parents('.box')[0]),
                                        parentLeft  = parent.offset().left,
                                        parentTop   = parent.offset().top,
                                        ctxLeft     = e.pageX-parentLeft,
                                        ctxTop      = e.pageY-parentTop;

                                    if (e.pageX-parentLeft+p.ctxMenu.width() > parent.width())
                                        ctxLeft = ctxLeft - p.ctxMenu.width()
                                    
                                    p.ctxMenu.css({
                                        top  : ctxTop,
                                        left : ctxLeft
                                    });
                                }
                            });
                        }
                    });

                    $.IGRP.components.calendar.getViewParam(id);
                },
                dayClick: function(date, allDay ,jsEvent, view) {
                    var param = 'p_date='+date.format().igrpDateFormat();
                    
                    //param +='&p_type='+$('#p_type').val();

                    if (p.addevents) {
                        $.IGRP.components.iframeNav.set({
                            url    :$.IGRP.utils.getUrl(p.addevents)+param
                            //clicked:$('<a close="refresh"/>')
                        });
                    }
                },
                eventClick: function(event, jsEvent, view) {
                    if (p.addevents) {
                        $.IGRP.components.iframeNav.set({
                            url    :$.IGRP.utils.getUrl(p.addevents)+'p_event_id='+event.id,
                        });
                    }
                },
                eventDrop: function(event, delta, revertFunc, jsEvent) {
                    $.IGRP.components.calendar.resizeORdropEvent({
                        event   : event,
                        delta   : delta,
                        revert  : revertFunc,
                        id      : id,
                        jsEvent : jsEvent,
                        url     : p.addevents
                    });
                },
                eventResize: function(event, delta, revertFunc) {
                    $.IGRP.components.calendar.resizeORdropEvent({
                        event   : event,
                        delta   : delta,
                        revert  : revertFunc,
                        id      : id,
                        url     : p.addevents
                    });
                }
            });
            calendars[id] = calendar;
        }
    });
})($.IGRP);