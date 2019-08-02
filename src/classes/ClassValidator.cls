public class ClassValidator {
    
    public static void checkForDuplicateClasses(List<Class__c> classes) {
        // Single use case Below
        /* List<Class__c> existitingClasses = [SELECT Id FROM Class__c WHERE Name = :classOfInterest.Name];
        
        if(existitingClasses.size() > 0) {
            classOfInterest.addError('There is already a class with that Name');
        }
        */
        
        // Use to help find existing classes // being filled with the new class names
        List<String> newClassNames = new List<String>();
        for(Class__c c : classes) {
            newClassNames.add(c.Name);
        }
        
        // Use list of existing names to get their records 
        for(Class__c existingClass : [SELECT Name FROM Class__c WHERE Name IN :newClassNames]) {
            for(Class__c newClass : classes) {
                if(existingClass.Name == newClass.Name) {
                    newClass.addError('There is already a class with that Name');
                }
            }
        }
        
    }

}