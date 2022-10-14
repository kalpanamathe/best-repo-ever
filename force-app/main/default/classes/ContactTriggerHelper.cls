public class ContactTriggerHelper 
{
    public static void PrimaryContactCheck(list<contact> oldcontacts)
    {
        for(Contact c:oldcontacts)
            {
                if(c.primary_contact__c==true)
                {
                    c.adderror('Primary contact should not be deleted');
                }
            }
    }
    Public Static void ContactCount(list<contact> newlstcon,map<id,contact> oldmap,list<contact> oldlstcon)
    {
         set<id> accids=new set<id>();
        if(!trigger.isDelete)
        {
            for(Contact c:newlstcon)
            {
                if(trigger.IsInsert ||Trigger.IsUndelete)
                {
                    accids.add(c.AccountId);
                }
                if(trigger.isUpdate)
                {
                    if(c.AccountId!=oldmap.get(c.id).AccountId )
                    {
                        accids.add(c.AccountId);
                    	accids.add(oldmap.get(c.id).AccountId);
                    }
                    // if(c.AccountId==trigger.newmap.get(c.id).AccountId )
                    if(c.MailingCountry==oldmap.get(c.id).MailingCountry)
                     {
                         accids.add(c.AccountId);
                    	//accids.add(oldmap.get(c.id).AccountId);
                     }
                }
            }
        }
        else
        {
            for(Contact c:oldlstcon)
            {
                accids.add(c.AccountId);
            }
        }
        if(!accids.isEmpty())
        {
            List<Account> lstToUpdate=new list<Account>();
           /* List<account> lstacc=[select id,contact_count_C,(select id from contacts) from account where Id=:accids];
            for(Account a:listacc)
            {
            }*/
            for(Account a:[select id,Contact_Count__c,(select id from contacts) from account where Id=:accids])
            {
                system.debug(a.contacts.size());
                a.Contact_Count__c=a.contacts.size();
                lstToUpdate.add(a);
            }
            if(!lstToUpdate.IsEmpty())
            {
                update lstToUpdate;
            }
        }
          if(!accids.isEmpty())
        {
             List<Account> lstToUpdate=new list<Account>();
            for(Account b:[select id,India_Contacts_Count__c,(select id from contacts where MailingCountry='India') from account where Id=:accids])
            {
                 system.debug(b.contacts.size());
                b.India_Contacts_Count__c=b.contacts.size();
                lstToUpdate.add(b);
            }
            if(!lstToUpdate.IsEmpty())
            {
                update lstToUpdate;
            }
        }
    }
    //Primary Contact Unchecking
    //List<contact> newlistacc--- storing Trigger.new values in List
    //map<id,contact> ----storing trigger.oldmap values in map.while insert this value is null,Only while updating we will get this value
    public static void Primaryuncheck(List<contact> newlistacc,map<id,contact> oldmap)
    {
        system.debug(newlistacc);
        system.debug(oldmap);
        set<id> accids=new set<id>(); //Define set for account
        set<id> conIds=new set<id>(); //define set for contact
        for(contact c:newlistacc)
        {
            system.debug(c);
            system.debug(c.primary_contact__c);
            if(c.primary_contact__c==true) //checking primary contact check box is checked or not
            {
                system.debug(trigger.IsInsert);
                system.debug(trigger.IsUpdate);
                system.debug(c.AccountId);
                    system.debug(c.Id);
                if(trigger.IsInsert) //checking the condition if it is insert or not
                {
                    accids.add(c.AccountId); //adding contact accountid to the set< account>
                    conIds.add(c.Id); //adding contact Id to the set< contact>
                }
                if(trigger.IsUpdate)//checking the condition if it is Update or not
                {
                    if(c.AccountId!=oldmap.get(c.Id).AccountId) //checking new accountId and oldAccountId are same or not
                    {
                        system.debug(c.AccountId);
                        system.debug(oldmap.get(c.Id).AccountId);
                        accids.add(c.AccountId); //adding contact accountid to the set< account>
                        conIds.add(c.Id);//adding contact Id to the set< contact>
                    }
                }
            }
        }
        if(!accIds.IsEmpty())// checking is there any values in accids or not
        {
            list<contact> lsttoupdate=new list<contact>();//defne new list
            system.debug(lsttoupdate);
            for(Account a:[select id,(select id,primary_contact__C from contacts where Primary_contact__C=true and ID!=:conIds) 
                           from Account where Id=:accids])//getting id,Pcontact from contacts if Pcontact is yes& id!=cId
            {
                system.debug(a);
                if(a.contacts.size()>0) // checking the contacts size
                {
                    system.debug(a.contacts.size());
                    for(Contact c:a.contacts) //iterating
                    {
                        system.debug(c.primary_Contact__C);
                        c.primary_Contact__C=false;  //set primary conact to false
                        lsttoupdate.add(c); //addin the updated primary contact values and adding to list
                    }
                }
            }
            if(!lsttoupdate.isEmpty()) //checkiing list is empty or not
            {
                system.debug(lsttoupdate);
                update lsttoupdate;  // if list is not empty it will update into database
            }
        }
    }
    

    public Static void duplicateCheck(List<contact>  lstcon)//Method for duplicateCheck with relevant Parameters from trigger
    {
        map<string,Integer> conmap=new map<string,integer>();//Define map  for Contacts
        set<string> nameset=new set<string>();//Define set for names
        set<string> phoneset=new set<string>();//Define set for phones
        set<string> emailset=new set<string>();//Define set for Emails
        system.debug(lstcon);
        for(Contact c:lstcon)//Iterating by using list values
        {
            system.debug(conmap);
            string keyval=c.LastName+c.Phone+c.Email; //assigning lastname,phone&email to string
             system.debug(keyval);
             system.debug(conmap.containskey(keyval));
            nameset.add(c.LastName);//collecting lastname and assign it to nameset
            phoneset.add(c.Phone);//collecting Phone and assign it to phoneset
            emailset.add(c.Email);//collecting Email and assign it to emailset
            If(conmap.containskey(keyval))//verifying conmap containd key(checking the records which is comming from data loader)
            {
                Integer count=conmap.get(keyval);//assign conmap keyvalue to count
                count=count+1; //Increasing count value
                conmap.put(keyval,count);//assign key and value to conmap(this is  duplicate record)
                 system.debug(conmap);
            }
            else//verifying conmap containd no key 
            {
                conmap.put(Keyval,1);//assign key and value to conmap(this is not duplicate record)
                 system.debug(conmap);
            }
        }
        for(Contact c:[Select Id,Lastname,email,phone from Contact where lastname IN:Nameset AND Phone IN:Phoneset And Email IN:emailset])
             //Iterationg withlastname,email,phone from contacts
        {
             system.debug(c);
             string keyval=c.LastName+c.Phone+c.Email; //assigning lastname,phone&email to string
           
            If(conmap.containskey(keyval))//verifying conmap containd key(checking the records from existing records)
            {
                 system.debug(conmap.get(keyval));
                Integer count=conmap.get(keyval);//assign conmap keyvalue to count
                count=count+1;//Increasing count value
                conmap.put(keyval,count);//assign key and value to conmap(this is  duplicate record)
            }
            else//verifying conmap containd no key 
            {
                conmap.put(keyval,1);//assign key and value to conmap(this is not duplicate record)
                system.debug(conmap);
            }
        }
        if(!conmap.isEmpty())//verifying conamp contains values or not
        {
            for(Contact c:lstcon)//iterating with list
            {
                 system.debug(lstcon);
                string keyval=c.Lastname+c.Phone+c.Email; //assigning lastname,phone&email to string
                 system.debug(keyval);
                if(conmap.containskey(keyval)&& conmap.get(keyval)>1)//verifying conmap containd key and conmap keyvalue greterthan 1 
                {
                     system.debug(conmap.containskey(keyval));
                      system.debug(conmap.get(keyval));
                    c.adderror('Duplicate contact,try with different lastname,email and phone condition');// throwing error
                }
            }
        }
    }
}