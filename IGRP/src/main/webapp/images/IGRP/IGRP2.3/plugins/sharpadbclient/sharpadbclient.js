(function () {

    var com;

    $.IGRP.component('sharpadbclient', {

        call: function (p) {
            //$('.sa-nsweb').attr('src', "SACWebAPI:" + JSON.stringify(p));
            $.ajax({
                url     : 'https://localhost:5000/SACWebAPI/'+p.task ,
                method  : 'POST',
                data    : JSON.stringify(p.data),
                contentType: "application/json",
                dataType: "json",
                success : function(s){
                    
                    if(p.success)
                        p.success(s);
                    else{
                        console.log(s);
                    }
                },
                error : function(e){
                    
                    if(p.error)
                        p.error(e);
                    else{
                        console.log(e);
                    }
                }

            })
        },

        actions : function(str){

            var jsonEvents = {
                start : {
                    task: 'evaluationtasks',
                    id  : 1
                },
                stop : {
                    task: 'evaluationtasks',
                    id  : 2
                },
                sync : {
                    task: 'evaluationtasks',
                    id  : 3
                },
                pause : {
                    task: 'evaluationtasks',
                    id  : 4
                },
                config : {
                    task: 'apptasks',
                    id  : 1
                },
                install : {
                    task: 'apptasks',
                    id  : 2
                },
                uninstall : {
                    task: 'apptasks',
                    id  : 3
                }
            }

            return jsonEvents[str];
        },

        run : function(p){
            var action = com.actions(p.clicked.attr('sharpadbclient')),
                params = {
                    data : {
                        id  : action.id
                    },
                    task : action.task
                };

            if(p.url)
                params.data['url'] = p.url;

            if(p.success)
                params['success'] = p.success;

            if(p.error)
                params['error'] = p.error;

            com.call(params);
        },

        init: function () {
            com = this;
        }
    }, true);

})();