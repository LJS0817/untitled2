import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class CreateTextField extends StatelessWidget {
  String _title = "";
  late TextEditingController _controller;
  late FocusNode _focus;
  bool _isNum = false;

  CreateTextField({super.key, String title="", bool isNumber=false}) {
    _title = title;
    _controller = TextEditingController();
    _focus = FocusNode();
    _isNum = isNumber;
  }

  String getData() {
    String str = _controller.text.toString();
    if(_controller.text.isNotEmpty && _title != "카드명") {
      _controller.text = ConvertValue.costToString(int.parse(str.replaceAll(',', '')));
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            focusNode: _focus,
            onTapOutside: (e) {
              if(FocusManager.instance.primaryFocus?.parent != null) {
                if(_focus == FocusManager.instance.primaryFocus) {
                  // appMng.setInfo(_title, getData());
                }
              }
            },
            onEditingComplete: () {
              // appMng.setInfo(_title, getData());
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onSubmitted: (str) {
              // appMng.setInfo(_title, getData());
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onTap: () {
              _controller.text = _controller.text.replaceAll(',', '');
            },
            cursorColor: ThemeColor.MainColor,
            autocorrect: false,
            keyboardType: _isNum ? TextInputType.number : TextInputType.text,
            inputFormatters: _isNum ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ] : [],
            decoration: InputDecoration(
              labelText: _title,
              labelStyle: const TextStyle(
                color: ThemeColor.TextColorGrey
              ),
              floatingLabelStyle: const TextStyle(
                color: ThemeColor.MainColor
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ThemeColor.MainColor,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ThemeColor.MainColor,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside
                )
              ),
              isDense: true,
            ),
            style: const TextStyle(
              color: ThemeColor.MainColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
