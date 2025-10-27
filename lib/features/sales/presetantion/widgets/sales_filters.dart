import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class SalesFilters extends StatefulWidget {
  final ValueChanged<String>? onFilterSelected;
  final ValueChanged<DateTimeRange>? onDateRangeSelected;
  final String? selectedFilter;

  const SalesFilters({
    super.key,
    this.onFilterSelected,
    this.onDateRangeSelected,
    this.selectedFilter,
  });

  @override
  State<SalesFilters> createState() => _SalesFiltersState();
}

class _SalesFiltersState extends State<SalesFilters>
    with TickerProviderStateMixin {
  static const _filters = [
    'Hoy',
    'Esta semana',
    'Este mes',
    'Este año',
    'Rango personalizado',
  ];
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedFilter ?? _filters.first;
  }

  DateTimeRange _rangeFor(String filter) {
    final now = DateTime.now();
    final ranges = {
      'Hoy': DateTimeRange(
        start: DateTime(now.year, now.month, now.day),
        end: DateTime(now.year, now.month, now.day + 1),
      ),
      'Esta semana': () {
        final start = now.subtract(Duration(days: now.weekday - 1));
        return DateTimeRange(
          start: start,
          end: start.add(const Duration(days: 7)),
        );
      }(),
      'Este mes': DateTimeRange(
        start: DateTime(now.year, now.month),
        end: DateTime(now.year, now.month + 1),
      ),
      'Este año': DateTimeRange(
        start: DateTime(now.year),
        end: DateTime(now.year + 1),
      ),
    };
    return ranges[filter] ?? DateTimeRange(start: now, end: now);
  }

  Future<void> _onSelect(String filter) async {
    setState(() => _selected = filter);
    widget.onFilterSelected?.call(filter);

    final isCustom = filter == 'Rango personalizado';
    final range = isCustom ? await _pickRange() : _rangeFor(filter);
    if (range == null) return;

    widget.onDateRangeSelected?.call(range);
    if (isCustom) setState(() => _selected = '${range.start} - ${range.end}');
  }

  Future<DateTimeRange?> _pickRange() {
    final start = FDateFieldController(vsync: this);
    final end = FDateFieldController(vsync: this);

    return showDialog<DateTimeRange>(
      context: context,
      builder: (_) => FDialog(
        title: const Text('Seleccionar rango'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FDateField(controller: start, label: const Text('Fecha inicial')),
            const SizedBox(height: 12),
            FDateField(controller: end, label: const Text('Fecha final')),
          ],
        ),
        actions: [
          FButton(
            style: FButtonStyle.outline(),
            onPress: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FButton(
            onPress: () => start.value != null && end.value != null
                ? Navigator.pop(
                    context,
                    DateTimeRange(start: start.value!, end: end.value!),
                  )
                : null,
            child: const Text('Aplicar'),
          ),
        ],
      ),
    );
  }

  Widget _badge(String text) {
    final selected = _selected == text;
    return GestureDetector(
      onTap: () => _onSelect(text),
      child: FBadge(
        style: selected ? FBadgeStyle.primary() : FBadgeStyle.secondary(),
        child: Text(
          text,
          style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 40,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: _filters.length,
      itemBuilder: (_, i) => _badge(_filters[i]),
      separatorBuilder: (_, _) => const SizedBox(width: 8),
    ),
  );
}
