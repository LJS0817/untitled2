import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Provider/Create/CreateInfoProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class CreateTextField extends StatelessWidget {
  String _title = "";
  String _key = "";
  late TextEditingController _controller;
  late FocusNode _focus;
  bool _isNum = false;

  CreateTextField({super.key, String title="", String sKey="", bool isNumber=false}) {
    _title = title;
    _key = sKey;
    _controller = TextEditingController();
    _focus = FocusNode();
    _isNum = isNumber;
  }

  String getData() {
    String str = _controller.text.toString().replaceAll(',', '');
    if(_controller.text.isNotEmpty && _title != "카드명") {
      _controller.text = ConvertValue.costToString(int.parse(str));
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    CreateInfoProvider infoProvider = Provider.of<CreateInfoProvider>(context);
    if(infoProvider.getInfo(_key).isNotEmpty) {
      _controller.text = _title != "카드명" ? ConvertValue.costToString(int.parse(infoProvider.getInfo(_key))) : infoProvider.getInfo(_key);
    }
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
                  infoProvider.setInfo(_key, getData());
                }
              }
            },
            onEditingComplete: () {
              infoProvider.setInfo(_key, getData());
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onSubmitted: (str) {
              infoProvider.setInfo(_key, getData());
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
