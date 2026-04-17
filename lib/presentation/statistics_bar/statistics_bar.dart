import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/statistics_bar/stat_item.dart';

class StatisticsBar extends StatelessWidget {
  const StatisticsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueAccent.withValues(alpha: 0.05),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 40, // Horizontal space between items
          runSpacing: 20, // Vertical space when wrapped
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
      ),
    );
  }

  Widget _buildDivider() {
    // Hide dividers on small screens when wrapped (optional)
    return LayoutBuilder(builder: (context, constraints) {
      if (MediaQuery.of(context).size.width < 600) return const SizedBox.shrink();
      return Container(
        height: 30,
        width: 1,
        color: Colors.white.withValues(alpha: 0.1),
      );
    });
  }
}
