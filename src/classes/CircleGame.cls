/*
• ’n’ children stand around a circle.
• Staring with a given child and working clockwise, each child gets a sequential number, which we will refer to as the child’s ‘id’
• Then starting with the first child, they count from 1 until ‘k’, where ‘k’ is determined at the start of the game. 
• The child who counts ‘k’ is now out and leaves the circle. 
• The count starts again with the child immediately next to the eliminated one.
• Children are so removed from the circle one by one. The winner is the child left standing last.
*/
public class CircleGame {
    
    @AuraEnabled
    public static String newGame(Integer n, Integer k) {
	    // n is the number of players
	    // k is the count of players until the next one who has to exit
	    
    	List<Integer> exitSequence = new List<Integer>();
    	
    	// Create a new circle of n players
    	CircularArray circle = new CircularArray(n);
    	Integer newStart = 0;
    	
    	// Cycle through, removing the kth player each time, until there is one left
    	while (circle.size() > 1 && k > 0) {
    		Integer start = newStart;
    		Integer[] result = circle.removeOne(start, k);
    		// result[0] is the next place to start
    		// result[1] is the id of the player just removed
    		newStart = result[0];
    		exitSequence.add(result[1]);
    	}
    	
    	exitSequence.add(circle.winner());
    	System.debug('>>>>exitSequence: '+exitSequence);
    	return String.join(exitSequence,','); 
    	// return a string listing the players who exited, with the winner at the end
    } 
    
}