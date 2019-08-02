public class Critic extends Person {
    
    // Property
    public Integer yearsOfExperience {
        // get;
        get {
            if (yearsOfExperience == null) {
                yearsOfExperience = 0;
            }
            return yearsOfExperience;
        }
        set {
            if(value < 0) {
                System.debug('Cannot enter a negative number');
            } else {
                yearsOfExperience = value;
            }
        }
    }
    
    public Critic() {
        this.yearsOfExperience = 0;
    }
    
    public Critic(String name, String email) {
        super(name, email);
        yearsOfExperience = 0;
    }
    
    public override void display() {
        System.debug('Critic Information');
        super.display();
        System.debug('Years of Experience: ' + yearsOfExperience);
    }
    
}