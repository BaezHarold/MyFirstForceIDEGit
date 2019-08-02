public virtual class Play {
    
    private String title;
    private String author;
    private PlayType genre;
    
    public Play() {
        this.title = '';
        this.author = '';
        this.genre = PlayType.NOT_SELECTED;
    }
    
    public Play(String title) {
        this.title = title;
        this.author = '';
        this.genre = PlayType.NOT_SELECTED;
    }
    
    public String getTitle() {
        return title;
    }
    
    public String getAuthor() {
        return author;
    }
    
    public PlayType getGenre() {
        return genre;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    public void setGenre(PlayType genre) {
        this.genre = genre;
    }
    
    public virtual void display() {
        System.debug('Play Information');
        System.debug('Title: ' + title);
        System.debug('Author: ' + author);
        System.debug('Genre: ' + genre);
    }
    
    

}