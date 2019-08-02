public class Square extends Rectangle {
    
    // Constructor
    public Square(Double sideLength) {
        setSideLength(sideLength);
    }
    
    // Helper Method --> given a length, update square height and width
    private void setSideLength(Double sideLength) {
        this.height = sideLength;
        this.width = sideLength;
    }

}