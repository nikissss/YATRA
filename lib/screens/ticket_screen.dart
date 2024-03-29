import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_project/screens/ticket_view.dart';
import 'package:my_project/utils/app_info_list.dart';
import 'package:my_project/utils/app_layout.dart';
import 'package:my_project/utils/app_styles.dart';
import 'package:my_project/widgets/column_layout.dart';
import 'package:my_project/widgets/layout_builder_widget.dart';
import 'package:my_project/widgets/ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
 
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children:[ 
          ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const Gap(40),
            Text("Tickets", style: Styles.headlineStyle1,),
            const Gap(20),
            AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
            const Gap(20),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: TicketView(ticket: ticketList[0],isColor: true,),
            ),
            SizedBox(
              height: 1,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Column(
                children: [
                  const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                        firstText: "Flutter DB", 
                        secondText: "Passenger",
                        alignment: CrossAxisAlignment.start,
                        isColor: false,
                        ),
                        AppColumnLayout(
                        firstText: "5221 708996", 
                        secondText: "Passport",
                        alignment: CrossAxisAlignment.end,
                        isColor: false,
                        ),
                    ],
                  ),
                 Gap(20),
                 AppLayoutBuilderWidget(sections: 15,isColor: false, width: 5,),
                    Gap(20),
                    const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                        firstText: "65687623 4269284762", 
                        secondText: "Number of E-ticket",
                        alignment: CrossAxisAlignment.start,
                        isColor: false,
                        ),
                        AppColumnLayout(
                        firstText: "B2S228", 
                        secondText: "Booking Code",
                        alignment: CrossAxisAlignment.end,
                        isColor: false,
                        ),
                    ],
                  ),
                  const Gap(20),
                   AppLayoutBuilderWidget(sections: 15,isColor: false, width: 5,),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/visa.png", scale:15),
                              Text(" *** 2462", style: Styles.headlineStyle3,)
                            ],
                          ), 
                          Gap(5),
                          Text("Payment method", style: Styles.headlineStyle4,)
                        ],
                      ),
                   const AppColumnLayout(
                        firstText: "\$249.9", 
                        secondText: "Price",
                        alignment: CrossAxisAlignment.end,
                        isColor: false,
                        ),
                    ],
                  ),
                  const SizedBox(height: 1,),
                ],
              ),
            ),
           
           //barcode
            const SizedBox(height:1),
            Container(
              
              decoration: const BoxDecoration(
                color:Colors.white ,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(21),
                  bottomLeft: Radius.circular(21),
                  
                )
              ),
              margin: EdgeInsets.only(left:15, right:15),
              padding: EdgeInsets.only(top:20, bottom: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(15),
                  child: BarcodeWidget(
                    data: 'https://github.com/martinovovo', 
                    barcode: Barcode.code128(),
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height:70
                    ),
                ),
              ),
            ),

            Gap(20),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: TicketView(ticket: ticketList[0]),
            ),
          ],
        ),
        Positioned(
          left: 24,
          top:295,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor, width:2)
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        ),
        Positioned(
          right: 24,
          top:295,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor, width:2)
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        )
        ]
      ),
    );
  }
}