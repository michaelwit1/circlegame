# circlegame
Salesforce code to implement the circle game

To run the game, 

•	use the following URL in any (modern) browser:
https://mwsfdemo-dev-ed.lightning.force.com/c/circleGameApp.app

•	Login to Salesforce with 
username: michaelwit@sfdemo.com 
password: circlegame9

The code components are:
src/aura/circleGameApp.app       (Lightning App)

src/aura/circleGame.cmp          (Lightning component)

src/aura/circleGameController.js (JavaScript controller for this component)

src/classes/CircleGame.cls       (Apex Class to run the game and return the results)

src/classes/CircularArray.cls    (Creates a circular array with methods to remove players and return the winner)

src/classes/CircleGameTest .cls  (Unit test class for the Apex code)

The runtime order complexity is O(n^2) since there is a loop (of size k) within another loop (of size n).
