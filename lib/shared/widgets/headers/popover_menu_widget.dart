import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class PopoverMenuWidget extends StatefulWidget {
  final List<FItemGroup> menuGroups;
  final Widget child;
  final Alignment menuAnchor;
  final Alignment childAnchor;
  final double maxHeight;

  const PopoverMenuWidget({
    super.key,
    required this.menuGroups,
    required this.child,
    this.menuAnchor = Alignment.topCenter,
    this.childAnchor = Alignment.bottomCenter,
    this.maxHeight = 200,
  });

  @override
  State<PopoverMenuWidget> createState() => _PopoverMenuWidgetState();
}

class _PopoverMenuWidgetState extends State<PopoverMenuWidget>
    with TickerProviderStateMixin {
  late final FPopoverController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FPopoverController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FPopoverMenu(
      popoverController: _controller,
      scrollController: ScrollController(),
      menuAnchor: widget.menuAnchor,
      childAnchor: widget.childAnchor,
      maxHeight: widget.maxHeight,
      menu: widget.menuGroups,
      builder: (context, controller, child) {
        return GestureDetector(onTap: controller.toggle, child: widget.child);
      },
    );
  }
}
