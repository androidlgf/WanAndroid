import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'dart:math' as math;

typedef ProgressChanged<double> = void Function(double value);

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);

class CircleProgressBar extends StatefulWidget {
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final double progress;
  final double radius;
  final int duration;

  final ProgressChanged progressChanged;

  const CircleProgressBar({
    Key key,
    this.color = Colors.white,
    this.strokeColor = Colors.blue,
    this.strokeWidth = 2.0,
    this.radius = 30.0,
    this.progress = 0.0,
    this.duration = 5000,
    this.progressChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CircleProgressState();
  }
}

class _CircleProgressState extends State<CircleProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  double angle = 0.0;

  @override
  void initState() {
    super.initState();
    angle = widget.progress;
    progressController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    if (widget.progress != null) progressController.value = widget.progress;
    progressController.addListener(() {
      if (widget.progressChanged != null)
        widget.progressChanged(progressController.value);
      double ange =
          double.parse(((progressController.value * 360) ~/ 1).toString());
      setState(() {
        angle = -ange;
      });
    });
    progressController.forward().orCancel;
  }

  @override
  void dispose() {
    super.dispose();
    progressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = widget.radius * 2.0;
    final size = new Size(width, width);

    return Container(
      child: CustomPaint(
        painter: ProgressPainter(
            color: widget.color,
            strokeColor: widget.strokeColor,
            strokeWidth: widget.strokeWidth,
            progress: angle,
            radius: widget.radius),
        size: size,
      ),
    );
//    return CustomPaint(
//      painter: ProgressPainter(color: widget.color, progress: angle),
//    );
  }
}

class ProgressPainter extends CustomPainter {
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  double progress;
  final double radius;

  Rect rect;

//  double angle =360.0;

  ProgressPainter(
      {this.color = Colors.white,
      this.strokeColor = Colors.blue,
      this.strokeWidth = 2.0,
      this.radius = 30.0,
      this.progress = 360.0});

  @override
  void paint(Canvas canvas, Size size) {
    double center = size.width * 0.5;
    final Offset offsetCenter = Offset(center, center);
    final circleFillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawCircle(offsetCenter, radius - strokeWidth, circleFillPaint);

    final progressPaint = new Paint();
    progressPaint.color = strokeColor;
    progressPaint.style = PaintingStyle.stroke;
    progressPaint.strokeCap = StrokeCap.round;
    progressPaint.strokeWidth = strokeWidth;

    rect = Rect.fromCircle(center: offsetCenter, radius: radius);
    progress = progress * (-1);
    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi * progress / 180;
    Path path = new Path();
    path.arcTo(rect, startAngle, sweepAngle, true);
    canvas.drawPath(path, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
