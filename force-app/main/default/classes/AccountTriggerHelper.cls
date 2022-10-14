public class AccountTriggerHelper 
{
    public static void BillingCountryUpdate(list<account> lstacc,map<id,Account> oldmap)
    {
        if(trigger.IsUpdate||trigger.IsInsert)
        {
             for(Account acc:lstacc)
            {
                if(trigger.IsInsert || (Trigger.IsUpdate && acc.rating!=oldmap.get(acc.id).rating))
                {
                    if(acc.rating=='Hot')
                    {
                        acc.billingCountry='UAE';
                    }
                    else if(acc.rating=='Warm')
                    {
                        acc.billingCountry='India';
                    }
                    else if(acc.rating=='Cold')
                    {
                        acc.billingCountry='Canada';
                    }
                    else acc.billingCountry='USA';
                }
            }
        }
    }
    
    public static void ShippingAddressUpdate(list<account> lstacc,map<id,account> oldmap)
    {
        for(Account a:lstacc)
        {
            /* for(Account Aold:trigger.old)
            {
            if(Aold.id==acc.id)
            {
            if(Aold.BillingCountry==acc.BillingCountry)
            {
            }	
            }*/
                        //Map<id,Account> oldmap=new map<id,account>();
                        /* Account oldacc=trigger.oldmap.get(a.id);
            If(a.billingCity!=oldacc.BillingCity)
            {
            
            }*/
            If(a.BillingCountry!=oldmap.get(a.Id).BillingCountry||
               a.BillingCity!=oldmap.get(a.Id).BillingCity||
               a.BillingPostalCode!=oldmap.get(a.Id).BillingPostalCode||
               a.BillingStreet!=oldmap.get(a.Id).BillingStreet)
                {
                    a.ShippingStreet=a.BillingStreet;
                    a.ShippingCity=a.BillingCity;
                    a.ShippingCountry=a.BillingCountry;
                    a.ShippingState=a.BillingState;
                    a.ShippingPostalCode=a.BillingPostalCode;
                }
        }
    }
    
    public static void ContactCreateList(list<account> lstacc)
    {
         List<contact> lstcon=new list<contact>();
            for(Account a:lstacc)
            {
                Contact c=new contact();
               c.LastName=a.Name;
                c.Email=a.Email__c;
                c.Phone=a.Phone;
                c.AccountId=a.Id;
                lstcon.add(c);
                system.debug(lstcon);
            }
        	If(!lstcon.Isempty())
                {
                insert lstcon;
                }
    }
    
    public static void ContactMailingAddressUpdate(map<id,account> oldmap,map<id,account> newmap)
    {
        List<contact> lsttoUpdate=new list<contact>();
        set<id> accid=new set<id>();
        for(account a:newmap.values())
        {
              if(a.BillingCity!=oldmap.get(a.id).billingCity ||
              a.BillingCountry!=oldmap.get(a.id).BillingCountry ||
              a.BillingPostalCode!=oldmap.get(a.id).BillingPostalCode ||
              a.BillingState!=oldmap.get(a.id).BillingState ||
              a.BillingStreet!=oldmap.get(a.id).BillingStreet )
            {
                accid.add(a.id);
            }
        }
        If(!accid.Isempty())
        {
            list<contact> lstcon=[select id,AccountId,MailingCity,MailingCountry,MailingState,MailingStreet,MailingPostalCode
                           from contact where AccountId=:accid];
             system.debug('forloop'+ [select id,AccountId,MailingCity,MailingCountry,MailingState,MailingStreet,MailingPostalCode
                           from contact where AccountId=:accid]);
            system.debug(lstcon);
            for(Contact c:lstcon)
            { 
                c.MailingCity=newmap.get(c.AccountId).BillingCity;
                c.MailingCountry=newmap.get(c.AccountId).BillingCountry;
                c.MailingPostalCode=newmap.get(c.AccountId).BillingPostalCode;
                c.MailingState=newmap.get(c.AccountId).BillingState;
                c.MailingStreet=newmap.get(c.AccountId).BillingStreet;
               lsttoUpdate.add(c);
                system.debug(lsttoUpdate);
            }
            If(!lsttoUpdate.IsEmpty())
            {
                Update lsttoUpdate;
            }
        }
    }
    Public static void AccountDeletion(map<id,Account> oldmap)
    {
         map<id,Integer> accmap=new map<id,Integer>();
        for(account a:[Select id,(select id from Contacts) from Account where id=:oldmap.keyset()])
        {
            system.debug([Select id,(select id from Contacts) from Account where id=:oldmap.keyset()]);
             system.debug([Select id,(select id from Contacts) from Account where id=:oldmap.Values()]);
            system.debug(oldmap.keyset());
            system.debug(oldmap.Values());
            if(a.contacts.size()>0)
            {
                system.debug(a.contacts.size());
                accmap.put(a.id,a.contacts.size());
                 system.debug(accmap.put(a.id,a.contacts.size()));
            }
            else
            {
                accmap.put(a.id,0);
                 system.debug( accmap.put(a.id,0));
            }
        }
       
            for(account a:oldmap.values())
            {
                  system.debug(a);
                if(accmap.get(a.id)>0)
                {
                    system.debug(a.id);
                    a.adderror('we have child contacts');
                }
            }
    }
}