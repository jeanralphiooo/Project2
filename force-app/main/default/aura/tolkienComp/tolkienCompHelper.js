({
    SearchHelper : function(component, event) {
        
        var action = component.get("c.getCharacter");
        action.setParams({
            'search': component.get('v.searchFor')
});
        action.setCallback(this, function(response){
            var state = response.getState();
        if(state === "SUCCESS"){
            component.set("v.result", response.getReturnValue());
            
        }
        
        else if (state !== "SUCCESS"){
            alert('AW HELLNAH');
        }
                   });
    $A.enqueueAction(action);

    },

})