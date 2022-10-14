public class ContactCustomVfPage
{
    
public contact con{get;set;}
    public ContactCustomVfPage()
    {
        con=new contact();
    }
    
    public void CreateRecord()
    {
         VfPageViewHistory__c vfh=new VfPageViewHistory__c();

        vfh.UserName__c=userinfo.getName();
vfh.Date_Time__c=datetime.now();
        insert vfh;
        
    }
public pageReference save()
{
    insert con;
   pageReference  p=new pageReference('/'+con.id);
    return p;
}
    public pageReference Cancel()
    {
          pageReference  p=new pageReference('/003/o');
    return p;
 
    }
   public pageReference saveAndNew()
{
    insert con;
    pageReference  p=new pageReference('/apex/ContactCustomVfPage');
    p.setRedirect(true);
    return p;
}
}