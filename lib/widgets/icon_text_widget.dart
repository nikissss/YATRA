import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_project/utils/app_styles.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppIconText({Key? key,required this.icon, required this.text}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal:12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFFBFC2DF),),
              const Gap(10),
              Text(text, style: Styles.textStyle,)
              ],
          ),
        );
  }
}