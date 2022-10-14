public class OpportunityTriggerHelper //Helper Class for Opportunity
{
	public static void bookingCalculation(List<opportunity> lstopp,Map<Id,opportunity> oldmap) //Method for  Booking Calculation with relevant Parameters from trigger
	//In List we are getting Trigger.new values
	//In map we are getting Trigger.oldmap (Id,opportunity values)
    {
        set<id> accids=new set<Id>();//Define set for accountIds
        Integer currentYear=System.today().year();//getting current year by using this function
        Integer lastYear=system.today().addyears(-1).year();//getting Last year by using this function
        Integer lasttolastyear=system.today().addyears(-2).year();//getting Last to last year by using this function
        if(trigger.IsDelete) // This condition will work at the time of Delete
        {
            for(opportunity o:oldmap.values()) //Iterating by using oldmap.values
            {
                accids.add(o.AccountId);//collecting AccountIds and assining to accids
            }
        }
        else // It will work except deletion(Insert/Update/Undelete)
        {
            for(opportunity o:lstopp)//Iterating by using listopp(triger.new) values
            {
                if(trigger.IsInsert||trigger.IsUndelete) //It will work at the time of Insert and undelete
                {
                    accids.add(o.AccountId);//collecting AccountIds and assining to accids
                }
                if(trigger.IsUpdate)//It will work at the time of Update
                {
                    if(o.AccountId != oldmap.get(o.id).AccountId)
                        // It will work at the time of trigger.new accountId & oldmap AccountId(checking Condition for reparenting)
                    {
                        accids.add(o.AccountId);//collecting AccountIds and assining to accids
                        accids.add(oldmap.get(o.id).AccountId); //collecting  oldmap accountId and assining to accids
                    }
                    if(o.CloseDate != oldmap.get(o.id).CloseDate || o.Amount != oldmap.get(o.id).Amount ||
                       o.StageName == 'Closed Won' && oldmap.get(o.id).StageName != 'Closed Won')
                        // Verifing the closedate amount newstagename and oldstagenameis closed won
                    {
                        accids.add(o.AccountId);//collecting AccountIds and assining to accids
                    }
                }
            }
        }
        if(!accids.isEmpty())//Verifying accids is having data or not
        {
           List<account> lsttoupdate=new list<account>();//Define the Account list
            for(Account a: [select id,Bookings_Forecast__c,Bookings_Current_year__c,Bookings_Last_Year__c,
             Bookings_Last_to_Last_Year__c,(select id,IsWon,IsClosed,CloseDate,Amount from opportunities)
                from Account where Id=:accids]) 
           //Iterationg Indiviaul account wise Opportunities
           //First we are getting a1 opportunities,a2 opportunities....
            {
               Decimal cYearAmount=0;//Define dicamal for currentyear and assign 0 (if it not assign 0,the old values will carry forward to this)
               Decimal lYearAmount=0;//Define dicamal for lastyearamount and assign 0
               Decimal ltolastYearAmount=0;//Define dicamal for Lasttolastyearamount  and assign 0 
               Decimal forecastAmount=0;//Define dicamal for forecastamount and assign 0 
                if(!a.opportunities.isEmpty())//verifying opportunities having data or not
                {
                    for(opportunity o:a.opportunities)//Iterating with account opportunities
                    {
                        if(o.IsClosed==false)// verifying opportunity Isclosed is false or not
                        {
                            forecastAmount=forecastAmount+o.Amount; //assigning forecastamount and opportunity amount to forecast 
                        }
                        if(o.IsWon==true && o.CloseDate.year()==currentYear)// verifying opportunity IsWon and opportunity closedate is current year or not
                        {
                            cYearAmount=cYearAmount+o.Amount;//assigning cYearAmount  and opportunity amount to cyear
                        }
                         if(o.IsWon==true && o.CloseDate.year()==lastYear)//verifying opportunity IsWon and opportunity closedate is lastyear or not
                        {
                            lYearAmount=lYearAmount+o.Amount;//assigning lYearAmount and opportunity amount to lyear 
                        }
                           if(o.IsWon==true && o.CloseDate.year()==lasttolastYear)//verifying opportunity IsWon and opportunity closedate is ltolastyear or not
                        {
                            ltolastYearAmount=ltolastYearAmount+o.Amount;//assigning ltolastYearAmount and opportunity amount to ltolyear
                        }
                    }
                }
                a.Bookings_Forecast__c = forecastAmount;//assigning forecastamount to account-forecast
                a.Bookings_Current_year__c = cYearAmount;//assigning cYearAmount to account-Current_year
                    a.Bookings_Last_Year__c = lYearAmount;//assigning lYearAmount to account-Last_Year
                    a.Bookings_Last_to_Last_Year__c = ltolastYearAmount;//assigning ltolastYearAmount to account-Last_to_Last_Year
                lsttoupdate.add(a); //collecting Account values and assining to ListAccount
            }
            if(!lsttoupdate.isEmpty())////verifying ListAccount is  having data or not
            {
                update lsttoupdate;// updating ListAccount
            }
        }
    }
}