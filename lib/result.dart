import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.result});
  final String result;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  'Wynik: '),
            ),
            Center(
              child: Text(
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  widget.result),
            ),
          ],
        ),
      ),
    );
  }
}
