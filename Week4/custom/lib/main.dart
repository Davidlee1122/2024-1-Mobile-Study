import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Week4"),
    );
  }
}

Widget _buildBox(CustomPainter customPainter) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black
    ),
    height: 100,
    width: 254,
    child: CustomPaint(
      painter: customPainter,
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBox(CutomPaintTest()),
            SizedBox(
              height: 30,
            ),
            _buildBox(CutomPaintTest1()),
            SizedBox(
              height: 30,
            ),
            _buildBox(CutomPaintTest2()),
          ],
        )
      ),
    );
  }
}

class CutomPaintTest extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Paint paint2 = Paint()..color = Colors.black;

    canvas.drawCircle(Offset(0.0, 50.0), 50, paint);
    canvas.drawCircle(Offset(254.0, 50.0), 50, paint2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CutomPaintTest1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(0.0, 50.0), 50, paint);
    canvas.drawCircle(Offset(254.0, 50.0), 50, paint2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CutomPaintTest2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    Paint paint2 = Paint()..color = Colors.black;

    canvas.drawCircle(Offset(0.0, 50.0), 50, paint);
    canvas.drawCircle(Offset(254.0, 50.0), 50, paint2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
