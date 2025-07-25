import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StepData {
  final String day;
  final int steps;

  StepData({required this.day, required this.steps});
}

class GraphScreen extends StatelessWidget {
  GraphScreen({super.key});

  final List<StepData> mockStepData = [
    StepData(day: "Mon", steps: 3400),
    StepData(day: "Tue", steps: 5200),
    StepData(day: "Wed", steps: 4800),
    StepData(day: "Thu", steps: 6100),
    StepData(day: "Fri", steps: 7300),
    StepData(day: "Sat", steps: 8200),
    StepData(day: "Sun", steps: 6900),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("7-Day Step Graph"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    int index = value.toInt();
                    if (index >= 0 && index < mockStepData.length) {
                      return Text(mockStepData[index].day);
                    }
                    return const Text('');
                  },
                  reservedSize: 30,
                  interval: 1,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2000,
                  getTitlesWidget: (value, _) => Text(value.toInt().toString()),
                ),
              ),
            ),
            gridData: FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey),
            ),
            minX: 0,
            maxX: (mockStepData.length - 1).toDouble(),
            minY: 0,
            maxY: 10000,
            lineBarsData: [
              LineChartBarData(
                spots: mockStepData
                    .asMap()
                    .entries
                    .map((e) =>
                        FlSpot(e.key.toDouble(), e.value.steps.toDouble()))
                    .toList(),
                isCurved: true,
                color: Colors.teal,
                barWidth: 4,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.teal.withOpacity(0.3),
                ),
                dotData: FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
