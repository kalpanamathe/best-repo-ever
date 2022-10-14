public class ContactPagenation 
{
    public  contact con{get;set;}
    public ContactPagenation()
    {
        con=new contact();
    }
    public pageReference Screen1Next()
    {
        pageReference p=new pageReference('/apex/ContactScreen2');
        return p;
    }
    
    
	public pageReference Screen2Previous()
    {
        pageReference p=new pageReference('/apex/ContactScreen1');
        return p;
    }
	public pageReference Screen2Next()
    {
        pageReference p=new pageReference('/apex/ContactScreen3');
        return p;
    }


    public pageReference Screen3Previous()
    {
        pageReference p=new pageReference('/apex/ContactScreen2');
        return p;
    }
	public pageReference Screen3Next()
    {
        pageReference p=new pageReference('/apex/ContactScreen4');
        return p;
    }
    
     public pageReference Screen4Modify()
    {
        pageReference p=new pageReference('/apex/ContactScreen1');
        return p;
    }
	public pageReference Screen4Submit()
    {
        insert con;
        pageReference p=new pageReference('/apex/ContactScreen5');
        return p;
    }

    
}