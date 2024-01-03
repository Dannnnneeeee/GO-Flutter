import 'package:flutter/material.dart';
import 'package:go_fltr/utils/device/device.dart';

class Search_Button extends StatefulWidget {
  final String text;
  final Function(String) onTextChanged;
  final IconData? iconData;

  const Search_Button({
    Key? key,
    required this.text,
    required this.onTextChanged,
    this.iconData,
  }) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<Search_Button> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: widget.onTextChanged,
                decoration: InputDecoration(
                  hintText: 'Search in here',
                  border: InputBorder.none,
                ),
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
