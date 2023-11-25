import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_project/utils/app_layout.dart';
import 'package:my_project/utils/app_styles.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Hotel price is ${hotel['price']}'); //esari access garne
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width*0.6,
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Styles.primarycolor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 10,

          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( //image container
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primarycolor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                "assets/images/${hotel['image']}"
              )) 
            ),
          )
        ,
        const Gap(10),
        Text(
          hotel['place'],
          style: Styles.headlineStyle2.copyWith(
            color: Styles.kakiColor,
          )
        ),
        Text(
          hotel['destination'],
          style: Styles.headlineStyle2.copyWith(
            color: Colors.white,
          )
        ),
        const Gap(8),
         Text(
          '${hotel['price']}per night',
          style: Styles.headlineStyle2.copyWith(
            color: Styles.kakiColor,
          )
        ),
        ],
      ),
    );
  }
}