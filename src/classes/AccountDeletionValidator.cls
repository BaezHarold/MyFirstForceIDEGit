public class AccountDeletionValidator {
    
    public static void preventAccountDeletionIfHaveChildren(List<Account> accounts) {
        
        //if(contactList.size() > 0) {
        //  accountCheck.addError('This Account cannot be deleted');
        //}
        
        List<Id> newAccounts = new List<Id>();
        for(Account a: accounts) {
            newAccounts.add(a.Id);
        }
        
        // List of Accounts with Contacts (parent to child is subquery)
        List<Account> accountsAlongsideContacts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Account.Id = :newAccounts];
        
        // Making a set that will have accounts that cannot be deleted
        Set<Id> accountsShouldNotDelete = new Set<id>();
        
        
        for(Account c : accountsAlongsideContacts) {
            if(c.Contacts.size() > 0) {
                accountsShouldNotDelete.add(c.Id);
            }
        }
        
        for(Account a : accounts) {
            for(Id accountToPreventDeletion : accountsShouldNotDelete) {
                if(a.Id == accountToPreventDeletion) {
                    a.addError('Cannot Delete because Account has children');
                }
            }
        }
    }
}