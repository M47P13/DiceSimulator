//
//  main.swift
//  DiceSimulator
//
//  Created by Maya Thompson on 10/21/23.
//

// Enumeration for Dice Types
enum DiceType: Int, CaseIterable {
    case FourSided = 4, SixSided = 6, EightSided = 8, TenSided = 10, TwelveSided = 12, TwentySided = 20, TwentyFourSided = 24, ThirtySided = 30, ThirtyFourSided = 34, FortyEightSided = 48, FiftySided = 50, SixtySided = 60, HundredSided = 100, HundredTwentySided = 120
}

// History class to store roll results
class History {
    private var rolls: [Int] = []

    // Method to add a roll result to the history
    func addRoll(roll: Int) {
        rolls.append(roll)
    }

    // Method to get the entire roll history
    func getRollHistory() -> [Int] {
        return rolls
    }
}

// Dice Rolling Simulator class
class DiceRollingSimulator {
    private var dice: [Int] // Array to store the type of dice for each die
    private let history = History()
    private var currentResults: [Int]?

    init(dice: [Int]) {
        self.dice = dice
    }

    func roll() -> [Int] {
        currentResults = []
        var results: [Int] = []
        for die in dice {
            let rollResult = Int.random(in: 1...die)
            currentResults?.append(rollResult)
            results.append(rollResult)
            history.addRoll(roll: rollResult)
        }
        return results
    }

    func getResults() -> [Int] {
        return currentResults ?? []
    }
    
    func totalRoll() -> Int {
        let rolls = getResults()
        
        if dice.count == 1 {
            // For a single die, return the result as the total
            return rolls.first ?? 0
        } else {
            // Sum up the results when rolling multiple dice
            return rolls.reduce(0, +)
        }
    }

    func addDie(dieType: Int) {
        dice.append(dieType)
    }

    func removeDie(at index: Int) {
        if index >= 0 && index < dice.count {
            dice.remove(at: index)
        }
    }
}

// Function to display the dice menu and return the selected dice type
func chooseDiceType() -> Int? {
    print("What type of dice would you like to roll?")
    
    // Enumerate through the DiceType cases
    for (index, diceCase) in DiceType.allCases.enumerated() {
        print("\(index + 1). \(diceCase) (\(diceCase.rawValue)-sided)")
    }
    
    print("Enter the number of the dice type: ", terminator: "")
    
    if let choice = readLine(),
       let diceChoice = Int(choice),
       (1...DiceType.allCases.count).contains(diceChoice) {
        let selectedDice = DiceType.allCases[diceChoice - 1]
        print("You chose: \(selectedDice) (\(selectedDice.rawValue)-sided)")
        return selectedDice.rawValue
    } else {
        print("Invalid input. Please enter a number between 1 and \(DiceType.allCases.count).")
        return chooseDiceType()
    }
}


// Function to ask if the user wants to roll multiple dice
func rollMultipleDice() -> Bool {
    print("Would you like to roll multiple dice? (Yes/No): ", terminator: "")
    if let choice = readLine()?.lowercased() {
        if choice == "yes" {
            return true
        } else if choice == "no" {
            return false
        } else {
            print("Invalid input. Please enter 'Yes' or 'No'.")
            return rollMultipleDice()
        }
    }
    return false
}

// Example usage
var diceTypes: [Int] = []

while true {
    if let selectedDice = chooseDiceType() {
        diceTypes.append(selectedDice)
    } else {
        print("Invalid dice type selected. Please choose a valid option.")
        continue  // Restart the loop to allow the user to choose a valid option
    }

    if !rollMultipleDice() {
        break
    }
}

let simulator = DiceRollingSimulator(dice: diceTypes)
let results = simulator.roll()
let total = simulator.totalRoll()
print("Results: \(results)")
print("Total: \(total)")
