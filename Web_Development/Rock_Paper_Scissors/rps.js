//enum for possible choices
const choice = {
    1: "rock",
    2: "paper",
    3: "scissors"
}
 const ROCK = "rock";
 const PAPER = "paper";
 const SCISSORS = "scissors";

function playGame()
{
    let playerPoint = 0;
    let cpuPoint = 0;
    let tie = 0;
    let numRounds = Number(prompt("Enter how many rounds of Rock Paper Scissors you want to play."));

    //check the validity of player's input for number of rounds
    if (numRounds <= 0 || Number.isNaN(numRounds))
    {
        console.log("Invalid input. Value must be a positive integer.");
    }
    else
    {
        for (let i = 1; i <= numRounds; i++)
        {
            console.log("round: " + i);

            //run debugger by uncommenting the line below
            //debugger;

            let playerPick = prompt('Make your selection: (Must be "rock", "paper" or "scissors")');
            let cpuPick = choice[Math.floor(Math.random() * 3) + 1];

            //default player's pick to "rock" if invalid input given
            if (playerPick.toLowerCase() !== ROCK && playerPick.toLowerCase() !== PAPER && playerPick.toLowerCase() !== SCISSORS)
            {
                playerPick = "rock";
            }

            //tie case
            if (playerPick.toLowerCase() === cpuPick)
            {
                tie++;
                result = "tie";
            }
            else
            {
                switch (playerPick.toLowerCase())
                {
                    case "rock":
                    {
                        if (cpuPick === PAPER)
                        {
                            cpuPoint++;
                            result = "computer wins";
                        }
                        else if (cpuPick === SCISSORS)
                        {
                            playerPoint++;
                            result = "player wins";
                        }
                    }
                    break;
                    case "paper":
                    {
                        if (cpuPick === SCISSORS)
                        {
                            cpuPoint++;
                            result = "computer wins";
                        }
                        else if (cpuPick === ROCK)
                        {
                            playerPoint++;
                            result = "player wins";
                        }
                    }
                    break;
                    case "scissors":
                    {
                        if (cpuPick === ROCK)
                        {
                            cpuPoint++;
                            result = "computer wins";
                        }
                        else if (cpuPick === PAPER)
                        {
                            playerPoint++;
                            result = "player wins";
                        }
                    }
                    break;
                    //if user input is neither rock, paper, or scissors, then default value is rock
                    default:
                    {
                        //playerPick is "rock";
                        if (cpuPick === PAPER)
                        {
                            cpuPoint++;
                            result = "computer wins";
                        }
                        else if (cpuPick === SCISSORS)
                        {
                            playerPoint++;
                            result = "player wins";
                        }
                    }
                }
            }
            console.log("player selected " + playerPick.toLowerCase() + " and computer selected " + cpuPick);
            console.log("result: " + result);
            console.log("score: " + playerPoint + " player wins " + cpuPoint + " computer wins " + tie + " tie");
        }

        console.log("final score: " + playerPoint + " player wins " + cpuPoint + " computer wins " + tie + " tie");
    }
}
