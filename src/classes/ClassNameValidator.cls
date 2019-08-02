public class ClassNameValidator {
    
    public static void checkThatCorrectNameInputIsValid(List<Class__c> classes) {
        
        List<String> classSubjects = new List<String>{'HIS','ENG','BIO','CHE', 'PSY'};
            
        // Getting list of New Names
        List<String> newClassTopicNames = new List<String>();
        for(Class__c c : classes) {
            newClassTopicNames.add(c.ClassTopic__c);
        }
        
        // CHecking new names with what in the database
        for(Class__c exisitingName : [SELECT ClassTopic__c FROM Class__c WHERE ClassTopic__C IN :newClassTopicNames]) {
            for(Class__c newClass : classes) {
                String classShortHand = newClass.ClassTopic__c.substring(0,3);
                classShortHand.toUpperCase();
                if(exisitingName.ClassTopic__c == newClass.ClassTopic__c) {
                    newClass.addError('This is not in the System.');
                }
            }
        }   
    }
}