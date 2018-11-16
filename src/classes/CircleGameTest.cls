@IsTest
public class CircleGameTest { 

    @IsTest
    static void testNormal() {
    	// If number of players == 6 and every 4th player is removed  
    	// then the exit sequence is 4, 2, 1, 3, 6 leaving 5 the winner
    	
    	String exitSequence = CircleGame.newGame(6,4);
    	System.assertEquals('4,2,1,3,6,5', exitSequence);
    }

    @IsTest
    static void testException() {
    	// If n == 0 or k == 0 then the code returns -1
     	
    	String exitSequence = CircleGame.newGame(6,0);
    	System.assertEquals('-1', exitSequence);
    	exitSequence = CircleGame.newGame(0,6);
    	System.assertEquals('-1', exitSequence); 
    }
}