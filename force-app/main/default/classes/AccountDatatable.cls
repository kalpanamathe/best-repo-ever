public class AccountDatatable {
  @AuraEnabled
public static List<Account> getAccountRecords()
    {
        List<Account> lstacc=[select Name,Type,Industry from Account limit 20];
        return lstacc;
    }
    
      @AuraEnabled
public static   List<Account> deleteAcc(string accId)
    {
        delete [select id from Account where Id=:accId ];
        return getAccountRecords();
         
    }
    
}