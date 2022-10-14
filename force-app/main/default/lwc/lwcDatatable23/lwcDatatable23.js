import { LightningElement,wire } from 'lwc';
import getAccount from '@salesforce/apex/AccountTable23.getAccountRecords';
export default class LwcDatatable23 extends LightningElement 
{
@wire(getAccount)
accounts;
actions = [
    { label: 'Show details', name: 'show_details' },
    { label: 'Delete', name: 'delete' }
];
 columns=[
      {label: 'Account Id',fieldName:'Id',type:'url'},
     {label: 'Account name',fieldName:'Name',type:'text'},
     {label: 'Industry',fieldName:'Industry',type:'text'},
     {label: 'Type',fieldName:'Type',type:'text'},
     {label: 'Phone',fieldName:'Phone',type:'phone'},
     {
       type: 'action', 
      typeAttributes: { rowActions:this.actions },
     },
     
 ];
 connectedCallback()
 {
     this.getAccountData();
 }
 getAccountData()
 {
     getAccount()
     .then(result=>{
         this.accountdata=result;
     })
     .catch(error=>
     {
         console.error('**error**\n',error);
     })
    }
}