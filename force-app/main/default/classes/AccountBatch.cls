global class AccountBatch implements Database.Batchable<sObject>
{
    global Database.querylocator start(Database.BatchableContext bc)
    {
        string query='select Id,Name,Type from Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        List<Account> accns=new List<Account>();
        for(Account a:scope)
        {
            a.name=a.name.replace('batch','');
            accns.add(a);
        }
        update accns;
    }
    global void finish(database.BatchableContext BC)
    {
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        String email='kalpana.mathe@gmail.com';
        mail.setToAddresses(new String[] {email});
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Batch process Completed');
        mail.setPlainTextBody('Batch process Completed');
                        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail}); 
    }
}