({
    // doinit method ---(when page is loaded it will execute)
    doInit: function(component, event, helper) {
         var actions = [
            { label: 'Show details', name: 'show_details' },
            { label: 'Delete', name: 'delete' }
        ];
         component.set('v.columns',[
              {label: 'Account Id',fieldName:'Id',type:'url'},
             {label: 'Account name',fieldName:'Name',type:'text'},
             {label: 'Industry',fieldName:'Industry',type:'text'},
             {label: 'Type',fieldName:'Type',type:'text'},
             {label: 'Phone',fieldName:'Phone',type:'phone'},
              { type: 'action', typeAttributes: { rowActions: actions } }
             
         ]);
        helper.getAcc(component);
	},
    
    //click on button it will execute
	getAcc : function(component, event, helper)
    {   
        helper.getAcc(component);
	},
    
    //when you click on showdetails or delete it will execute
      handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
          alert('Action details :'+JSON.stringify(action));
        var row = event.getParam('row');
 		alert('Showing details :'+JSON.stringify(action));
        switch (action.name) {
            case 'show_details':
                alert('Showing Details: ' + JSON.stringify(row));
                break;
            case 'delete':
                helper.deleteAcc(cmp,row);
               // helper.removeBook(cmp, row);
                break;
        }
    }
})