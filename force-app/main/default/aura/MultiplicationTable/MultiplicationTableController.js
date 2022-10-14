({
	getAcc : function(component, event, helper) {
        var tnumber=component.get("v.Number");
         var table=[];
        for( var i=1;i<=10;i++)
        {   
           table.push(i+'*'+tnumber+'='+i*tnumber);
        
        } 
         component.set("v.table", table );
    }
})