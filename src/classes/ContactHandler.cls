public class ContactHandler {
    
    // Example 2
    public static void contactNeedsAccount(List<Contact> contacts) {
        for(Contact newContact : contacts) {
            if(newContact.AccountId == null) {
                newContact.addError('Contact needs an Account');
            }
        }
    }
    
    // Example 3
    public static void contactShippingState(List<Contact> contacts) {
        
        List<Contact> newContacts = new List<Contact>();
        for(Contact a : contacts) {
            a.MailingStreet = a.Account.ShippingState;
        }
    }
}