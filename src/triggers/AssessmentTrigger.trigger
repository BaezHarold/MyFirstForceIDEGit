trigger AssessmentTrigger on Assessments__c (before insert, after insert) {
    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            
        }
    } else {
        if (Trigger.isInsert) {
            
        }
    }

}