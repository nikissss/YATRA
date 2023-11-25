import 'package:flutter/material.dart';
import 'package:my_project/utils/app_layout.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({Key? key,required this.firstTab, required this.secondTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
          child:Container(
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Color(0xFFF4F6FD),
            ),
            child: Row(
              children: [
                //Airline tickets
                Container(
                  width: size.width*.44,
                  padding: EdgeInsets.symmetric(vertical:7 ),
                  decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left:Radius.circular(50)),
              color: Colors.white,
                  ),
                  child:Center(child: Text(firstTab)),
                ),

                //hotels
                Container(
                  width: size.width*.44,
                  padding: EdgeInsets.symmetric(vertical:7 ),
                  decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(right:Radius.circular(50)),
              color: Colors.transparent,
                  ),
                  child:Center(child: Text(secondTab)),
                ),
                
              ],
            ),
          )
          );
  }
}