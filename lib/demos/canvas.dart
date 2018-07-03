import 'package:flutter/material.dart';

class DemosCanvas extends StatefulWidget {
  @override
  DemosCanvasState createState() => new DemosCanvasState();
}

class DemosCanvasState extends State<DemosCanvas> {
  List<Offset> points = <Offset>[];

  void refurbishPainter() {
    setState(() {
      points.clear();
    });
  }

  void updatePoints(List<Offset> ps) {
    setState(() {
      points = ps;
    });
  }

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
              child: Signature(
                points: points,
                onPointsUpdate: updatePoints,),
              decoration: new BoxDecoration(
                border: new Border.all(width: 4.0, color: Colors.blue),
              ),
            ),
          ),
          new ButtonSection(onRefurbish: refurbishPainter),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final void Function() onRefurbish;

  ButtonSection({Key key, @required this.onRefurbish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FlatButton(
          child: new Text('Refurbish'),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {
            onRefurbish();
          },
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
  final List<Offset> points;
  final void Function(List<Offset>) onPointsUpdate;

  Signature({Key key, this.points: const <Offset>[], @required this.onPointsUpdate}) : super(key: key);

  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  // List<Offset> _points = <Offset>[];
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          widget.onPointsUpdate(new List.from(widget.points)..add(localPosition));
        });
      },
      onPanEnd: (DragEndDetails details) => widget.points.add(null),
      child: 
        new CustomPaint(
          painter: new SignaturePainter(widget.points),
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