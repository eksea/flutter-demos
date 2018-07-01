import 'package:flutter/material.dart';

class DemosCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Canvas Demo')
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          new Expanded(
            child: new Container(
              child: new Signature(),
              decoration: new BoxDecoration(
                border: new Border.all(width: 4.0, color: Colors.blue),
              ),
            ),
          ),
          new ButtonSection(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FlatButton(
          child: new Text('Refurbish'),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {},
        ),
        new FlatButton(
          child: new Text('None'),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {},
        ),
        new FlatButton(
          child: new Text('None'),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {},
        )
      ],
    );
  }
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: 
        new CustomPaint(
          painter: new SignaturePainter(_points),
          size: Size.infinite,  
          // size: new Size(10.00, 10.00)
        )
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for(int i = 0; i < points.length - 1; i++) {
      if(points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}