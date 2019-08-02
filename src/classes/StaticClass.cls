public class StaticClass {
	// Static variables
	private static Integer numberOfObjectsCreated = 0;
    // Instance variables
    private Integer secondNumber = 0;
    
    public StaticClass() {
        numberOfObjectsCreated++;
        secondNumber++;
    }
    
    public void incrementSecondNumber() {
        secondNumber++;
    }
    
    public void incrementNumberOfObjectsCreated() {
        numberOfObjectsCreated++;
    }
    
    public Integer getNumberOfObjectsCreated() {
        return numberOfObjectsCreated;
    }
    
    public Integer getSecondNumber() {
        return secondNumber;
    }

}

/*
StaticClass sc1 = new StaticClass();
StaticClass sc2 = new StaticClass();
StaticClass sc3 = new StaticClass();

System.debug('sc3 numberOfObjectsCreated: ' + sc3.getNumberOfObjectsCreated());
System.debug('sc3 secondNumber: ' + sc3.getSecondNumber());
*/