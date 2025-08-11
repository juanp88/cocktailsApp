import 'package:flutter/material.dart';

class DrinkStatsSection extends StatelessWidget {
  final int count;
  final String drinkType;
  final Color accentColor;

  const DrinkStatsSection({
    super.key,
    required this.count,
    required this.drinkType,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_bar, color: accentColor, size: 20),
          const SizedBox(width: 8),
          Text(
            '$count $drinkType available',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
