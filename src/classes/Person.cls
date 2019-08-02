// The virtual keyword indicates that this class can be extended. (can have children)
public virtual class Person {
    // Fields
    private String name;
    private String email;
    private Integer age;
    
    //Constructors
    // Default/no-arg constructor
    public Person() {
        name = '';
        email = '';
        age = 0;
    }
    
    public Person(String name) {
        this.name = name;
        email = '';
        age = 0;
    }
    
    public Person(String name, String email) {
        this.name = name;
        this.email = email;
        age = 0;
    }
    
    
    public Person(String name, String email, Integer age) {
        this.name = name;
        this.email = email;
        this.age = age;
    }
    
    // Accessors (Getters)
    public String getName() {
        return name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public Integer getAge() {
        if(age == null) {
            // set default value
            age = 0;
        }
        return age;
    }
    
    // Mutators (Setter)
    public void setName(String aName) {
        name = aName;
    }    
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setAge(Integer age) {
        // Check credentials
        if(age > 0) {
        	this.age = age;
        }
    }
    
    // Marking a method as virtual means that it CAN be overridden,
    // but is not required to be overriden.
    public virtual void display() {
        System.debug('Name: ' + name);
        System.debug('Email: ' + email);
        System.debug('Age: ' + age);
    }
    
    
}

/*
Person p = new Person();
p.setName('Harold');
System.debug('p:' + p.getName());
p.setAge(-5);
System.debug('p:' + p.getAge());
p.setAge(5);
System.debug('p:' + p.getAge());

Person p2 = new Person('Harold');
System.debug('p2:' + p2.getName());

Person p3 = new Person('Harold', 'wumbo@gmail.com');
System.debug('p3: ' + p3);
             
Person p4 = new Person('Harold', 'wumbo@gmail.com', 22);
System.debug('p4: ' + p4);
*/