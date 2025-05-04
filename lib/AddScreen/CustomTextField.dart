import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(String str, String sKey, {super.key}) {
    _title = str;
    _key = sKey;
  }

  String _title = "";
  String _key = '';
  bool _hasFocus = false;
  final TextEditingController _controller = TextEditingController();

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    CreateUsageProvider data = Provider.of<CreateUsageProvider>(context);
    widget._controller.text = widget._key == "cost" ? data.getData(widget._key) == '0' ? "" : ConvertValue.costToString(int.parse(data.getData(widget._key))) : data.getData(widget._key);
    return AnimatedContainer(
      duration: 100.ms,
      height: 85,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: widget._hasFocus ? Border.all(color: ThemeColor.MainColor, width: 3) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget._title,
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
                  setState(() {
                    log(widget._title + "    " + focus.toString());
                    widget._hasFocus = focus;
                  });
                  if(!focus) {
                    data.setData(widget._key, widget._controller.text);
                    if(widget._key == 'cost') {
                      data.setData('remain', (context.read<InfoMng>().getCurrentData().getMoney() - int.parse(widget._controller.text)).toString());
                    }
                  }
                },
                child: TextField(
                  controller: widget._controller,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: ThemeColor.MainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  onTap: () {
                    log("message");
                    widget._controller.text = widget._controller.text.replaceAll(',', '');
                  },
                  keyboardType: widget._key == 'cost' ? TextInputType.number : TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(4),
                    isDense: true,
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
                    ),
                    hintText: widget._title,
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


// class CustomTextField extends StatelessWidget {
//   String _title = "";
//   String _key = '';
//   bool _hasFocus = false;
//   final TextEditingController _controller = TextEditingController();
//
//   CustomTextField(String str, String sKey, {super.key}) {
//     _title = str;
//     _key = sKey;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CreateUsageProvider data = Provider.of<CreateUsageProvider>(context);
//     _controller.text = _key == "cost" ? data.getData(_key) == '0' ? "" : ConvertValue.costToString(int.parse(data.getData(_key))) : data.getData(_key);
//     return Container(
//       height: 85,
//       margin: const EdgeInsets.only(top: 20),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               _title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17,
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
//             alignment: Alignment.centerLeft,
//             child: Focus(
//               onFocusChange: (focus) {
//                 _hasFocus = focus;
//                 if(!focus) {
//                   data.setData(_key, _controller.text);
//                   if(_key == 'cost') {
//                     data.setData('remain', (context.read<InfoMng>().getCurrentData().getMoney() - int.parse(_controller.text)).toString());
//                   }
//                 }
//               },
//               child: TextField(
//                 controller: _controller,
//                 textAlign: TextAlign.right,
//                 style: const TextStyle(
//                   color: ThemeColor.MainColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//                 onTap: () {
//                   log("message");
//                   _controller.text = _controller.text.replaceAll(',', '');
//                 },
//                 keyboardType: _key == 'cost' ? TextInputType.number : TextInputType.text,
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.all(4),
//                   isDense: true,
//                   enabledBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(width: 2, color: ThemeColor.MainColor)
//                   ),
//                   hintText: _title,
//                   hintStyle: TextStyle(
//                     color: ThemeColor.MainColor.withOpacity(0.5),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             )
//           ),
//         ],
//       ),
//     );
//   }
// }