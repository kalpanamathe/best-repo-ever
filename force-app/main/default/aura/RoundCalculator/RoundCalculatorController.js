({
   
    one : function(component, event, helper) {
         var res;
        if(component.get("v.result")=="0")
        {
            res=1;
        }
        else
        {
            res=component.get("v.result")+ "1";
        }
        component.set("v.result",res);
         
      
	},
     two : function(component, event, helper) { 
         var res;
        if(component.get("v.result")=="0")
        {
            res=2;
        }
        else
        {
            res=component.get("v.result")+ "2";
        }
        component.set("v.result",res);
	},
     three : function(component, event, helper) {
            var res;
        if(component.get("v.result")=="0")
        {
            res=3;
        }
        else
        {
            res=component.get("v.result")+ "3";
        }
        component.set("v.result",res);
	},
     four : function(component, event, helper) {
       var res;
        if(component.get("v.result")=="")
        {
            res=4;
        }
        else
        {
            res=component.get("v.result")+ "4";
        }
        component.set("v.result",res);
	},
     five : function(component, event, helper) {
       var res;
        if(component.get("v.result")=="")
        {
            res=5;
        }
        else
        {
            res=component.get("v.result")+ "5";
        }
        component.set("v.result",res);
	},
     six : function(component, event, helper) {
      var res;
        if(component.get("v.result")=="")
        {
            res=6;
        }
        else
        {
            res=component.get("v.result")+ "6";
        }
        component.set("v.result",res);
	},
     seven : function(component, event, helper) {
      var res;
        if(component.get("v.result")=="")
        {
            res=7;
        }
        else
        {
            res=component.get("v.result")+ "7";
        }
        component.set("v.result",res);
	},
     eight : function(component, event, helper) {
       var res;
        if(component.get("v.result")=="")
        {
            res=8;
        }
        else
        {
            res=component.get("v.result")+ "8";
        }
        component.set("v.result",res);
	},
     nine : function(component, event, helper) {
     var res;
        if(component.get("v.result")=="")
        {
            res=9;
        }
        else
        {
            res=component.get("v.result")+ "9";
        }
        component.set("v.result",res);
	},
     zero : function(component, event, helper) {
     var res;
        if(component.get("v.result")=="")
        {
            res=0;
        }
        else
        {
            res=component.get("v.result")+ "0";
        }
        component.set("v.result",res);
	},
    
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