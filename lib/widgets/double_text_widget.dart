import 'package:flutter/material.dart';
import '../utils/app_styles.dart';


class AppDoubleTextWidget extends StatelessWidget {
  final String BixText;
  final String SmallText;
  const AppDoubleTextWidget({Key?key,required this.BixText,required this.SmallText}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(BixText,style: Styles.headlineStyle2,
                    ),
                    InkWell(
                      onTap: (){
                        print("You are tapped");
                      },
                      child: Text(SmallText, style: Styles.textStyle.copyWith(color:  Styles.primarycolor))
                      )
                ],
              );
  }
}