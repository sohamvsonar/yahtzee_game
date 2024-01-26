import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';

class DiceDisplay extends StatefulWidget {
  final Dice dice;
  final Function(int) onToggleHold;
  final Function onRoll;
  final int diceRollCount;

  DiceDisplay({
    required this.dice,
    required this.onToggleHold,
    required this.onRoll,
    required this.diceRollCount,
  });
  
  @override
  _DiceDisplayState createState() => _DiceDisplayState();
}

class _DiceDisplayState extends State<DiceDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.dice.values.length; i++)
              GestureDetector(
                onTap: () => widget.onToggleHold(i),
                child: Container(
                  margin: EdgeInsets.all(4), 
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), 
                    color: widget.dice.isHeld(i) ? Colors.grey : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      (widget.diceRollCount > 0 && widget.dice[i] != null)
                          ? widget.dice[i].toString()
                          : '', 
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
          ],
        ),
        ElevatedButton(
          onPressed: widget.diceRollCount < 3 ? widget.onRoll as VoidCallback : null,
          child: Text(getRollButtonText()),
        ),
      ],
    );
  }

  String getRollButtonText() {
    if (widget.diceRollCount == 0) {
      return 'Roll Dice(1)';
    } else if (widget.diceRollCount < 3) {
      return 'Roll Dice (${widget.diceRollCount + 1})';
    } else {
      return 'Out of Rolls!';
    }
  }
}
