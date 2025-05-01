import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class CustomTextField extends StatelessWidget {
  String _title = "";
  String _key = '';
  TextEditingController _controller = TextEditingController();

  CustomTextField(String str, String sKey, {super.key}) {
    _title = str;
    _key = sKey;
  }

  @override
  Widget build(BuildContext context) {
    CreateUsageProvider data = Provider.of<CreateUsageProvider>(context);
    _controller.text = _key == "cost" ? ConvertValue.costToString(int.parse(data.getData(_key))) : data.getData(_key);
    return Container(
      height: 85,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              _title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            alignment: Alignment.centerLeft,
            child: Focus(
              onFocusChange: (focus) {
                if(!focus) {
                  data.setData(_key, _controller.text);
                  if(_key == 'cost') {
                    data.setData('remain', (context.read<InfoMng>().getCurrentData().getMoney() - int.parse(_controller.text)).toString());
                  }
                }
                log(_controller.text.toString());
              },
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: ThemeColor.MainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                onTap: () {
                  log("message");
                  _controller.text = _controller.text.replaceAll(',', '');
                },
                keyboardType: _key == 'cost' ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(4),
                  isDense: true,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
                  ),
                  hintText: _title,
                  hintStyle: TextStyle(
                    color: ThemeColor.MainColor.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}