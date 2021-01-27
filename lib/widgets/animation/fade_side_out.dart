import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeSideOut extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeSideOut(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 0.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 0, end: -130.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}
