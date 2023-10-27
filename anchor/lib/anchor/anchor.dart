import 'package:flutter/material.dart';

import 'anchor_property.dart';

class Anchor extends StatelessWidget {
  final List<AnchorProperty> properties;
  final GlobalKey anchorKey;
  final String anchorId;

  const Anchor({
    Key? key,
    required this.anchorKey,
    required this.properties,
    required this.anchorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (var v in properties) {
      final Color color =
          anchorId == v.id ? Colors.tealAccent : Colors.transparent;

      Widget button = Material(
        child: Ink(
          height: 32,
          width: 80,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            onTap: () {
              if (v.key != null && v.key!.currentContext != null) {
                Scrollable.ensureVisible(v.key!.currentContext!);
              }
            },
            child: Center(child: Text(v.label)),
          ),
        ),
      );

      buttons.add(button);
    }

    return Container(
      key: anchorKey,
      padding: const EdgeInsets.all(8),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children: buttons,
      ),
    );
  }
}
