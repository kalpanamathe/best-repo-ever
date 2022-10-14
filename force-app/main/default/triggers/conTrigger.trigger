trigger conTrigger on Contact (before Insert,before delete,after insert,after update,after delete,after undelete) {
   //Contacts count and country='india' count
    if(trigger.isAfter)
    {
         if(trigger.isInsert)
            {
                ContactTriggerHelper.ContactCount(trigger.new,null,null);
				ContactTriggerHelper.Primaryuncheck(trigger.new,null);
            }
        if(trigger.isUpdate)
        {
             ContactTriggerHelper.ContactCount(trigger.new,trigger.oldmap,trigger.old);
         ContactTriggerHelper.Primaryuncheck(trigger.new,trigger.oldmap);
        }
        if(trigger.IsDelete)
        {
             ContactTriggerHelper.ContactCount(null,trigger.oldmap,trigger.old);
        }
        if(trigger.IsUndelete)
        {
             ContactTriggerHelper.ContactCount(trigger.new,null,null);
        }
     	
    }
    //Primary Contact Delete
    if(trigger.isbefore)
    {
        if(trigger.IsDelete)
        {
             ContactTriggerHelper.PrimaryContactCheck(trigger.old);
        }
        if(trigger.IsInsert)//Activate at the time of insert
        {
            ContactTriggerHelper.duplicateCheck(trigger.new);//calling thid method from helperclass,by passing trigger.new parameter
        }
    }
}