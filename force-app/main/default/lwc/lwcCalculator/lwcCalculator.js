import { LightningElement } from 'lwc';

export default class LwcCalculator extends LightningElement 
{
    firstNumber;
    secondNumber;
    result;
    firstNumberChange(event)
    {
        this.firstNumber= event.target.value;
    }
    secondNumberChange(event)
    {
        this.secondNumber=event.target.value;
    }
    add(event)
    {
        this.result=parseInt(this.firstNumber)+parseInt(this.secondNumber);
    }
    mul(event)
    {
        this.result=parseInt(this.firstNumber)*parseInt(this.secondNumber);
    }
    sub(event)
    {
        this.result=parseInt(this.firstNumber)-parseInt(this.secondNumber);
    }
    div(event)
    {
        this.result=parseInt(this.firstNumber)/parseInt(this.secondNumber);
    }
}