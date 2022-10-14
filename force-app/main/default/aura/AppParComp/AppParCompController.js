({
	handleAppComponentEvent : function(component, event, helper)
    {
		var accname=event.getParam("accEvtName")	;
        var phone=event.getParam("accEvtPhone")	;
        var rating=event.getParam("accEvtRating");
        component.set("v.accParentName",accname);
         component.set("v.accParentPhone",phone);
         component.set("v.accParentRating",rating);
	}
})