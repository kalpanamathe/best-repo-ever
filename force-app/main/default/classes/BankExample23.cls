public class BankExample23 {
	Public string CustomerName='Kalpana';
    public string accNumber='Kal123';
    public string branchName='HYD';
    public date  dateofBirth;
    public decimal CurrentBalance=10000;
    public decimal withDrawAmount=5000;
    public decimal depositAmount=6000;
    public string payeeName='As3k';
    public string payeeAccountNumber='Pay123';
    public decimal payeeBalance=5000;
   public  BankExample23()
   {
       checkBalance();
   }
      public  BankExample23(double CCbalance)
      {
          System.debug('Available Balance is: '+CCbalance);
      }
   public void checkBalance()
    {
        
        System.debug('Available Balance is: '+CurrentBalance);
      //checkbalanceWithoutReturnType();
        checkbalanceWithReturnType();
    }
    public decimal checkbalanceWithReturnType()
    {
        CurrentBalance=15000;
        return CurrentBalance;
    }
    public void checkbalanceWithoutReturnType()
    {
        CurrentBalance=20000;
    }
    public Decimal  Withdraw(Decimal wamount)
    {
        System.debug('Current Balance Before withdraw :'+CurrentBalance);
        System.debug(' withDrawAmount Before withdraw :'+wamount);
        CurrentBalance=CurrentBalance - wamount;
        wamount = 0;
        return CurrentBalance;
        //checkBalance();
    }
    public void Deposit(Decimal damount)
    {
        Decimal cashback=0;
        string customertype='';
        if(damount>5000 && damount<=10000)
           {
               cashback=100;
           }else if(damount>10000 && damount<=50000)
           {
               cashback=200;
           }else if(damount>50000 && damount<=100000)
           {
               cashback=500;
           }else if(damount>100000)
           { 
               cashback=1000;
               if(damount>100000 && damount<=5000000)
               {
                customertype='Priority3';   
               }
               if(damount>5000000 && damount<=10000000)
               {
                customertype='Priority2';   
               }
               else
               {
                customertype='Priority1';   
               }
           }
          
        System.debug('cash back amount is :'+cashback);
        
        System.debug('Cwustoet ttype is :'+customertype);
        System.debug('Current Balance Before withdraw :'+CurrentBalance);
        System.debug(' withDrawAmount Before withdraw :'+damount);
        CurrentBalance=CurrentBalance + damount;
        damount = 0;
        checkBalance();
    }
    public void Transfer(Decimal transferamount)
    {
        System.debug('Current Balance Before Transfer :'+CurrentBalance);
        System.debug(' PayeeBalance :'+payeeBalance);
         System.debug(' Transfer Amount :'+transferamount);
        CurrentBalance=CurrentBalance - transferamount;
        payeeBalance = payeeBalance + transferamount;
        System.debug('Current Balance After Transfer :'+CurrentBalance);
        System.debug(' PayeeBalance :'+payeeBalance);
         System.debug(' Transfer Amount :'+transferamount);
        checkBalance();
    }
    public Decimal  IntrestCalculator(Double principleAmount,integer duration,Double intrestRate)
    {
        System.debug('Principle Amount is :'+principleAmount );
        System.debug('duration  is :'+duration );
        System.debug('intrestRate is :'+intrestRate );
        
        Double intrestAmount= (principleAmount * intrestRate * duration)/100;
        System.debug('Intrestrate  is :'+intrestAmount );
        return intrestAmount;
    }
    
    
    
}