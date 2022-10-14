public class LeadaTriggerHelper 
{
    public static void duplicatecheck(list<lead> lstLead)//Method for duplicateCheck with relevant Parameters from trigger
    {
        set<String> emailset=new set<string>();//Define set to collect Emails
        map<string,boolean> emailmap=new map<string,boolean>(); //Define map  to collect emails(if the email is available we can set it ture)
        for(lead l:lstLead)//Iterating by using list values
        {
            emailset.add(l.Email);//collecting emails Ids assigning to emailset(By collecting emails iam checking in contacts&users it it there or not)
        }
        if(!emailset.isEmpty())//checking emailset is empty or not
        {
            List<Contact> lstcon=[select id,email from contact where email In :emailset];//getting id,email from contacts where email is in emailset
            List<user> lstuser=[select id,email from user where email In :emailset];//getting id,email from users where email is in emailset
            for(Contact c:lstcon)//Iterating by using listcontact  values
            {
               if(!emailmap.containsKey(c.email))//checking emailmap contains keyvalue of email or not
                {
                    emailmap.put(c.email,true);  //assign key(email) and value is true to emailmap(true means email is available otherwise it is false)
                }
            }
            for(user u:lstuser)//Iterating by using listuser  values
            {
                if(!emailmap.containsKey(u.email))//checking emailmap contains keyvalue of email or not
                {
                    emailmap.put(u.email,true); //assign key(email) and value is true to emailmap(
                }
            }
                if(!emailmap.isEmpty())//checking emailmap is empty or not
            {
                for(lead l:lstlead)//Iterating by using listlead  values
                {
                    if(emailmap.containsKey(l.email))//checking emailmap contains keyvalue of email or not
                    {
                        l.addError('Duplicate Email');// throwing error
                    }
                }
            }
        }
    }
    
    
    //Lead convertion
 public static void leadConvert(List<Lead> leadLst,Map<Id,lead> oldMap)//Method for Lead convertion with relevant Parameters from trigger
 {
     set<String> companyNumber = new set<String>();//Define companyNumber
     Map<String,Id> accParentMap = new Map<String,Id>();//Define map  for Parent Account
     list<Account> accountsToCreate = new List<Account>();//Define List  for new Account
     list<Contact> contactsToCreate = new List<Contact>();//Define List  for new Contact
     list<Lead> leadsTocconvert = new List<Lead>();//Define List  for Lead
     Map<String,Id> AccountEmailMap = new Map<String,Id>();//Define map  for AccountEmail
	 Map<String,Id> contactEmailMap = new Map<String,Id>();//Define map  for ContactEmail
     set<Id> leadIds = new set<id>();//Define set  for Leads
     for(Lead l:leadLst)//Iterating with newlead
     {
          if(oldMap!=null)//verifying oldmap is having values or not
          {
              if(l.Company_Number__c != oldmap.get(l.Id).Company_Number__c)//verifying current Companyno with old companyNo
              {
                  companyNumber.add(l.Company_Number__c);//assigning new companyno to companynumber
              }
              else//verifying current Companyno with old companyNo
              {
                  companyNumber.add(l.Company_Number__c);//assigning old companyno to companynumber
              }
          }
     }
     system.debug('companyNumber:'+companyNumber);
     List<Account> lstAcc = [select id,company_Number__c from Account where company_Number__c In : companyNumber];
     //checking companyno available or not,if availble assign to the list
     system.debug('lstAcc:'+lstAcc);
     if(lstAcc.size()>0) //verifying the list size contains records or not
     {
         for(Account a:lstAcc) //iterating listAcc records with account
         {
             accParentMap.put(a.Company_Number__c,a.Id);//assigning company no and id to accparentmap
         }
     }
     for(Lead l:leadLst)// iterating with the new lead
     {
         if(accParentMap.containskey(l.Company_Number__c))//verifying accparentmap contains company no or not
         {
             Account a = new Account(name=l.FirstName+l.LastName,
                                     phone=l.Phone,
                                     parentid= accParentMap.get(l.Company_Number__c),
                                     Email__c = l.Email);//populated  accparentmap record fields into new Account
                                     accountsToCreate.add(a);//assign  new-account record to listAccount
                                     leadIds.add(l.Id); //assign lead-id to setleadID
                                     leadsTocconvert.add(l);//assign newlead to listleadstoconvert
         }
     }
     system.debug('accountsToCreate:'+accountsToCreate);
     system.debug('leadsTocconvert:'+leadsTocconvert);
     String jsonstring = JSON.serialize(leadLst); //converting newLead to JSon format
     if(accountsToCreate.size()>0) //checking accountsToCreate size is greater then 0 or not
     {
         insert accountsToCreate; //created new Account
         for(Account a:accountsToCreate)//iterating newAccount
         {
             AccountEmailMap.put(a.Email__c,a.Id);// adding account Email&Id to accountemailmap
         }
         for(Lead l:leadLst)//iterating newlead
         {
             if(accParentMap.containskey(l.Company_Number__c))//checking companynumber is available or not
             {
                 Contact c= new Contact(); //created new contact object
                 c.firstname = l.FirstName; //populate lead firstname to contact
                 c.LastName = l.LastName; //populate lead lastname to contact
                 c.Email = l.Email; //populate lead email to contact
                 c.Phone = l.Phone; //populate lead phone to contact
                 c.AccountId = AccountEmailMap.get(l.Email); //populate Accountid
                 contactsToCreate.add(c); //assigning contact records to contactstocreate
             }
         }
         if(contactsToCreate.size()>0)//checking contacts are greaterthan 0 or not
         {
             insert contactsToCreate;//insert the contact records
             for(Contact c:contactsToCreate) //iterating contacts
             {
                 contactEmailMap.put(c.Email,c.Id); //adding contact email&id to contactemailmap
             }
         }
     }
     if(leadIds.size()>0)//checking leadssize
     {
         createUsers(leadIds);//lead is available ,then execute this method. and creted user
     }
     List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();// once done with creating account,contact and user,here we have created new list
     //with the help of darabase.leadconvert we can do lead convert
     LeadStatus convertStatus = [SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true limit 1];
     //  isconverted is true then it will get the converted lead records
     for(Lead l:leadsTocconvert)//iterating converted Leads
     {
         Database.LeadConvert lc = new Database.LeadConvert();//
         lc.setLeadId(l.Id);
         lc.setAccountId(AccountEmailMap.get(l.Email));//whatever account we have created we need to set relevant Accountid we need to set it here
         lc.setContactId(contactEmailMap.get(l.Email));//whatever contact we have created we need to set relevant contactid we need to set it here
         lc.setDoNotCreateOpportunity(true);//not creting any opportunity
         lc.setConvertedStatus(convertStatus.MasterLabel);//setting leadconverted status to be converted
         leadConverts.add(lc);//converting leads
     } 
     if (!leadConverts.isEmpty()) //checking it is empty or not
     {
         List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts); //
     }
 }
@future //this method will execute when are doing DML operations on setup/nonsetup operations on single transactions(here user is is on setup category,account and contact are in non-setup category)
    public static void createUsers(set<id> leadIds)//furute method class with parameter as leadsid
    {
        List<Lead> lstLead = [select id,firstname,lastname,email,phone from Lead where Id in: leadids];//fetching lead records from lead
        List<User> lstuser = new List<user>();//define list user
        Profile objProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];//fetching records  from profile
        for(Lead l:lstLead)//iterating leads
        {
            User u = new user(firstname = l.FirstName,lastname = l.LastName,email = l.Email,Username = l.Email,//populating fname,lnme,email from leads info
                CommunityNickname = l.FirstName+l.LastName,//populating lname+fname as nickname
                Alias = l.FirstName.substring(0,3)+l.LastName.substring(0,3),//populating first 3 letters from fname,lname
                ProfileId = objProfile.id,//populating Profileid
                TimeZoneSidKey = 'GMT',//populating gmt to TimeZoneSidKey
                LanguageLocaleKey = 'en_US',// populating en_US to LanguageLocaleKey
                EmailEncodingKey = 'UTF-8',// populating UTF-8 to EmailEncodingKey
                LocaleSidKey = 'en_US');// populating en_US to LocaleSidKey
          lstuser.add(u); //adding user fields to letuser
        }
        If(lstuser.size()>0)//checking lstuser contains records or not
        {
            insert lstuser;//created user
        }
    }
}