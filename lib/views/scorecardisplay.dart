import 'package:flutter/material.dart';
import 'package:mp2/models/scorecard.dart';

class ScorecardDisplay extends StatelessWidget {
  final ScoreCard scorecard;
  final Function(ScoreCategory) onCategorySelected;

  ScorecardDisplay({required this.scorecard, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    List<ScoreCategory> firstColumnCategories = ScoreCategory.values.take(6).toList();
    List<ScoreCategory> secondColumnCategories = ScoreCategory.values.skip(6).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: firstColumnCategories.map((category) {
                return _buildCategoryButton(category);
              }).toList(),
            ),
            SizedBox(width: 50), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: secondColumnCategories.map((category) {
                return _buildCategoryButton(category);
              }).toList(),
            ),
          ],
        ),
        SizedBox(height: 20), 
        Text('Current Score: ${scorecard.total}', style: TextStyle(fontSize: 20, color: Colors.white)),
      ],
    );
  }

  Widget _buildCategoryButton(ScoreCategory category) {
    final score = scorecard[category];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${category.name}: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            if (score != null)
              Text(
                score.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            if (score == null) 
              Row(
                children: [
                  SizedBox(width: 30), 
                  ElevatedButton(
                    onPressed: () => onCategorySelected(category),
                    child: Text('Pick'),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: 10), 
      ],
    );
  }
}
