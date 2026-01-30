import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class PerformanceCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? titleicon;

  const PerformanceCard({
    super.key,
    required this.title,
    required this.value,
    this.titleicon,
  });

  @override
  Widget build(BuildContext context) {
    final data = [
      _ChartData('Jan', 20, false),
      _ChartData('Feb', 50, false),
      _ChartData('Mar', 90, true),
      _ChartData('Apr', 0, false),
      _ChartData('May', 0, false),
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Container(
            decoration: BoxDecoration(
              color:whiteColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: greyColor.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 15),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      if (titleicon != null) Icon(titleicon),
                    ],
                  ),
                ),

                SizedBox(
                  height: 180,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Divider(thickness: .2, height: .5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:
                              data.map((d) => _buildSingleBar(d)).toList(),
                        ),

                        LineChart(
                          LineChartData(
                            gridData: FlGridData(
                              show: true,
                              drawHorizontalLine: false,
                              drawVerticalLine: true,
                              verticalInterval: .8,
                              getDrawingVerticalLine: (value) {
                                return FlLine(
                                  // ignore: deprecated_member_use
                                  color: Colors.grey.withOpacity(0.2),
                                  strokeWidth: .5,
                                );
                              },
                            ),
                            titlesData: const FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            minX: 0,
                            maxX: 4,
                            minY: 0,
                            maxY: 180,
                            lineBarsData: [
                              LineChartBarData(
                                spots:
                                    data
                                        .asMap()
                                        .entries
                                        .where((e) {
                                          int selectedIndex = data.indexWhere(
                                            (d) => d.isSelected,
                                          );
                                          return e.key <= selectedIndex;
                                        })
                                        .map((e) {
                                          return FlSpot(
                                            e.key.toDouble(),
                                            e.value.value,
                                          );
                                        })
                                        .toList(),
                                isCurved: true,
                                color: const Color(0xFF00C896),
                                barWidth: 3,
                                isStrokeCapRound: true,
                                dotData: FlDotData(
                                  show: true,
                                  checkToShowDot:
                                      (spot, barData) => spot.x == 2,
                                  getDotPainter: (
                                    spot,
                                    percent,
                                    barData,
                                    index,
                                  ) {
                                    return FlDotCirclePainter(
                                      radius: 6,
                                      color: const Color(0xFF00C896),
                                      strokeWidth: 3,
                                      strokeColor:whiteColor,
                                    );
                                  },
                                ),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color:blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleBar(_ChartData data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 67,
          height: data.value > 0 ? data.value * 1.3 : 20,
          decoration: BoxDecoration(
            color:
                data.isSelected
                    ? const Color(0xFFB5F3D6)
                    : (data.value > 0
                        ? Colors.grey.shade200
                        : Colors.transparent),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  data.label,
                  style: TextStyle(
                    color:
                        data.isSelected
                            ? const Color(0xFF00C896)
                            : Colors.grey[400],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  final String label;
  final double value;
  final bool isSelected;

  _ChartData(this.label, this.value, this.isSelected);
}
