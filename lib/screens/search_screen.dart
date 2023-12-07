import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_project/screens/chosehotel_screen.dart';
import 'package:my_project/screens/payment.dart';
import 'package:my_project/utils/app_layout.dart';
import 'package:my_project/utils/app_styles.dart';
import 'package:my_project/widgets/double_text_widget.dart';
import 'package:my_project/widgets/icon_text_widget.dart';
import 'package:my_project/widgets/ticket_tabs.dart';

class SearchScreen extends StatefulWidget {
   const SearchScreen({super.key});
  
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //create datetime variable
  DateTime _dateTime = DateTime.now();
  //show date picker method
void _showDatePicker(){
  showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2023,12,6),//DateTime(2023), 
    lastDate: DateTime(2024)
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
}
int _selectedAdultValue=0;
int _selectedChildValue =0;
String countryCode="";
String countryCode1="";
  @override
  Widget build(BuildContext context) {
    final size=AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          const Gap(40),
          Text("What are\nyou looking for?",style: Styles.headlineStyle1.copyWith(fontSize: 35)),
          const Gap(40),
          const AppTicketTabs(firstTab: "Airline Tickets", secondTab: "Hotels",),

          const Gap(20),
          const AppTicketTabs(firstTab: "Two-way ticket", secondTab: "One-way ticket",)
        ,
        const Gap(10),
        Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      
      
      Row(
        children: [
          
          Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
      // const Gap(10), 
          //button
          TextButton(
            onPressed: (){
              showCountryPicker(
                context: context, 
                countryListTheme: CountryListThemeData(
                  inputDecoration: InputDecoration(
                    hintText: "Type your destination",
                    labelText: "Search"
                  )
                ),
                onSelect: (Country value){
                  countryCode = value.name.toString();
                  setState(() {
                    
                  });
                }
                );
            }, 
            child: Text(countryCode.toString())
            ),
          
          const Gap(130),
            Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
            TextButton(
            onPressed: (){
              showCountryPicker(
                context: context, 
                countryListTheme: CountryListThemeData(
                  inputDecoration: InputDecoration(
                    hintText: "Type your destination",
                    labelText: "Search"
                  )
                ),
                onSelect: (Country value){
                  countryCode1 = value.name.toString();
                  setState(() {
                    
                  });
                }
                );
            }, 
            child: Text(countryCode1.toString())
            ),
          
        ],
      ),
    ],
  ),
),
        const Gap(10),
        // AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure",),
        Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      
      Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
      const Gap(10),
      Text("Departure", style: Styles.textStyle),
      const Gap(30),  // Add a gap or SizedBox as needed
      Row(
        children: [
          //display chosen date
          // Text(_dateTime.month.toString()),
          Text(DateFormat('yyyy-MM-dd').format(_dateTime)),
          const Gap(17),
          //button
          MaterialButton(
            onPressed: _showDatePicker,
            child: Padding(
              padding: EdgeInsets.all(6.0),
            child: Text("Choose date"),
          )
          ),
        ],
      ),
    ],
  ),
),

        const Gap(15),
        //AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
         Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
      const Gap(10),
      Text("Arrival", style: Styles.textStyle),
      const Gap(55),  // Add a gap or SizedBox as needed
      Row(
        children: [
          //display chosen date
          // Text(_dateTime.toString()),
          Text(DateFormat('yyyy-MM-dd').format(_dateTime)),
          const Gap(17),
          //button
          MaterialButton(
            onPressed: _showDatePicker,
            child: Padding(
              padding: EdgeInsets.all(6.0),
            child: Text("Choose date"),
          )
          ),
        ],
      ),
    ],
  ),
),
        const Gap(15),
       // AppIconText(icon:Icons.people_alt_rounded, text:"No. of people"),
        Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      Icon(Icons.people_alt_rounded, color: Color(0xFFBFC2DF)),
      const Gap(10),
      Text("No. of people", style: Styles.textStyle),
      const Gap(30),  
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton.filled(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: Text("Adult = $_selectedAdultValue"), 
            onPressed: () => showCupertinoModalPopup(
              context: context, 
              builder: (_) => SizedBox(
                width: double.infinity,
                height:250,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 30,
                  scrollController:FixedExtentScrollController(
                    initialItem: 0,
                    ),
                    children: const[
                      Text('0'),
                      Text('1'),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                      Text('5'),
                    ],
                    onSelectedItemChanged: (int value) {
                      setState(() {
                        _selectedAdultValue= value;
                      });
                    },
                ),
              ),
            ),
              ),
              const Gap(5),
              CupertinoButton.filled(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: Text("Children = $_selectedChildValue"), 
            onPressed: () => showCupertinoModalPopup(
              context: context, 
              builder: (_) => SizedBox(
                width: double.infinity,
                height:250,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 30,
                  scrollController:FixedExtentScrollController(
                    initialItem: 0,
                    ),
                    children: const[
                      Text('0'),
                      Text('1'),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                      Text('5'),
                    ],
                    onSelectedItemChanged: (int value1) {
                      setState(() {
                        _selectedChildValue= value1;
                      });
                    },
                ),
              ),
            ),
              ),
        ],
      )
    ],

  ),
),
        const Gap(15),

        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal:12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(
              0xD91130CE
            )

          ),
          child: Center(
            child: Text(
                  "Find Tickets",
                  style: Styles.textStyle.copyWith(color: Colors.white,),
                ),
          )
        )
        ,
        const Gap(20),
        InkWell(
           onTap: () {
      // Navigate to the Payment page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Payment(),
        ),
      );
    },
            child: Center(
              child: Text(
                "Proceed with payment",
                style: Styles.textStyle.copyWith(
                  color: Styles.primarycolor,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          const Gap(40),
       

        AppDoubleTextWidget(BixText: "Upcoming Flights", SmallText: "View All"),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 400,
              width: size.width*0.42,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12) ,
                      image: const DecorationImage(
                      image: AssetImage(
                         "assets/images/engfeather.png"
                        )
                        )
                    ),
                  ),
                  const Gap(12),
                  Text(
              "20% discount on the early booking. Don't miss out the chance",
              style: Styles.headlineStyle2
            )
              ]),
            ),

            Column(
              children: [
                Stack(
                  children: [
                    Container(
                  width: size.width*0.44,
                  height: 174,
                  
                  decoration: BoxDecoration(
                    color: Color(0xFF3AB8B8),
                    borderRadius: BorderRadius.circular(18)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Discount \nFor Survey", style: Styles.headlineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                      const Gap(10),
                      Text("Take the survey about our services and get discount", style: Styles.headlineStyle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white,fontSize:18)),
                    ],
                  ),
                ),
                Positioned(right:-45,
                top: -40,
                  child: 
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width:18, color: Color(0xFF189999)),
                    color: Colors.transparent,
                  ),
                ),)
                ],
                )
              ,
              const Gap(15),
              Container(
                width: size.width*0.44,
                height: 210,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFFEC6545)
                ),
                child: Column(
                  children: [
                    Text("Take Love", style: Styles.headlineStyle2.copyWith(color: Colors.white,fontWeight:FontWeight.bold,),textAlign:TextAlign.center ),
                    const Gap(5),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '<3',
                            style: TextStyle(fontSize: 38)
                          ),
                          TextSpan(
                            text: '<3',
                            style: TextStyle(fontSize: 50)
                          ),
                          TextSpan(
                            text: '<3',
                            style: TextStyle(fontSize: 38)
                          )
                        ]
                      )
                    )
                  ],
                ),
              )
              ],
            )
            
          ],
        )
        ],
      ),
    );
  }
}