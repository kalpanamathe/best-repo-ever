public class Ssample
{
    public void Ssample1()
    {
        //Addition of 2 numbers
        Integer a = 10;
        Integer b = 20;
        Integer c = a+b;  //do multiplication,substraction,division using same pgrm
        System.debug('The result after addition is '+c);
        
        
        //Simple interest calculator
        Integer P = 10;
        Integer T = 20;
        Decimal R = 3.5;
        Double SI = (P*T*R)/100;
        System.debug('The interest amount is '+SI);
        
        
        //If else statements
        Integer Rank=1;  //Rank=2,3,4 -try changing rank see output
        if(Rank==1)
        {
            System.debug('You have got Gold medal');
        }
        else if(Rank==2)
        {
            System.debug('You have got Silver medal');
        }
        else if(Rank==3)
        {
            System.debug('You have got Bronze medal');
        } 
        else
        {
            System.debug('You will not get any medal');
        }
        
        
        //Nested If statement
        Integer Ranks=1;  //Rank=2,3,4 -try changing rank see output
        String Country ='India'; 
        if(Ranks==1)
        {
            if(Country =='India')
            {
                System.debug('You have got Gold medal from '+Country);
            }
            else  if(Country =='USA')
            {
                System.debug('You have got Gold medal from '+Country);
            }
        }
        else if(Ranks==2)
        {
            if(Country =='India')
            {
                System.debug('You have got Silver medal from '+Country);
            }
            else  if(Country =='USA')
            {
                System.debug('You have got Silver medal from '+Country);
            }
        }
        else
        {
            System.debug('You will not get any medal');
        }
        
        
 		//Area of triangle rect,trapizium
        Decimal a1;
        Decimal b1;
        Decimal c1;
        Decimal Area;
        String choice; //try giving choice values Tri,Rect,Trapi
        if(choice == 'Triangle'|| choice=='Tri')
        {
            Area = 0.5*a1*b1;
            System.debug('Area value is '+Area);
        }
        else if (choice =='Rectangle'||choice=='Rect')
        {
            Area = a1*b1;
            System.debug('Area value is '+Area);
        }
        else if(choice =='Trapizium'||choice=='Trapi')
        {
            Area = 0.5*(a1+b1)*c1;
            System.debug('Area value is '+Area);
        }
        
        
        //Greater of 3 numbers 
        Integer num1;
        Integer num2;
        Integer num3;
        if(num1>num2 && num1>num3)
        {
            System.debug('The greatest number is '+ num1);
        }
        else if(num2>num1 && num2>num3)
        {
            System.debug('The greatest number is '+ num2);
        }
        else if(num3>num1 && num3>num2){
            System.debug('The greatest number is '+ num3);
        }
    }
}