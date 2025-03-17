import 'package:flutter/material.dart';

class ResepScreen extends StatelessWidget {
  const ResepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(/*appBar: Placeholder(),*/ body: ListView(children: []));
  }
}

class PilihanResep extends StatelessWidget {
  const PilihanResep({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Colors.white,
      elevation: 4.0,
      child: Row(
        children: [
          Placeholder(),
          Column(children: [Text('Bubur Kecap'), Text('grade A'), Row()]),
        ],
      ),
    );
  }
}
