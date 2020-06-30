({
    Search: function(component, event, helper){
        var searchField = component.find('searchField');
        //this is for calling the helper function
        helper.SearchHelper(component,event);
    },

  save: function(component, event, helper){
 		var favQuo = component.get('v.favQuo');
   helper.SaveQuoteHelper(component,event);
},
})