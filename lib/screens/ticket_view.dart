import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_project/utils/app_layout.dart';
import 'package:my_project/utils/app_styles.dart';
import 'package:my_project/widgets/column_layout.dart';
import 'package:my_project/widgets/layout_builder_widget.dart';
import 'package:my_project/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic>ticket;
  final bool? isColor;
  const TicketView({Key? key,required this.ticket, this.isColor}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: GetPlatform.isAndroid==true?167:169,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            /*showing the blue part of the card*/
            Container(
              decoration: BoxDecoration(
                color: isColor==null? Color(0xFF526799):Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),
                topRight:Radius.circular(21))
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'], 
                      style:isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white): Styles.headlineStyle3,
                      ),

                      Expanded(child: Container()),
                      ThickContainer(isColor:true),
                      Expanded(child: Stack(
                        children: [SizedBox(
                        height: 24,
                        child: AppLayoutBuilderWidget(sections: 6,),
                        ), 
                        Center(child:Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color:isColor==null?Colors.white:Color(0xFF8ACCF7),)))
                        ],
                      )),
                    
                      ThickContainer(isColor:true),
                      const Spacer(),

                      Text(ticket['to']['code'], style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3)
                    ],
                  ),

                  const Gap(3),

                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(ticket['from']['name'], style: isColor==null? Styles.headlineStyle4.copyWith(color:Colors.white):Styles.headlineStyle4),
                      ),
                      Text(ticket['flying_time'],style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white): Styles.headlineStyle4,),
                      SizedBox(
                        width: 100,
                        child: Text(ticket['to']['name'], textAlign:TextAlign.end, style: isColor==null? Styles.headlineStyle4.copyWith(color:Colors.white): Styles.headlineStyle4),
                      ),
                    ],
                  )
              ],
              ),
            ),
            /*Showing the orange part of the card */
            Container(
              // color: Styles.orangeColor,
              color: isColor==null? Color(0xFFF37B67): Colors.white,
              child: Row(
                children: [
                   SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor==null? Colors.grey.shade200: Colors.white,
                    borderRadius:const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    ))),
                  ),

                  Expanded(child:Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) { 
                      return Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
                        width: 5,
                        height: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                          color:isColor==null? Colors.white :Colors.grey.shade300,
                        ),
                        ),
                      )),
                    );
                     },
                       
                    ),
                  )),

                   SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor==null? Colors.grey.shade200: Colors.white,
                    borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                    ))),
                  )
              ]),
            ),
            /*SHowing bottom part of ticket*/
            Container(
              decoration: BoxDecoration(
                color: isColor==null?Color(0xFFF37B67):Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(isColor==null?21:0),
                bottomRight:Radius.circular(isColor==null?21:0))
              ),
              padding: const EdgeInsets.only(left:16,top:10, right:16, bottom:16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firstText: ticket['date'],
                       secondText: "Date",
                        alignment: CrossAxisAlignment.start,
                        isColor: isColor,
                        ),
                      AppColumnLayout(firstText:ticket['departure_time'],
                       secondText: "Departure Time",
                        alignment: CrossAxisAlignment.center,
                        isColor: isColor,
                        ),
                      AppColumnLayout(firstText:ticket['number'].toString(),
                       secondText: "Number",
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor,
                        ),
                      
                      
                    ],
                  )
              ]),
            )
        ],
        ),
      ),
    );
  }
}