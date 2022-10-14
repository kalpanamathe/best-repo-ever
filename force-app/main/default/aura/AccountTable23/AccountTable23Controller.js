({
	getAcc : function(component, event, helper) {
        var action = component.get("c.getAccountRecords");
		action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                var accData = response.getReturnValue();
                component.set("v.accList",accData);
            }
            if(state === "ERROR"){
                //Error related statements
            }
        });
        $A.enqueueAction(action);
	}
})