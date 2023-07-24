import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String title;
  final bool selected;

  const TabButton({Key? key, required this.title, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title, style: TextStyle(color: selected ? Colors.black : Colors.grey)),
          ),
          if (selected) Container(height: 2, color: Colors.red),
        ],
      ),
    );
  }
}