({
    SearchHelper : function(component, event) {
        
        var action = component.get("c.getCharacter");
        action.setParams({
            'search': component.get('v.searchFor')
});
        action.setCallback(this, function(response){
            var state = response.getState();
        if(state === "SUCCESS"){
            component.set("v.favQuo", response.getReturnValue());
          
            console.log(component.get("v.favQuo"));
            
        }
        
        else if (state !== "SUCCESS"){
            alert('Error');
        }
                   });
    $A.enqueueAction(action);

    },
    
    SaveQuoteHelper : function(component, event){
        var action = component.get("c.saveQuote");
        
        action.setParams({
         'favQuo': component.get('v.favQuo')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                //component.set("V.favQuo", response.getReturnValue());
            }
            else if(state !== "SUCCESS"){
                console.log(response.getReturnValue());
					alert('Error');
            }
        });
        $A.enqueueAction(action);
        
    }

})