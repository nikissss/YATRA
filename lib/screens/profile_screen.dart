import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:my_project/screens/bottom_bar.dart';
// import 'package:my_project/screens/payment.dart';
import 'package:my_project/utils/app_styles.dart';
import 'package:my_project/widgets/column_layout.dart';
import 'package:my_project/widgets/layout_builder_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Gap(40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 86,
                 width: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/engfeather.png"
                      )
                      )
                ),
              )
            ,
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Book Tickets", style: Styles.headlineStyle1,),
                Gap(2),
                Text("New-York", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500
                ),
                ),
                Gap(8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFFFEF4F3),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 3,vertical: 3),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                    color: Color(0xFF526799)
                  ),
                  child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                  color: Colors.white,
                  size: 15,
                  ),
                      ),
                      Gap(5),
                      const Text("Premium Status",style: TextStyle(
                        color: Color(0xFF526799),
                        fontWeight:FontWeight.w600,
                      ),
                      ),
                      Gap(5),
                    ],
                  ),
                ),
                
              ],
            )
            ,
            const Spacer(),
            Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print("You are tapped");
                      },
                      child: Text(
                        "Edit",
                        style: Styles.textStyle.copyWith(color: Styles.primarycolor, fontWeight: FontWeight.w300),))
                  ],
                )
            ],
          ),
          Gap(8),
          Divider(color: Colors.grey.shade300,),
          Gap(8),
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primarycolor,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              Positioned(
                right: -45,
                top: -40,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width:18, color: Color(0xFF264CD2))
                  ),
                  padding: EdgeInsets.all(30),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: Styles.primarycolor,
                        size: 27,
                      ),
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                    ),
              
                    Gap(12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You've got a new award",
                        style: Styles.headlineStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                        Text("You've had 95 flights in a year",
                        style: Styles.headlineStyle2.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16
                        ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
          ,
          Gap(25),
          Text("Accumulated miles", style: Styles.headlineStyle2,),
          Gap(20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Styles.bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ]
            ),
            child: Column(
              children: [
                Gap(15),
                Text("192802",
                style: TextStyle(
                  fontSize: 45,
                  color: Styles.textColor,
                  fontWeight: FontWeight.w600
                ),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles", style: Styles.headlineStyle4.copyWith(fontSize: 16),),
                     Text("11 June 2023", style: Styles.headlineStyle4.copyWith(fontSize: 16),),
                  ],
                ),
                Gap(4),
                Divider(color: Colors.grey.shade300,),
                Gap(4),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(
                      firstText: "23 042",
                     secondText: "Miles",
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                      ),
                       AppColumnLayout(
                      firstText: "Airline CO",
                     secondText: "Received From",
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                      ),
                  ],
                ),
                Gap(12),
                const AppLayoutBuilderWidget(sections: 12, isColor: false,),
                Gap(12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(
                      firstText: "24", 
                      secondText: "Miles", 
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                      ),
                      AppColumnLayout(
                      firstText: "Mc. Donalds", 
                      secondText: "Received from", 
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                      )
                  ],
                ),
                Gap(12),
                const AppLayoutBuilderWidget(sections: 12, isColor: false,),
                Gap(12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(
                      firstText: "53 340", 
                      secondText: "Miles", 
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                      ),
                      AppColumnLayout(
                      firstText: "Exuma", 
                      secondText: "Received from", 
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                      )
                  ],
                )
              ],
            ),
          ),
          Gap(25),
          InkWell(
           onTap: () {
      // // Navigate to the OpenHotelScreen page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Payment(),
      //   ),
      // );
    },
    
            child: Center(
              child: Text(
                "How to get more miles",
                style: Styles.textStyle.copyWith(
                  color: Styles.primarycolor,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}