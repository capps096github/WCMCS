import '../../app_exporter.dart';

/// an entrance fader widget for fading in widgets as they enter the screen

class EntranceFader extends StatefulWidget {
  /// `EntranceFader` constructor
  const EntranceFader({
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.duration = halfSeconds,
    this.offset = const Offset(0, 32),
  });

  /// Child to be animated on entrance
  final Widget child;

  /// Delay after which the animation will start
  final Duration delay;

  /// Duration of entrance animation
  final Duration duration;

  /// Starting point from which the widget will fade to its default position
  final Offset offset;

  @override
  State<EntranceFader> createState() => _EntranceFaderState();
}

class _EntranceFaderState extends State<EntranceFader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _dxAnimation;
  late Animation<double> _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween<double>(begin: widget.offset.dx, end: 0).animate(_controller);
    _dyAnimation =
        Tween<double>(begin: widget.offset.dy, end: 0).animate(_controller);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _controller.value,
        child: Transform.translate(
          offset: Offset(_dxAnimation.value, _dyAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
