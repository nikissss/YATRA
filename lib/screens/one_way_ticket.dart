import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_project/screens/list_flight_screen.dart';
import 'package:my_project/utils/app_layout.dart';
import 'package:my_project/utils/app_styles.dart';

class OneWayTicket extends StatefulWidget {
  const OneWayTicket({super.key});

  @override
  State<OneWayTicket> createState() => _OneWayTicketState();
}

class _OneWayTicketState extends State<OneWayTicket> {
   //create datetime variable
  DateTime _departureDate = DateTime.now();
  //show date picker method
void _showDatePicker(){
  showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime.now(),//DateTime(2023), 
    lastDate: DateTime(2024,1,10)
    ).then((value) {
      
        if(value!= null)
        {
          setState(() {
            if(_isDepartureDateSelected)
            {
              _departureDate = value;
            } else{
              
            }
          });
        }
        // _dateTime = value!;
     
    });
}
bool _isDepartureDateSelected = true;
int _selectedAdultValue=0;
int _selectedChildValue =0;
String countryCode="";
String countryCode1="";
  @override
  Widget build(BuildContext context) { 
    final size=AppLayout.getSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("One-Way-Ticket"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          const Gap(40),
          Text("What are\nyou looking for?",style: Styles.headlineStyle1.copyWith(fontSize: 35)),
          const Gap(40),
          //       //Airline tickets
                Container(
                  width: size.width*.44,
                  height: size.width*0.07,
                  // padding: EdgeInsets.symmetric(vertical:7 ),
                  padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Color(0xFFF4F6FD),
                  ),
                  child:Center(child: Text("Airlines")),
                   
                ),
          const Gap(10),
         Container(
                  width: size.width*.44,
                  height: size.width*0.07,
                  // padding: EdgeInsets.symmetric(vertical:7 ),
                  padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Color(0xFFF4F6FD),
                  ),
                  child:Center(child: Text("One-Way-Tickets")),
                   
                ),
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
          Text(DateFormat('yyyy-MM-dd').format(_departureDate)),
          const Gap(17),
          //button
          MaterialButton(
            onPressed: (){
              setState(() {
                _isDepartureDateSelected =true;
              });
            _showDatePicker();
            },
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

        const Gap(10),
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
          child: ElevatedButton(
            onPressed: () 
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ListFlightScreen(),
               
              ),
              );
            }, 
            child: Container(
              child: Text("Find Ticket"),
            ),
            ),
        ),
       ],
      ),
    );
  }
}