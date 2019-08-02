public class ExceptionMethods {
    
    // Hello Org
    
    private class MyCustomException extends Exception{}
    
    public static void accountErrors(String name) {
        try {
            List<Account> acc = [SELECT Id FROM Account WHERE Name =: name LIMIT 1];
            String accCity = acc[0].ShippingCity;
        } catch (ListException la) {
            printErrors(la);  
        } catch (SObjectException soe) { 
            printErrors(soe);
        } catch (Exception e) { // Notice that the most genereal exception, Exception, is at the bottom
            printErrors(e);
        } finally {
            // Clean up your code
            // Close any connections still open
        }
        
        System.debug('Still Going');
    }
    
    private static void printErrors(Exception e) {
        	System.debug('Exception Type Caught: ' + e.getTypeName());
            System.debug('Message: ' + e.getMessage());
            System.debug('Cause: ' + e.getCause());
            System.debug('Line Number: ' + e.getLineNumber());
            System.debug('Stack Trace: ' + e.getStackTraceString());
    }
    
    public static void testCustomException(String message) {
        try {
            // Throw a custom exception, not passing a message
            // Throw new MyCustomException();
            
            // THrow a custom exception, providing a message
            throw new MyCustomException(message);
        } catch (MyCustomException mb) {
            printErrors(mb);
        }
    }
    
    public static void parentMethod() {
        try {
            childMethod();
        } catch (MyCustomException b) {
            printErrors(b);
        }
    }
    
    public static Exception childMethod() {
        throw new MyCustomException();
    }
    
}