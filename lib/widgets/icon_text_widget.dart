import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_project/utils/app_styles.dart';

abstract class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
   AppIconText({Key? key,required this.icon, required this.text}): super(key : key);
 
}
  @override
//   Widget build(BuildContext context) {
//     return Container(
//           padding: EdgeInsets.symmetric(vertical: 12, horizontal:12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: [
//               Icon(icon, color: Color(0xFFBFC2DF),),
//               const Gap(10),
//               Text(text, style: Styles.textStyle,)
//               ],
//           ),
//         );
//   }
// }
//create datetime variable
  DateTime _dateTime = DateTime.now();
  //show date picker method
// void _showDatePicker(){
//   showDatePicker(
//     context: context, 
//     initialDate: DateTime.now(), 
//     firstDate: DateTime(2023,12,6),//DateTime(2023), 
//     lastDate: DateTime(2024)
//     ).then((value) {
//       setState(() {
//         _dateTime = value!;
//       });
//     });
Widget buildDateTimeContainer(String title, IconData icon, Function onPressed) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Icon(icon, color: Color(0xFFBFC2DF)),
        const Gap(10),
        Text(title, style: Styles.textStyle),
        const Gap(10),
        Column(
          children: [
            // Display chosen date
            Text(DateFormat('yyyy-MM-dd').format(_dateTime)),
            // Button
            MaterialButton(
              onPressed: onPressed(),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text("Choose date"),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
