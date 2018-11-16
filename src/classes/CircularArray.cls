/*
• The CircularArray class enables a circle of children to be created: 
• A sequential id is assigned to each array item.
• The removeOne() method enables the kth child to be removed from the circle. 
• At the end of the game, the winner() method returns the last child left. 
*/
public class CircularArray {
	private List<Integer> circleId;
	private Integer playersLeft;
	
	// CircularArray size = number of players left
	public Integer size() {
		return playersLeft;
	}
    
    // Constructor method initializes variables
    public CircularArray(Integer n) {
    	circleId = new List<Integer>();
    	for (Integer i=0; i<n; i++) circleId.add(i+1);
    	playersLeft = n;
    }
    
    // removeOne method goes round the circle and removes the kth player
    // It returns the next start position and the id of the player just removed
    public List<Integer> removeOne(Integer start, Integer k) {
     	Integer winner = 0;
    	Integer count = 0;
    	Integer newStart = start - 1;
    	Integer playerOut = -1;
    	List<Integer> returnList = new List<Integer>();
    	if (k < 1) {
    		playersLeft = 0;
    	}
		// If either n or k are invalid, -1 will be returned as the winner value
     	
    	if (playersLeft > 1) {
	    	while (count < k) {
	    		count++;
	    		if (newStart < playersLeft-1) newStart++; else newStart = 0;
	    	}
	    	playerOut = circleId[newStart];
	      	for (Integer j=newStart; j<playersLeft-1; j++) {
	      		circleId[j] = circleId[j+1];
	      	}
	    	playersLeft--;
    	}	
    	System.debug('>>>>newStart: '+newStart);
    	System.debug('>>>>playerOut: '+playerOut);
    	returnList.add(newStart);
    	returnList.add(playerOut);
    	return returnList;   	
    }
    
    // This method only works when the game is over
    public Integer winner() {
    	if (playersLeft == 1) return circleId[0]; else return -1;
    }
}