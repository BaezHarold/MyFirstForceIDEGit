public class DatabaseClassExamples {
    
    public static void exampleOne() {
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name='DBClass1'));
        accList.add(new Account());
        
        // Databse methods have a second (optional) parameter, called allOrNone(Boolean).
        // By default, this parmeter is true meaning that it does not allow for partial processing.
        // Set it to false to enable partail processing
        List<Database.SaveResult> srList = Database.insert(accList, false);
        
        for(Database.SaveResult sr : srList) {
            if(sr.isSuccess()) {
                System.debug('Successfully inserted account with Id: ' + sr.getId());
            } else {
                // Operation failed
                for(Database.error err : sr.getErrors()) {
                    System.debug('The Following error has occurred');
                    System.debug(err.getStatusCode() + ' : ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }

}