public virtual class Rectangle extends Shape {
    
    // Getter && Setter
    public Double height {
        get;
        set;
    }
    
    public Double width {
        get;
        set;
    }
    
    // Constructor
    public Rectangle() {
        setNumberOfSides(4);
        height = 0.0;
        width = 0.0;
    }
    
    public Rectangle(Double height, Double width) {
        setNumberOfSides(4);
        this.height = height;
        this.width = width;
    }
    
    public void draw() {
        System.debug('Drawing a Rectangle with width: ' + width + ' and height: ' + height);
    }
    
    public Double calculateArea() {
        return width * height;
    }
    
    public Double calculatePerimeter() {
        return 2 * width * height;
    }
    
    

}