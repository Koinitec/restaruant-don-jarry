import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

/// Modal reutilizable y dinámico usando ForUI.
/// Puedes abrirlo con cualquier contenido dentro.
class DialogModalWidget extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  final String buttonLabel;
  final FButtonStyle Function(FButtonStyle)? buttonStyle;
  final List<Widget>? actions;

  const DialogModalWidget({
    super.key,
    required this.title,
    required this.fields,
    this.buttonLabel = 'Abrir',
    this.buttonStyle,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return FButton(
      style: buttonStyle ?? (style) => style,
      onPress: () {
        showFDialog(
          context: context,
          barrierLabel: 'Modal dinámico',
          barrierDismissible: true,
          builder: (context, style, animation) => FDialog(
            title: Text(title),
            body: _FormContent(fields: fields),
            actions: actions ?? [],
          ),
        );
      },
      child: Text(buttonLabel),
    );
  }
}

class _FormContent extends StatelessWidget {
  final List<Widget> fields;

  const _FormContent({required this.fields});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: fields);
  }
}
