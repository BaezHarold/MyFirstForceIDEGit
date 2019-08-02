trigger ClassNameTrigger on Class__c (before insert, before update) {
    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ClassNameValidator.checkThatCorrectNameInputIsValid(Trigger.new);
        } else if(Trigger.isupdate) {
            ClassNameValidator.checkThatCorrectNameInputIsValid(Trigger.new);
        }
    } 

}