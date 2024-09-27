import 'package:flutter/material.dart';
import 'package:untitled2/ThemeColor.dart';

class BottomButton extends StatelessWidget {
  String _title = "";
  bool _swapColor = false;

  late Function _onClicked;

  BottomButton(String str, Function func, {bool swap=false, super.key}) {
    _title = str;
    _onClicked = func;
    _swapColor = swap;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: _swapColor ? null : Border.all(color: ThemeColor.MainColor, width: 3),
          color: _swapColor ? ThemeColor.MainColor : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            highlightColor: _swapColor ? Colors.white.withOpacity(0.3) : ThemeColor.MainColor.withOpacity(0.5),
            splashColor: _swapColor ? Colors.white.withOpacity(0.4) : ThemeColor.MainColor.withOpacity(0.5),
            onTap: () {
              _onClicked();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                _title,
                style: TextStyle(
                  color: _swapColor ? Colors.white : ThemeColor.MainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}
