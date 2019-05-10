const readline = require('readline');
// Create the interface from the module
// this will allow us to receive user input
// via the terminal (gets, gets.chomp in ruby)
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

class Game {
    run() {
        // until all the discs have been moved to the last pile
            // get move from current player
            // make move on the pile
    }

    constructor() {
        this.towers = [[1,2,3],[],[]];
    }

    promptMove() {
        console.log(this.towers);
        rl.question("From where do you want to move the disc?", startTowerIdx => {
            rl.question("To where do you want to move the disc?", endTowerIdx => {
                console.log(startTowerIdx);
                console.log(endTowerIdx);
                rl.close();
            });
        });
    }

    isValidMove() {
        
    }
}

const hanoi = new Game();
hanoi.promptMove();