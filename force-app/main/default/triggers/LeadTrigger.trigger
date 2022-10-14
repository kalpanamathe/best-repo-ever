trigger LeadTrigger on Lead (before insert,after insert,after update) 
{
    if(trigger.Isbefore)//Activate at the time of before 
    {
        if(trigger.IsInsert)//Activate at the time of Insert 
        {
        	LeadaTriggerHelper.duplicatecheck(trigger.new);//calling thid method from helperclass,by passing trigger.new parameter
        }
    }
   if(trigger.isAfter)//Activate at the time of After 
    {
        if(trigger.isInsert)//Activate at the time of Insert
        {
             LeadaTriggerHelper.leadConvert(trigger.new,null);
        }
        if(trigger.isUpdate)//Activate at the time of Update
        {
            LeadaTriggerHelper.leadConvert(trigger.new,trigger.oldMap);
        }
    }
}