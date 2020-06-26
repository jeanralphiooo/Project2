({
    Search: function(component, event, helper){
        var searchField = component.find('searchField');
        //this is for calling the helper function
        helper.SearchHelper(component,event);
    }
})