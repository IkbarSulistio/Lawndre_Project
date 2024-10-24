// widgets/star_rating.dart

import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // Current rating value
  final ValueChanged<int> onRatingSelected; // Callback function

  const StarRating({super.key, required this.rating, required this.onRatingSelected});

  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () => onRatingSelected(index + 1),
      child: Icon(
        index < rating ? Icons.star : Icons.star_border, // Filled or outlined star
        color: Colors.black, // Star color
        size: 36,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => buildStar(index)),
    );
  }
}
