// To Mark a class as a test class, provide the @isTest annotation
@isTest(SeeAllData=true)
public class TestClass {
    
    /*
    @testSetup
    static void setup() {
        // Created Test data
        TestDataFactory.createTestAccounts(50);
    }
    */
    
    @isTest
    static void testAddTwoNumbers() {
        Integer expected = 11;
        Integer actual = MethodsToTest.addTwoNumbers(5,6);
        System.assertEquals(expected, actual, 'Math is no bueno'); 
    }
    
    @isTest(SeeAllData=true)
    static void testupdateAccountSizeFromNumberOfEmployees() {
        
        // Call method to test
        AccountMethods.updateAccountSizeFromNumberOfEmployees();
        
        /*
		// Single Case Testing    
		// Retrieve test data
		Account a1 = [SELECT Size__c FROM Account WHERE Name='test1' Limit 1];
		System.assertEquals('Small', a1.Size__c, 'This account should have a size of small');

		Account a2 = [SELECT Size__c FROM Account WHERE Name='test2' Limit 1];
		System.assertEquals('Medium', a2.Size__c, 'This account should have a size of Medium');

		Account a3 = [SELECT Size__c FROM Account WHERE Name='test3' Limit 1];
		System.assertEquals('Large', a3.Size__c, 'This account should have a size of Large');
		*/
        
        // Test Bulk Action
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account];
        System.debug('accs:' + accs);
        for(Account a : accs) {
            if(a.NumberOfEmployees <= 1000) {
                System.assertEquals('Small', a.Size__c, 'This account should have a size Small');
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000) {
                System.assertEquals('Medium', a.Size__c, 'This account should have a size Medium');
            } else {
                System.assertEquals('Large', a.Size__c, 'This account should have a size Large');
            }
        }  
    }
    
    @isTest
    static void testupdateAccountSizeFromNumberOfLocations() {
        
        AccountMethods.updateAccountSizeFromNumberOfLocations();
        
        List<Account> acco = [SELECT NumberOfLocations__c, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for(Account b : acco) {
            if(b.NumberofLocations__c <= 3) {
                System.assertEquals('Small', b.Size__c, 'This account should have a size Small');
            } else if(b.NumberofLocations__c > 3 && b.NumberofLocations__c <= 6) {
                System.assertEquals('Medium', b.Size__c, 'This account should have a size Medium');
            } else {
                System.assertEquals('Large', b.Size__c, 'This account should have a size Large');
            }
        } 
    }
    
    @isTest
    static void startAndStop() {
        for(Integer i = 0; i < 100; i++) {
            List<Lead> l = [SELECT Id FROM Lead LIMIT 1];
        }
        
        // The Limits Class provides us with the information about how much of our governor
        // limits we've used and how much we can use.
        System.debug('Nunber of queries used: ' + Limits.getQueries());
        System.debug('Nunber of queries allowed: ' + Limits.getLimitQueries());
        
        Test.startTest();
        System.debug('Number of queries used inside startTest & stopTest: ' + Limits.getQueries());
        Test.stopTest();
        
        //Notice the this number did not reset outside of the start and stopTest methods.
        System.debug('Number of quries used: ' + Limits.getQueries());
    }
    
    @isTest
    static void testRunAs() {
        User u = [SELECT Id FROM User WHERE Id = '0053i000000prPKAAY'];
        
        List<Class__c> classes = [SELECT Id FROM Class__c];
        System.debug('Number of classes seen in System Context: ' + classes.size());
        
        System.runAs(u) {
            classes = [SELECT Id FROM Class__c];
            System.debug('Number of classes seen in Billy Bob: ' + classes.size());
            
        }
    }
}