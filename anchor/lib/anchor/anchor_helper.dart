import 'package:flutter/material.dart';

import 'anchor.dart';
import 'anchor_property.dart';

class AnchorHelper {
  static List<Anchor> anchorList(List<AnchorProperty> properties) {
    List<Anchor> anchors = [];
    for (var v in properties) {
      v.key = GlobalKey();

      final Anchor anchor = Anchor(
        properties: properties,
        anchorId: v.id,
        anchorKey: v.key!,
      );

      anchors.add(anchor);
    }

    return anchors;
  }
}
