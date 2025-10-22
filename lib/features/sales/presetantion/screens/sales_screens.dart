import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_filters.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_header.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/widgets/sales_search_bar.dart';

class SalesScreens extends StatefulWidget {
  const SalesScreens({super.key});

  @override
  State<SalesScreens> createState() => _SalesScreensState();
}

class _SalesScreensState extends State<SalesScreens> {
  final TextEditingController _searchController = TextEditingController();

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
                        SalesHeader(),
                        SizedBox(height: 20),
                        _buildSearchAndAddButton(context),
                        SizedBox(height: 20),
                        SalesFilters(),
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
