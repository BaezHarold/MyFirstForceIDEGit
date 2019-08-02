public class DMLExamples {
    
    public static void classExample() {
        // Class
        Class__c c = new Class__c();
        c.Name = 'HIS400';
        c.ClassSubject__c = 'History';
        c.ClassTopic__c = 'American History';
        c.StartDate__c = Date.newInstance(2019, 7, 30);
        c.EndDate__c = Date.newInstance(2019, 8, 2);
        insert c;
        
        // Student
        Student__c s = new Student__c();
        s.Name = 'Laura';
        s.Age__c = 22;
        s.Email__c = 'Laura@gmail.com';
        s.Status__c = 'Graduated';
        insert s;

		// Class Enrollment
		ClassEnrollment__c ce = new ClassEnrollment__c(Class__c=c.Id, Student__c=s.Id);
        insert new ClassEnrollment__c(Class__c=c.Id, Student__c=s.Id);
    }
    
    // We DO NOT want to perform DML operations  on individual records.
    public static void dontDoThis() {
        Account a = new Account(Name='test1');
        insert a;
        Account a2 = new Account(Name='test2');
        insert a2;
        Account a3 = new Account(Name='test3');
        insert a3;
    }
    
    // Instead, perform DML on a list of records
    public static void doThis() {
        List<Account> accList = new List<Account>();
        
        for(Integer i = 0; i < 3; i++) {
            accList.add(new Account(Name='t'+i));
        }
        insert accList;
    }
    
    /* Using the upsert operation, you can either update or insert an existing record
     * in one call. To determine wherter a record already exists, the upsert statement
     * uses the record's ID as the key to match the records.
     * 
     * - If the key is not matched, then a new record is created.
     * - If the key is matched once, then the existinf record is updated.
     * - Id using the external ID, if the key is matched multiple times. then an error
     *   is generated and the record is neither updated or inserted
    */
    public static void upsertExample() {
        List<Account> accList = [Select BillingCity From Account Where BillingCity='New York'];
        
        for(Account a: accList) {
            a.BillingCity = 'Mumbai';
        }
        
        accList.add(new Account(Name='Acme', BillingCity='San Francisco'));
        
        // 	Invalid record (if this is in which does not work the entire thing would not be inserted or work)
        // accList.add(new Account(BillingCity='San Francisco'));
        
        upsert accList;
    }
    
    /* Deleted records are not deleted permanently from the SF, bu are inserted
     * into the Recylce Bin for 15 dates where they can be restored
    */
    public static void deleteExample() {
       // insert new Account(Name='BobBill\'s Antique Shop');
       Account a1 = new Account(Name='BobBill\'s Antique Shop');
       insert a1;
       // Account a = [SELECT Name FROM Account Where Name='BobBill\'s Antique Shop'];
        
        System.debug('a: ' + a1);
        delete a1;
        
        List<Account> acs = [SELECT Name FROM Account Where Name='BobBill\'s Antique Shop' LIMIT 1];
        System.debug('acs: ' + acs);
    }
    
    /* SOQL statements can use the ALL ROWS keywords/clause to query all records in an org,
     * included deleted records.
    */
    public static void undeleteExample() {
        System.debug('Find Kelly from existing records ' + [SELECT Name FROM Student__c WHERE Name = 'Jimmy']);
        
        List<Student__c> students = [SELECT Name FROM Student__c WHERE Name = 'Jimmy' ALL ROWS];
        System.debug('Students - including deleted' + students);
        undelete students;
    }

}