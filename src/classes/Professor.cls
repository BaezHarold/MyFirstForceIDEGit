public class Professor extends Person {
    // Properties MUST BE PUBLIC
    public Decimal salary {
        get {
            if(salary == null) {
                salary = 0.0;
            }
            
            return 0.0;
        }
        set {
            // value is a keyword that represents the value a property is being set to.
            if(value < 0.0) {
                System.debug('You CANNOT have a negative salary. That\'s called debt.');
            } else {
                salary = value;
            }
        }
    }
    
    // This default constructor will auromatically call the parent default constructor (ONLY TRUE FOR DEFAULT CONSTRUCTOR)
    public Professor() {
        // parentt default is called here (That is done first)
        salary = 0.0;
    }
    
    public Professor(String name, String email) {
        super(name, email);
    }
    
    public override void display() {
        super.display();
        System.debug('Salary: ' + salary);
    }
    
}