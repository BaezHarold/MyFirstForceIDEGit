public class ExerciseTwo {
    
    public Static List<User> getUserLastLoginDate() {
        List<User> userLasLogDate = [SELECT Name, LastLoginDate FROM User];
        
        return userLasLogDate;
    }

}