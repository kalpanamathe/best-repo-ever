@isTest
public class AccountTest 
{
    static testmethod void billingaddress2()
    {
       Account a=new Account();
        a.Name='test123';
        a.AccountNumber='123445';
        a.BillingCity='atl';
        a.BillingCountry='Usa';
        a.Phone='13243453';
        insert a;
        billingaddress3 bb=new billingaddress3();
        bb.lstval=null;
         a.BillingCity='hyd';
        a.BillingCountry='Canada';
        a.Phone='67897';

        update a;
        PageBlockTable p=new PageBlockTable();
        p.Next();
        p.Previous();
        a.BillingCity=null;
        delete a;
    }
}