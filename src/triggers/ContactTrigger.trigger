trigger ContactTrigger on Contact (before insert, after insert) {
    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ContactHandler.contactNeedsAccount(Trigger.new);
            ContactHandler.contactShippingState(Trigger.new);
        }
    } 
}