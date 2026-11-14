import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/statistics_bar/stat_item.dart';

class StatisticsBar extends StatelessWidget {
  const StatisticsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: Colors.blueAccent.withValues(alpha: 0.05),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: isMobile ? 20 : 40,
          runSpacing: 20,
          children: [
            const StatItem(value: '4,5 years', label: 'Experience'),
            if (!isMobile) _buildDivider(),
            const StatItem(value: 'C2', label: 'Ukrainian, Russian'),
            if (!isMobile) _buildDivider(),
            const StatItem(value: 'B2+', label: 'English'),
            if (!isMobile) _buildDivider(),
            const StatItem(value: 'B2', label: 'German, Polish'),
            if (!isMobile) _buildDivider(),
            const StatItem(value: 'Master', label: 'Mobile Development'),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withValues(alpha: 0.1),
    );
  }
}
