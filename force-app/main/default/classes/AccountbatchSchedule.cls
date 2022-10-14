global class AccountbatchSchedule  implements schedulable
{
    global void execute(SchedulableContext ctx)
    {
        AccountBatch b=new AccountBatch();
        Database.executeBatch(b,10);
    }
}