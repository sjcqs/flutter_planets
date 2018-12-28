import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

enum VisibilityFlag { visible, invisible, offscreen, gone }

class VisibilityModifier extends StatelessWidget {
  final VisibilityFlag visibility;
  final Widget child;
  final Widget removedChild;

  VisibilityModifier({
    @required this.child,
    @required this.visibility,
  }) : this.removedChild = Container();

  @override
  Widget build(BuildContext context) {
    switch (visibility) {
      case VisibilityFlag.visible:
        return child;
      case VisibilityFlag.invisible:
        return IgnorePointer(
          ignoring: true,
          child: Opacity(opacity: 0.0, child: child),
        );
      case VisibilityFlag.offscreen:
        return Offstage(offstage: true, child: child);
      case VisibilityFlag.gone:
        return removedChild;
    }
    return null;
  }
}
