({  
	// If input is valid, use a static method from the Apex Controller to run the game and 
	// use a callback method to return the results
    clickRun: function(component, event, helper) {
        var validInput = component.find('circlegameform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if (validInput){
            // Run the game
	        var action = component.get("c.newGame");
	        action.setParams({
	            "n": component.get("v.nValue"),
	            "k": component.get("v.kValue")
	        }); 
	        // Add callback behaviour for when response is received
	        action.setCallback(this, function(response) {
	            var state = response.getState();
	            if (state === "SUCCESS") {
	            	var exitSequence = response.getReturnValue();
	            	var exitArray = exitSequence.split(',');
	            	var winner = exitArray[exitArray.length - 1];
	            	if (winner == '-1') {
	            		exitSequence = ''; winner = 'An error has occurred!'
	            	}
	                component.set("v.exitSequence", exitSequence);
	                component.set("v.winner", winner);
	            }
	            else {
	                console.log("Failed with state: " + state);
	            }
	        });
	        // Send action off to be executed
	        $A.enqueueAction(action);
        }
    },
})