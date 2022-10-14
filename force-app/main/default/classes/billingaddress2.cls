public class billingaddress2 
{
    public list<Account> lstacc{get;set;}
    public list<String> lstval{get;set;}
    public billingaddress2()
    {
        lstacc=[select id,name,BillingCountry from Account where BillingCountry='Usa'];
    }
}