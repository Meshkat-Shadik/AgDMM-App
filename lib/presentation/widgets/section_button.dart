import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  const SectionButton({
    Key? key,
    required this.path,
    required this.title,
  }) : super(key: key);

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            path,
          ),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
