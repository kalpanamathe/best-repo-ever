public class Student {
     public String studentName='Kalpana';
    public Integer age=18;
    public double height=5.4;
    public double weight=50;
   public date dob= Date.newInstance(1960, 2, 17);
   //public string Gender;
     public  Student()
     {
         
       BankExample23 be=new BankExample23();
   double d=be.Withdraw(9000);
         system.debug('d is' +d);
   }
       public string CalculatingResult(double sub1,double sub2,double sub3,double sub4,double sub5)
   {
       string result='';
        Decimal average=  (sub1+sub2+sub3+sub4+sub5)/5;
       If((sub1>=50) && (sub2>=50) && (sub3>=50) && (sub4>=50) && (sub5>=50))
       {
               if(average>50 && average<=70)
               {
                   result='C';
               }
           if(average>70 && average <=90)
               {
                   result='B';
               } else 
           if(average>90)
               {
                   result='A';
               }
       }
          else
          {
          result='Fail';
          }
        system.debug('result is: '+result);
       return result;
   }
    
    
    
    
    
    /* public void sname()
    {
         System.debug('Student Name:'+studentName);
    }
     public void Birthday()
    {
         System.debug('Student Birthday is on :'+dob);
    }
   public void Read()
    {
         System.debug( studentName + ' is Reading:');
    }
    public void Walk()
    {
         System.debug( studentName + ' is Walking:');
    }
     public void sheight()
    {
        System.debug(studentName + ' Height is: '+height);
    } */
    
    
    Public void Studentnumber()
    {
        for(integer i=1;i<=10;i++)
        {
            system.debug('i val is :'+i);
        }
        for(integer i=10;i>0;i--)
        {
            system.debug('Reverse i val is :'+i);
        }
    }
    public void multitable(integer num,Integer upto)
    {
        for(Integer i=1;i<=upto;i++)
        {
            integer val=num * i;
            System.debug(+num +'*' +i +'=' +val); 
        }
    }
    
}