public class Performance extends Play {
    
    public String theater {
        // can also just be 
        // get;
        // set;
        get {
            System.debug('theater test: ' + theater);
            if(theater == null) {
                theater = '';
            }
            return theater;
        }
        set {
            this.theater = value;
        }
    }
    
    public Critic performanceCritic {
        get;
        set;
    }
    
    public Performance() {
        this.theater = '';
        this.performanceCritic = new Critic();
    }
    
    public Performance(String theater, Critic performanceCritic) {
        this.theater = theater;
        this.performanceCritic = performanceCritic;
    }
    
    public override void display() {
        super.display();
        System.debug('Theater: ' + theater);
        performanceCritic.display();
    }    
}