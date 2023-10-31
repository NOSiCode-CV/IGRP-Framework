(function(){
    var GEN = VARS.getGen();

    let first = false;

    GEN.state = {

        states : [],

        set : (state)=>{
            GEN.state.states.push(state)
        },

        init : (data = {})=>{
         /*   const initialData = $.extend({},data);
            GEN.state.set( initialData );
            
            setTimeout( ()=>{
                GEN.import( initialData )
            }, 1500 );
          //  console.log(GEN.state.states[0])
*/
       
        }

    }

    $(document).on('import-complete', (e, data)=>{
        if(!first)
            GEN.state.init(data);
    })

})();