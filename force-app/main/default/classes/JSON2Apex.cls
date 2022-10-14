public class JSON2Apex 
{
public string message;
    public string status;
    public List<PostOffice> PostOffice;
    public class PostOffice
    {
         public string Name;
         public string Division;
         public string District;
         public string  Region;
         public string State;
         public string Country;
    }
    public  JSON2Apex parse(String  json)
    {
        return (JSON2Apex) system.JSON.deserialize(json,JSON2Apex.class);
    }
}