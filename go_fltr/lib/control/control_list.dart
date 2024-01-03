import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final String npm;
  final String username;
  final String kelas;

  ItemList({required this.npm, required this.username, required this.kelas});
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text(widget.npm),
            subtitle: Text(widget.username),
            trailing: Text(widget.kelas),
          ),
        )
      ],
    );
  }
}
