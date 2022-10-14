public class AccountTable23 
{
    @AuraEnabled(cacheable=true)
public static List<Account> getAccountRecords()
    {
        List<Account> lstacc=[select Name,Type,Industry from Account limit 20];
        return lstacc;
    }
}