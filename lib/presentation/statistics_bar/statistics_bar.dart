import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/statistics_bar/stat_item.dart';

class StatisticsBar extends StatelessWidget {
  const StatisticsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withOpacity(0.05),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const StatItem(value: '4+ years', label: 'Experience'),
          _buildDivider(),
          const StatItem(value: 'C2', label: 'Ukrainian, Russian'),
          _buildDivider(),
          const StatItem(value: 'B2+', label: 'English'),
          _buildDivider(),
          const StatItem(value: 'B2', label: 'German, Polish'),
          _buildDivider(),
          const StatItem(value: 'Master', label: 'Mobile Development'),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withOpacity(0.1),
    );
  }
}

