import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatelessWidget {
  bool isSelected = false;
  String path = "";
  int index = 0;
  bool isTitle = false;

  CustomIconButton(bool b, String str, int idx, {super.key}) {
    isSelected = b;
    path = str;
    index = idx;
    isTitle = !path.contains('/');
  }

  @override
  Widget build(BuildContext context) {
    //DataMng dataMng = Provider.of<DataMng>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: ThemeColor.BackgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: isSelected ? Border.all(color: ThemeColor.MainColor, width: 3) : null,
      ),
      child: isTitle ? Container(
        decoration: BoxDecoration(
          color: ThemeColor.MainColor,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          path,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),
      ) : Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: ThemeColor.MainColor.withOpacity(0.2),
          splashColor: ThemeColor.MainColor.withOpacity(0.3),
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            context.read<CreateUsageProvider>().setData('iconIdx', index.toString());
          },
          borderRadius: BorderRadius.circular(100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: EdgeInsets.all(isSelected ? 12 : 15),
            child: SvgPicture.asset(
              path,
              color: ThemeColor.MainColor,
            ),
          ),
        ),
      ),
    );
  }
}
