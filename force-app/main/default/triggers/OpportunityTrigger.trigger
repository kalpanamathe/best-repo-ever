trigger OpportunityTrigger on Opportunity (after insert,after update,after delete,after undelete)//Opportunity Trigger Events
{
    if(trigger.IsAfter)//If condition will work only after Events
    {
        if(Trigger.IsInsert)//activate at the time of insert
        {
            OpportunityTriggerHelper.bookingCalculation(trigger.new,null);//calling thid method from helperclass, we are passing trigger.new at the time of Insert,Here trigger.oldmap is not available
        }
        if(Trigger.Isupdate)//activate at the time of Update
        {
            OpportunityTriggerHelper.bookingCalculation(trigger.new,trigger.oldmap);//we are passing trigger.new&oldmap at the time of Update
        }
        if(Trigger.Isdelete)//activate at the time of Delete
        {
            OpportunityTriggerHelper.bookingCalculation(null,trigger.oldmap);//we are passing trigger.oldmap at the time of Delete,Here trigger.new is not available
        }
        if(Trigger.Isundelete)//activate at the time of Undelete
        {
            OpportunityTriggerHelper.bookingCalculation(trigger.new,null);// we are passing trigger.new at the time of Undelete,Here trigger.oldmap is not available
        }
	}
}