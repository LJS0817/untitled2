import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DismissBackgroundContainer extends StatelessWidget {
  Color _color = Colors.white;
  Color _textColor = Colors.black;
  String _text = "";
  String _iconPath = "";
  DismissBackgroundContainer(Color c, Color t, String str, String path, {super.key}) {
    _color = c;
    _textColor = t;
    _text = str;
    _iconPath = path;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 35,
            height: 35,
            child: SvgPicture.asset(
              _iconPath,
              color: _textColor,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text(
            _text,
            style: TextStyle(
              color: _textColor,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
