@isTest
public class TestProjectZero {
    
    @testSetup
    static void setup() {
        // Create Test Data 
    } 
    
    @isTest
    static void testfibonacci() {
        // Single Action -> +
        System.assertEquals(1, ProjectZero.fibonacci(1));
        System.assertEquals(1, ProjectZero.fibonacci(2));
        System.assertEquals(2, ProjectZero.fibonacci(3));
        System.assertEquals(89, ProjectZero.fibonacci(11));
        System.assertEquals(6765, ProjectZero.fibonacci(20));
        System.assertEquals(196418, ProjectZero.fibonacci(27));
        
        // Single Action -> -
        System.assertEquals(-1, ProjectZero.fibonacci(-5));        
    }
    
    @isTest
    static void testSortArray() {
        List<Integer> nums = New List<Integer>{10,4,1,14,7};
        List<Integer> expectedSort = New List<Integer>{1,4,7,10,14};
        //List<Integer> actual= ProjectZero;
        
    }
    
    @isTest
    static void testFactorial() {
        
    }
    
    @isTest
    static void testRotateLeft() {
        
    }
    
    @isTest
    static void testupdateAccountSize() {
        
    }
    
    @isTest
    static void testUpdateCALeads() {
        
    }
    
    @isTest
    static void testUpdateOpportunitiesPastClosedDate() {
        
    }
    

    
}