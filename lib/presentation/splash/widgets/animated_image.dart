import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: false);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset(0, -0.08),
    // end: Offset(0, 0.08),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  final Widget svg = SvgPicture.asset(
    'assets/images/logowtext.svg',
    semanticsLabel: 'Kothon Logo',
    height: 200,
    // width: 100,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: svg,
    );
  }
}
