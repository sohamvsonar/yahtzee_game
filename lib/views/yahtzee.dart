// yahtzee.dart
import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';
import 'package:mp2/models/scorecard.dart';
import 'dicedisplay.dart';
import 'scorecardisplay.dart';
import 'dart:ui' as ui;

class Yahtzee extends StatefulWidget {
  @override
  _YahtzeeState createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  late Dice dice;
  ScoreCard scoreCard = ScoreCard();
  int currentTurn = 1;
  bool turnOver = false;
  int diceRollCount = 0;
  bool canPickCategory = false;
  int currentTotalScore = 0;
  bool gameStarted = false;

  final Image _backgroundImage = Image.asset(
    'assets/dice.jpg', // Replace with the path to your image
    fit: BoxFit.cover, // You can adjust the fit as needed
  );

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      dice = Dice(5);
      dice.roll();
      diceRollCount = 0;
      canPickCategory = false;
      turnOver = false;
      gameStarted = true;
    });
  }

  void startNewTurn() {
    setState(() {
      dice.roll();
      diceRollCount = 0;
      canPickCategory = false;
      turnOver = false;
    });
  }

  void _rollDice() {
    if (!turnOver && diceRollCount < 3) {
      setState(() {
        dice.roll();
        diceRollCount++;
        canPickCategory = true;
      });
    }
  }

  void _toggleHold(int index) {
    if (diceRollCount > 0) {
      setState(() {
        dice.toggleHold(index);
      });
    }
  }

  void _selectCategory(ScoreCategory category) {
    if (!turnOver && canPickCategory && scoreCard[category] == null) {
      scoreCard.registerScore(category, dice.values);
      setState(() {
        diceRollCount = 0;
        canPickCategory = false;
        dice.holdClear();
        if (scoreCard.completed) {
          _showEndGameDialog();
        }
        currentTotalScore = scoreCard.total;
      });
    }
  }

  void _showEndGameDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Game Over'),
        content: Text('Total Score: $currentTotalScore'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                startNewGame();  
                scoreCard.clear(); 
                currentTurn = 1; 
              });
              Navigator.of(context).pop(); 
            },
            child: Text('Play Again'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    if (!gameStarted) {
      return ElevatedButton(
        onPressed: startNewGame,
        child: Text('Start Game'),
      );
    }

    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: _backgroundImage,
        ),
        // Existing content
        Container(
          width: 1280,
          height: 720,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              DiceDisplay(
                dice: dice,
                onToggleHold: _toggleHold,
                onRoll: _rollDice,
                diceRollCount: diceRollCount,
              ),
              SizedBox(height: 16.0),
              ScorecardDisplay(
                scorecard: scoreCard,
                onCategorySelected: _selectCategory,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
