import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    required this.summaryData,
    super.key,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (mapObj) {
              return SummaryItem(mapObj);
            },
          ).toList(),
        ),
      ),
    );
  }
}
