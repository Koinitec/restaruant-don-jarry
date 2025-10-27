import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CategorySalesChart extends StatelessWidget {
  final Map<String, double> categoryTotals;

  const CategorySalesChart({super.key, required this.categoryTotals});

  static const _barColor = Color(0xFFf39c12);
  static const _barGradientEnd = Color(0xFFe67e22);
  static const _cardBackground = Colors.white;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxY =
        (categoryTotals.values.isEmpty
            ? 0
            : categoryTotals.values.reduce((a, b) => a > b ? a : b)) +
        2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final fontScale = (width / 400).clamp(0.8, 1.2);
        final padding = isMobile ? 16.0 : 20.0;

        // 🔹 Ajustamos intervalo dinámico para evitar etiquetas superpuestas
        final horizontalInterval = (maxY / 5).clamp(1, double.infinity);

        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: _cardBackground,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ventas por Categoría",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16 * fontScale,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Desglose de ventas por tipo de producto",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12 * fontScale,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),

              AspectRatio(
                aspectRatio: isMobile ? 1 : 1.6,
                child: BarChart(
                  BarChartData(
                    maxY: maxY.toDouble(),
                    alignment: BarChartAlignment.spaceAround,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: horizontalInterval.toDouble(),
                      getDrawingHorizontalLine: (value) =>
                          FlLine(color: Colors.grey.shade200, strokeWidth: 1),
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: isMobile ? 36 : 44,
                          interval: horizontalInterval.toDouble(),
                          getTitlesWidget: (value, meta) {
                            // Solo mostramos valores redondeados exactos
                            if (value % horizontalInterval != 0) {
                              return const SizedBox.shrink();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 11 * fontScale,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: isMobile ? 28 : 36,
                          getTitlesWidget: (value, _) {
                            final keys = categoryTotals.keys.toList();
                            if (value.toInt() >= 0 &&
                                value.toInt() < keys.length) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  keys[value.toInt()],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 11 * fontScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    barGroups: List.generate(categoryTotals.length, (i) {
                      final key = categoryTotals.keys.elementAt(i);
                      final value = categoryTotals[key] ?? 0;
                      return BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: value,
                            gradient: const LinearGradient(
                              colors: [_barColor, _barGradientEnd],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            width: isMobile ? 16 : 22,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      );
                    }),
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipPadding: const EdgeInsets.all(8),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final category = categoryTotals.keys.elementAt(
                            group.x.toInt(),
                          );
                          return BarTooltipItem(
                            "$category\n${rod.toY.toStringAsFixed(1)} ventas",
                            TextStyle(
                              color: _barColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12 * fontScale,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
