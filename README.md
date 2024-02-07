# Yahtzee Game

A simple Yahtzee game implemented in Flutter.

## Table of Contents

- [About the Project](#about-the-project)
- [Getting Started](#getting-started)
- [Usage](#usage)

## About the Project

This project is a digital version of the popular dice game Yahtzee, implemented using Flutter, a cross-platform UI toolkit. It allows players to roll dice, hold specific dice, and score points based on various categories such as ones, twos, threes, etc.

If you're not familiar with Yahtzee, here are some resources:

- [The Wikipedia writeup](https://en.wikipedia.org/wiki/Yahtzee)
- An [online version of the game](https://cardgames.io/yahtzee/)

![](https://github.com/sohamvsonar/yahtzee_game/blob/main/assets/SS.jpg)

## Getting Started

To run this project locally, follow these steps:

1. Make sure you have Flutter installed. If not, you can download it from [here](https://flutter.dev/docs/get-started/install).
2. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/sohamvsonar/yahtzee_game.git
4. Open the project in your preferred IDE (e.g., Android Studio, VSCode).
5. Connect a device or start an emulator.
6. Run the application using `flutter run` command in the terminal.

## Usage

- **Start Game**: Click on the "Start Game" button to begin playing Yahtzee.
- **Roll Dice**: Click on the "Roll Dice" button to roll the dice. You can roll the dice up to three times in a turn.
- **Hold Dice**: Tap on a die to toggle holding it. Held dice will not be rerolled in subsequent rolls in the turn.
- **Pick Category**: After rolling the dice, select a scoring category from the scorecard. Once picked, you cannot change the category for the rest of the game.
