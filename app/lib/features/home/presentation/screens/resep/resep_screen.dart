import 'package:flutter/material.dart';

class ResepScreen extends StatelessWidget {
  const ResepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: []));
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
            child: Row(
              children: [
                Icon(Icons.search),
                Text(
                  'Cari',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(147, 147, 147, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
