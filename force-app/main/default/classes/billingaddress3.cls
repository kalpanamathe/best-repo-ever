public class billingaddress3
{
    public list<Account> lstacc{get;set;}
    public list<String> lstval{get;set;}
    public billingaddress3()
    {
        lstacc=[select id,name,BillingCountry from Account where BillingCountry='Usa'];
    }
}