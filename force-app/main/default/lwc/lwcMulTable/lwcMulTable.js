import { LightningElement } from 'lwc';

export default class LwcMulTable extends LightningElement
{ 
    tableNumber;
    table=[];
    firstNumberChange(event){
        this.tableNumber = event.target.value;
    }
    multiplyValue(event) {
        this.table=[];
        for(var i=1; i<=10; i++) {
           this.table.push(this.tableNumber + 'X' + i + '=' + this.tableNumber * i);
        }  
    }
}