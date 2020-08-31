import 'dart:async';

import 'package:flutter/material.dart';

class Incrementable extends StatefulWidget {
  final double limitUp;
  final double limitDown;
  final TextEditingController textController;
  Incrementable(this.limitUp, this.limitDown, this.textController);

  @override
  _IncrementableState createState() => _IncrementableState();
}

class _IncrementableState extends State<Incrementable> {
  double value = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    widget.textController.text = '$value';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Direccion: ', style: TextStyle(fontSize: 20)),
        SizedBox(width: 10),
        Container(
          width: 100,
          child: TextField(
            style: TextStyle(fontSize: 20),
            enabled: false,
            textAlign: TextAlign.center,
            controller: widget.textController,
          ),
        ),
        Text('Grados', style: TextStyle(fontSize: 20)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_drop_up, size: 50),
              onTap: () {
                if (value < widget.limitUp) {
                  value += 0.1;
                  widget.textController.text =
                      '${value.toStringAsPrecision(3)}';
                  value = double.parse(value.toStringAsPrecision(3));
                }
              },
              onLongPress: () {
                timer = Timer.periodic(Duration(milliseconds: 10), (t) {
                  if (value < widget.limitUp) {
                    value += 0.1;
                    widget.textController.text =
                        '${value.toStringAsPrecision(3)}';
                    value = double.parse(value.toStringAsPrecision(3));
                  }
                });
              },
              onLongPressUp: () {
                timer.cancel();
              },
              onLongPressEnd: (v) {
                timer.cancel();
              },
            ),
            GestureDetector(
              child: Icon(Icons.arrow_drop_down, size: 50),
              onTap: () {
                if (value > widget.limitDown) {
                  value -= 0.2;
                  widget.textController.text =
                      '${value.toStringAsPrecision(3)}';
                  value = double.parse(value.toStringAsPrecision(3));
                }
              },
              onLongPress: () {
                timer = Timer.periodic(Duration(milliseconds: 10), (t) {
                  if (value > widget.limitDown) {
                    value -= 0.2;
                    widget.textController.text =
                        '${value.toStringAsPrecision(3)}';
                    value = double.parse(value.toStringAsPrecision(3));
                  }
                });
              },
              onLongPressUp: () {
                timer.cancel();
              },
              onLongPressEnd: (v) {
                timer.cancel();
              },
            ),
          ],
        ),
       
        
      ],
    );
  }
}
