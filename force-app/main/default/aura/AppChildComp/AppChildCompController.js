({
    childComponentEvent : function(component, event, helper)
    {
        var cmpEvent=$A.get("e.c:AppCompEvt");
        var accname=component.get("v.accchildName")	;
        var phone=component.get("v.accchildPhone")	;
        var rating=component.get("v.accchildRating");
        cmpEvent.setParams({"accEvtName" :accname,"accEvtPhone":phone,"accEvtRating":rating});
        cmpEvent.fire();
    }
})