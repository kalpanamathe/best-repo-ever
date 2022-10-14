({
	handleComponentEvent : function(component, event, helper) 
    {
        //Getting Event Properties
	var accname=event.getParam("accEvtName")	;
        var phone=event.getParam("accEvtPhone")	;
        var rating=event.getParam("accEvtRating");
        //Setting our component Attributes
        component.set("v.accParentName",accname);
         component.set("v.accParentPhone",phone);
         component.set("v.accParentRating",rating);
	},
    handleAppComponentEvent: function(component, event, helper) 
    {
	var accname=event.getParam("accEvtName")	;
        var phone=event.getParam("accEvtPhone")	;
        var rating=event.getParam("accEvtRating");
        component.set("v.accParentName",accname);
         component.set("v.accParentPhone",phone);
         component.set("v.accParentRating",rating);
	}
})