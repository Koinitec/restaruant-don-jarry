import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class PaginationWidget extends StatelessWidget {
  final int pages;
  final int initialPage;
  final ValueChanged<int>? onPageChanged;

  const PaginationWidget({
    super.key,
    required this.pages,
    this.initialPage = 1,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FPagination(
        pages: pages,
        initialPage: initialPage,
        onChange: (page) {
          onPageChanged?.call(page);
        },
      ),
    );
  }
}
