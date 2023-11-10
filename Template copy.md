# Overview

As a software engineer seeking to enhance my programming skills, I developed a Swift program called "Dice Simulator." This software simulates rolling dice, providing an interactive experience for users to choose different types of dice, roll them, and view the results. The goal is to practice Swift programming, reinforce object-oriented principles, and create a useful tool for simulating dice rolls.

## Code Structure

### DiceType Enumeration

- Defines an enumeration `DiceType` representing various types of dice with different numbers of sides.

### History Class

- A class `History` is implemented to store the history of roll results.

### DiceRollingSimulator Class

- Represents the main simulator class.
- Manages the dice configuration, rolling, and result tracking.
- Includes methods to roll a single die or multiple dice, get results, and calculate the total.

### Main Functions

- **chooseDiceType():** Displays the dice menu and allows the user to choose a dice type.

- **rollMultipleDice():** Asks the user if they want to roll multiple dice.

### Example Usage

- Collects user input for the types of dice to roll.
- Creates an instance of `DiceRollingSimulator` with the chosen dice.
- Rolls the dice, displays individual results, and calculates the total.

# Purpose

The purpose of the "Dice Simulator" is to offer a hands-on learning experience in Swift development. The software allows users to explore Swift's features, such as enumerations, classes, and interactive console input. The project serves as a practical application of programming concepts, offering a dynamic and engaging way to simulate dice rolls with varying dice types and configurations.

# Software Demo Video

[Software Demo Video](https://www.youtube.com/watch?v=VOVdqUNJaq)

Watch a one-minute demonstration of the "Dice Simulator" in action. The video includes a walkthrough of the code, showcasing its features and functionality.

# Development Environment

The "Dice Simulator" was developed using the following tools:

- **Xcode:** The primary integrated development environment (IDE) for Swift programming.
- **Swift Programming Language:** Utilized to write the core logic of the dice simulation.

# Useful Websites

To aid in the development of the "Dice Simulator," the following websites were particularly helpful:

* [Swift.org](https://swift.org/): The official website for the Swift programming language, providing documentation and resources.
* [Apple Developer Documentation](https://developer.apple.com/documentation/): The official documentation for Apple's development technologies, including Swift.
* [Stack Overflow](https://stackoverflow.com/): A community-driven question and answer platform, valuable for troubleshooting and problem-solving in Swift development.

# Example Usage

```swift
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
```
