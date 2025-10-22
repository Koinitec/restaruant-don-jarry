import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:intl/intl.dart';

class SalesFilters extends StatefulWidget {
  final ValueChanged<String>? onFilterSelected;
  final String? selectedFilter;
  final ValueChanged<DateTimeRange>? onDateRangeSelected;

  const SalesFilters({
    super.key,
    this.onFilterSelected,
    this.selectedFilter,
    this.onDateRangeSelected,
  });

  @override
  State<SalesFilters> createState() => _SalesFiltersState();
}

class _SalesFiltersState extends State<SalesFilters>
    with TickerProviderStateMixin {
  static const List<String> _filters = [
    'Hoy',
    'Esta semana',
    'Este mes',
    'Este año',
    'Rango personalizado',
  ];

  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedFilter ?? _filters.first;
  }

  Future<void> _onFilterTap(String filter) async {
    setState(() => _selected = filter);
    widget.onFilterSelected?.call(filter);

    if (filter == 'Rango personalizado') {
      await _showDateRangeDialog();
    } else {
      widget.onDateRangeSelected?.call(_deriveRangeFromQuickFilter(filter));
    }
  }

  DateTimeRange _deriveRangeFromQuickFilter(String filter) {
    final now = DateTime.now();
    DateTime start;
    DateTime end;

    switch (filter) {
      case 'Hoy':
        start = DateTime(now.year, now.month, now.day);
        end = start.add(const Duration(days: 1));
        break;
      case 'Esta semana':
        start = now.subtract(Duration(days: now.weekday - 1));
        end = start.add(const Duration(days: 7));
        break;
      case 'Este mes':
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 1);
        break;
      case 'Este año':
        start = DateTime(now.year, 1, 1);
        end = DateTime(now.year + 1, 1, 1);
        break;
      default:
        start = now;
        end = now;
    }

    return DateTimeRange(start: start, end: end);
  }

  Future<void> _showDateRangeDialog() async {
    final startController = FDateFieldController(vsync: this);
    final endController = FDateFieldController(vsync: this);

    await showDialog(
      context: context,
      builder: (context) {
        return FDialog(
          title: const Text('Seleccionar rango de fechas'),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FDateField(
                controller: startController,
                label: const Text('Fecha inicial'),
              ),
              const SizedBox(height: 12),
              FDateField(
                controller: endController,
                label: const Text('Fecha final'),
              ),
            ],
          ),
          actions: [
            FButton(
              style: FButtonStyle.outline(),
              onPress: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            FButton(
              onPress: () {
                if (startController.value != null &&
                    endController.value != null) {
                  final range = DateTimeRange(
                    start: startController.value!,
                    end: endController.value!,
                  );
                  Navigator.pop(context);
                  widget.onDateRangeSelected?.call(range);

                  final fmt = DateFormat('dd/MM/yyyy');
                  final label =
                      '${fmt.format(range.start)} - ${fmt.format(range.end)}';
                  setState(() => _selected = label);
                }
              },
              child: const Text('Aplicar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterBadge(String filter) {
    final isSelected = _selected == filter;
    return GestureDetector(
      onTap: () => _onFilterTap(filter),
      child: FBadge(child: Text(filter)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: _filters.length,
        itemBuilder: (_, i) => _buildFilterBadge(_filters[i]),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      ),
    );
  }
}
