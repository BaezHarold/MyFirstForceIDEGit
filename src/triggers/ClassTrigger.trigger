trigger ClassTrigger on Class__c (before insert, before update) {
    
    // Trigger Context Variables
    // Trigger.isExecuting - Returns true if the current contect for the Apex code
    // 		is a Trgger, not Visualforce page, a Web Service, or an executeanonymous() API call.
    // 
    // Trigger.isInsert - Returns true if this trigger was fired due to an insert operation
    // Trigger.isUpdate - Returns true if this trigger was fired due to an update operation
    // Trigger.isDelete - Returns true if this trigger was fired due to an delete operation
    // Trigger.isUndelete - ...
    // 
    // Trigger.isBefore - Returns true if this trigger was fired before any records were saved
    // Trigger.isAfter - Returns true if this trigger was fired after all records were saved
    // 
    // Trigger.new - Returns a list of the new versions of the sObject records
    // Trigger.old - Returns a list of the old versions of the sObject records
    // 
    // Trigger.newMap - A map of IDs to the new versions of the sObject records
    // Trigger.oldMap - A map of IDs to the old versions of the sObject records
    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ClassValidator.checkForDuplicateClasses(Trigger.new);
        } else if(Trigger.isUpdate) {
            ClassValidator.checkForDuplicateClasses(Trigger.new);
        }
    }
    
    
}