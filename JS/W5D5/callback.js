class Clock {
    constructor() {
        this.date = new Date(); 
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();
        this.printTime();
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        console.log(this.hours + ":" + this.minutes + ":" + this.seconds); 
    }

    _tick() {
        this.seconds = this.seconds + 1;
        this.printTime();
    }
}

// const clock = new Clock();

const readline = require('readline');
// Create the interface from the module
// this will allow us to receive user input
// via the terminal (gets, gets.chomp in ruby)
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        rl.question('Enter a number', (answer) => {
            let currentNumber = parseInt(answer);
            sum += currentNumber;
            console.log(sum);
            numsLeft -= 1;
            addNumbers(sum, numsLeft, completionCallback);
        });

    }
    if(numsLeft === 0) {
        rl.close();
        completionCallback(sum);
    }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

function askIfGreaterThan(el1, el2, callback) {
    rl.question(`Is ${el1} > ${el2} ?`, answer => {
        if (answer === 'yes') {
            callback(true);
        } else {
            callback(false);
        }
    });
}

// askIfGreaterThan(2, 3, isGreaterThan => {
//     console.log(answer);
// });

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if(i < arr.length -1) {
        askIfGreaterThan(arr[i], arr[i+1], isGreaterThan => {
            if (isGreaterThan === true) {
                let temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        });
    }
  
    if(i == (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
    }
}

// innerBubbleSortLoop([2,7,1,7,2,5,12,4], 0, false, swap => {
//     console.log("In outer bubble sort");
// });

function absurdBubbleSort(arr, sortCompletionCallback) { 
    outerBubbleSortLoop(true);
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps == true) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
    }
}

// absurdBubbleSort([31, 20, 12, 3], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     rl.close();
// });

Function.prototype.myBind = function(context) {
    return () => {
        this.apply(context);
    };
};


class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}

const turnOn = function () {
    console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// // const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// // boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

Function.prototype.myThrottle = function(interval) {
    let tooSoon = false;
    return () => {
        if(tooSoon === false) {
            tooSoon = true;
            setTimeout(()=> {
                tooSoon = false;
            }, interval);
               this();
        }
    };
};
class Neuron {
    fire() {
        console.log("Firing!");
    }
};

const neuron = new Neuron;
// // When we create a new Neuron, 
// // we can call #fire as frequently as we want

// // The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//     neuron.fire();
// }, 10);

// neuron.fire = neuron.fire.myThrottle(2000);

// const interval = setInterval(() => {
//     neuron.fire();
// }, 10);
class SearchBar {
    constructor() {
        this.query = "";

        this.type = this.type.bind(this);
        this.search = this.search.bind(this);
    }

    type(letter) {
        this.query += letter;
        this.search();
    }

    search() {
        console.log(`searching for ${this.query}`);
    }
}



Function.prototype.myDebounce = function(interval) {
    let timeout;
    return () => {
        clearTimeout(timeout);
        timeout = 
        setTimeout(() => {
            this();
        }, interval);
    };
};

const searchBar = new SearchBar;
searchBar.search = searchBar.search.myDebounce(2000);

const queryForHelloWorld = () => {
    searchBar.type("h");
    searchBar.type("e");
    searchBar.type("l");
    searchBar.type("l");
    searchBar.type("o");
    searchBar.type(" ");
    searchBar.type("w");
    searchBar.type("o");
    searchBar.type("r");
    searchBar.type("l");
    searchBar.type("d");
}

queryForHelloWorld();