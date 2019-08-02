public class SelectQueries {
    
    // Made into static since dont need to store any info when calling it and there will be no difference from being called
    public static List<Account> getAllAccounts() {
        List<Account> accountList = new List<Account>();
        // SOQL best practice #1 - Only return the necessary fields. (no * in SOQL)
        accountList = [SELECT Id FROM Account];
        
        return accountList;
    }
    
    // Get all contact
    public static List<Contact> getAllContacts() {
        // This is the same as when we did for Accounts
        return [SELECT Id FROM Contact];
    }
    
    // Using the WHERE clause in a SELECT statement 
    // Get all accounts with the name GenePoint
    public static List<Account> getGenePoint() {
        return [SELECT Id, Name FROM Account WHERE Name = 'GenePoint'];
    }
    
    // Get all Accounts with speicified name
    public static List<Account> getAccountsWithName(String name) {
        // Using a variable in a query, which requires a colon(:) is often referref to as unwrapping a variable for use.
        return [SELECT Id, Name FROM Account WHERE Name = :name];
    }
    
    // returns back all Students that are enrolled
    public static List<Student__c> getEnrolledStudent() {
        return [SELECT Name FROM Student__c WHERE Status__c = 'Enrolled'];
    }
    
    // Get Student names with specified status
    public static List<Student__c> getStudentWithSpecificStatus(StudentStatus status) {
        return [SELECT Name FROM Student__c WHERE Status__c = :status.name()];
    }
    
    public static List<Account> getFirstFiveAxxountsWithMoreThan100Employees() {
        return [SELECT Name, NumberOfEmployees // THis is what you want to grab
                FROM Account // This is the location you want to grab from
                WHERE NumberOfEmployees > 100 // This is where you can set filters || critieras that you want to check for
                ORDER BY Name DESC // This is how you want records to appear  DESC decending || ASC is for acending
                LIMIT 5]; // This is to limit the amount of records you want to be displayed
    }
    
    // Relationship query going from child to parent
    // Get all ClassEnrollments that are for math classes
    public static List<ClassEnrollment__c> getMathCEs() {
        return [SELECT Name FROM ClassEnrollment__c WHERE Class__r.ClassSubject__c = 'Math']; 
        // Only when custom class and traversing a relationship it will not be __c but __r
    }
    
    // Relationship query going parent to child
    public static List<Account> getAccountsAndTheirContacts() {
        return [SELECT Name,(SELECT Name FROM Contacts) FROM Account];
    }
    
    // Find all class enrollments for a given student
    public static List<ClassEnrollment__c> getEnrollmentForGivenStudent(String name) {
        return [SELECT Name FROM ClassEnrollment__c WHERE Student__r.Name = :name ];
    }
    
    // Find All Assessments for a Given Student // Review this 
    public static List<Assessments__c> getAssessmentForStudent(String name) {
         // Find all grades(and their assessment) for a given student
       List<Grade__c> gradesForStudent = [SELECT Assessment__c From Grade__c WHERE Student__r.Name = :name];
        
        // Store all Assessment Ids for goiven list of Grades
        List<Id> assessmentIds = new List<Id>();
        for(Grade__c g : gradesForStudent) {
            assessmentIds.add(g.Assessment__c);
        }
        // Use the Assessment Ids to query for the Assessment records
        return [Select Id, Name FROM Assessments__c WHERE Id IN :assessmentIds];
    }
    
    // Get all Accounts showing their Id, Name, Billing City, and Billing Street
    public static List<Account> getAllAccountInformation() {
        return [SELECT Id, Name, BillingCity, BillingStreet FROM Account ORDER BY BillingCity];  
    }
    // Ascending order
    public static List<Account> getAllAccountInformationAsc() {
        return [SELECT Id, Name, BillingCity, BillingStreet FROM Account ORDER BY BillingCity ASC]; 
    }
    // Descending order
    public static List<Account> getAllAccountInformationDesc() {
        return [SELECT Id, Name, BillingCity, BillingStreet FROM Account ORDER BY BillingCity DESC]; 
    }
    
    // Get all Accounts showing their Id, Name, Billing City, and Billing Street with shipping that is provided
    public static List<Account> getAllAccountInfoWithGivenCity(String city) {
        return [SELECT Id, Name, BillingCity, BillingStreet FROM Account WHERE BillingCity = :city ORDER BY BillingCity];
    }
    
    // Get all Accounts where billing city is equal to Shiiping city
    public static List<Account> getAllAccountInfoWhenShipCityEqualsBillCity() {
        List<Account> accList = [SELECT Id, Name, BillingCity, ShippingCity FROM Account WHERE BillingCity != null AND ShippingCity != null];
        
        // loop through accList
        for(Account a : accList) {
        	// compare billingcity and shipping city
            if(Account.BillingCity == Account.ShippingCity) {
        		// store only if the same
        		accList.add(a);
            }
        }
        return accList;
    }
    
    // Find the amount of Accounts located in each state.
    //public static List<Account> getAmountOfContactLocatedInDifferentCities() {
      //  return [SELECT Count(Name), BillingCity FROM Account GROUP BY BillingCity];
    //}
    
    // Find the created date for all Contact only show 6 contacts and start at 13 contact
    // Also added to ORDER BY Name  
    public static List<Contact> getContactCreatedDate() {
        return [SELECT Name, FORMAT(CreatedDate) FROM Contact ORDER BY NAME LIMIT 6 OFFSET 12];
    }
    
    
    
    
}