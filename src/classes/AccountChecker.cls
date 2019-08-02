public class AccountChecker {
    
    // Example 1
    public static void accountNeedsBillingCity(List<Account> accs) {
        for(Account newAccount : accs) {
            if(newAccount.BillingCity == null) {
                newAccount.addError('Account must have a Billing City');
            }
        }
    }

}