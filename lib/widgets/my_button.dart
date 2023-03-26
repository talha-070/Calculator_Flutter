import 'package:flutter/material.dart';

import '../constant.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const MyButton({Key? key,
    this.title = '',
    this.color = Colors.grey,
    required this.onpress
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
      child: InkWell(
        onTap: onpress,
        child: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(child: Text(title, style: const TextStyle(fontSize: 20,color: buttonColor))),
        ),
      ),
    );
  }
}
