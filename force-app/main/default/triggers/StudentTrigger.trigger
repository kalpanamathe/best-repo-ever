Trigger StudentTrigger on Student__c (before update) {

    for (Student__c ns: Trigger.New) {
        Student__c os = Trigger.oldMap.get(ns.ID);
        if(os.Age__c!=null && ns.Age__c!=null){
        Integer oldValue = Integer.valueOf(os.Age__c);
        Integer newValue = Integer.valueOf(ns.Age__c);
        if(newValue!=oldValue+1) {
           ns.addError('Select Valid Age');
        }
      }
    }
}