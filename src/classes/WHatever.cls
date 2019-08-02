public class WHatever {
    
    public static void largeNumber(List<Integer> mumbo) {
        
       Integer big = mumbo[0];
       
        for(Integer i = 0; i < mumbo.size(); i++) {
            if(mumbo[i] > big) {
                big = mumbo[i];
            }
        }
         System.debug('Large number is: ' + big);
    }   
}