import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled2/Mng/DataMng.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  String _title = "";
  CustomTextField(String str, {super.key}) {
    _title = str;
  }

  @override
  Widget build(BuildContext context) {
    //DataMng data = Provider.of<DataMng>(context);
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
            child: TextField(
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: ThemeColor.MainColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              onTap: () {
                log("message");
              },
              onSubmitted: (str) {

              },
              onEditingComplete: () {

              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(4),
                isDense: true,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
                ),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
                ),
                hintText: "PlaceHolder",
                hintStyle: TextStyle(
                  color: ThemeColor.MainColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}