({
	add : function(component, event, helper) {
      var fNumber=component.get("v.firstNumber");
      var sNumber=component.get("v.secondNumber");
      var res= parseInt(fNumber) + parseInt(sNumber);
      component.set("v.result",res);
		
	},
    sub : function(component, event, helper) {
         var fNumber=component.get("v.firstNumber");
      var sNumber=component.get("v.secondNumber");
        var res= fNumber - sNumber;
        component.set("v.result",res);
	},
    mul : function(component, event, helper) {
        var fNumber=component.get("v.firstNumber");
      var sNumber=component.get("v.secondNumber");
         var res= fNumber * sNumber;
        component.set("v.result",res);
	},
    div : function(component, event, helper) {
     var fNumber=component.get("v.firstNumber");
      var sNumber=component.get("v.secondNumber");
       var res= fNumber / sNumber;
        component.set("v.result",res);
	}
})