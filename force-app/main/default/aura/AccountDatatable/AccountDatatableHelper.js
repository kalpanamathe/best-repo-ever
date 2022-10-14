({
    getAcc : function(component) {
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
    },
    
    deleteAcc : function(component,row) {
     
        var action = component.get("c.deleteAcc");   //calling this deleteAcc from apex class
        action.setParams({accId:row.Id}); //setparams is to sending parameters from 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //below code copied from component library--events->force->showToast
                ////-----------Start
                var toastEvent = $A.get("e.force:showToast");//getting events from events->force->showToast
                toastEvent.setParams({
                    "title": "Success!",
                     "mode": "sticky",
                    "message": "The record has been Deleted successfully."
                });
                toastEvent.fire(); //this event will fire and display relevant error message
                //-------------End
                var accData = response.getReturnValue();//getting response from server
                component.set("v.accList",accData);//setting local variables
            }
            if(state === "ERROR"){
                //Error related statements
            }
        });
        $A.enqueueAction(action);
    }
})