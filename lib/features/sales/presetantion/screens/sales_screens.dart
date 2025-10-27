import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/category_sales_chart.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_filters.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_header.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_search_bar.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_summary_cards.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_trend_chart.dart';

class SalesScreens extends StatefulWidget {
  const SalesScreens({super.key});

  @override
  State<SalesScreens> createState() => _SalesScreensState();
}

class _SalesScreensState extends State<SalesScreens> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _sales = [
    {'category': 'Bebidas', 'amount': 120.0, 'stock': 5},
    {'category': 'Comidas', 'amount': 300.0, 'stock': 20},
    {'category': 'Postres', 'amount': 80.0, 'stock': 15},
  ];

  Map<String, double> get _categoryTotals {
    final Map<String, double> totals = {};
    for (var sale in _sales) {
      final cat = sale['category'] ?? 'Otros';
      totals[cat] = (totals[cat] ?? 0) + (sale['amount'] ?? 0);
    }
    return totals;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            return SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SalesHeader(),
                        const SizedBox(height: 20),

                        _buildSearchAndAddButton(context),
                        const SizedBox(height: 20),

                        const SalesFilters(),
                        const SizedBox(height: 20),

                        SalesSummaryCards(sales: _sales),
                        const SizedBox(height: 40),

                        const Text(
                          ' Tendencia de Ventas (Últimos 7 días)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const SalesTrendChart(),

                        const SizedBox(height: 40),

                        const Text(
                          'Ventas por Categoría',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        CategorySalesChart(categoryTotals: _categoryTotals),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchAndAddButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SalesSearchBar(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
