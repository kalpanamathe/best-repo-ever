trigger AccTrigger on Account (before delete,before insert,before update,after insert,after update) {
  //Billing Country
     if(trigger.isbefore)
    {
        if(trigger.IsInsert)
        {
            AccountTriggerHelper.BillingCountryUpdate(trigger.new,null);
        }
        if(trigger.IsUpdate)
        {
            AccountTriggerHelper.BillingCountryUpdate(trigger.new,trigger.oldmap);
            //Shipping Address Update
            AccountTriggerHelper.ShippingAddressUpdate(trigger.new,trigger.oldmap);
        }
        if(trigger.IsDelete)
        {
           AccountTriggerHelper.AccountDeletion(trigger.oldmap);
        }
}
    
    if(trigger.isafter)
	{
        //ContactCreateList
    	if(trigger.isInsert)
        {
            AccountTriggerHelper.ContactCreateList(trigger.new);
        }
        
		//Account Billing address change--- then Mailing address change in contacts
        If(trigger.isUpdate)
        {
            AccountTriggerHelper.ContactMailingAddressUpdate(trigger.oldmap,trigger.newmap);
        }
   
   }
    

}