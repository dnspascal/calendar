 import 'package:calendar/customizable_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../customizable_widgets/bottom_navigation.dart';

class Schedule extends StatefulWidget{

  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context){
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController =  TextEditingController();
    TextEditingController eventController = TextEditingController();
    return  Scaffold(
      appBar: const AppBarClass(),
       body:Center(
                child:Form(
               child: Wrap(
                 direction: Axis.vertical,
                 crossAxisAlignment: WrapCrossAlignment.center,
                 spacing: 18.0,
                 children: [
                 const Text("Create Event",
                     style: TextStyle(color:Color(0xFFAD794B), fontSize: 25.0,
                         fontWeight: FontWeight.w900),),
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.8,
                     height:MediaQuery.of(context).size.height*0.065,
                     child: TextFormField(
                       controller: eventController,
                           decoration:  const InputDecoration(
                             label:  Text("Enter Event Name", style: TextStyle(
                               color: Color(0xFFAD794B)
                             ),),
                               prefixIcon: Icon(Icons.event_note,
                                 color: Color(0xFFAD794B),),
                               enabledBorder:  OutlineInputBorder(
                                    borderSide:  BorderSide(
                                      color:Color(0xFFAD794B),
                                          width:0.7
                                    )
                               ),
                             focusedBorder: OutlineInputBorder(
                                 borderSide:  BorderSide(
                                   color: Color(0xFFAD794B),
                                     width:2.0
                                 )
                             )
                           ),
                     ),
                   ),
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.8,
                     height:MediaQuery.of(context).size.height*0.065,
                     child: TextFormField(
                       controller: dateController,
                       readOnly: true,
                       decoration:  const InputDecoration(
                           label:  Text("Enter Event Date",
                               style: TextStyle(
                               color: Color(0xFFAD794B)
                       )),
                           prefixIcon: Icon(Icons.calendar_month,
                             color: Color(0xFFAD794B),),
                               enabledBorder:  OutlineInputBorder(
                                   borderSide:  BorderSide(
                                       color:Color(0xFFAD794B),
                                       width:0.7
                                   )
                               ),
                               focusedBorder: OutlineInputBorder(
                                   borderSide:  BorderSide(
                                       color: Color(0xFFAD794B),
                                       width:2.0
                                   )
                               )
                       ),
                       onTap: () async {
                         //prevent the keyboard from showing up
                         // FocusScope.of(context).requestFocus( FocusNode());
                         //other code follows
                         DateTime? date = await showDatePicker
                           (
                           context: context, initialDate: DateTime.now(),
                             firstDate: DateTime(2020),
                             lastDate: DateTime(2030),
                             builder:(context, child){
                             return  Theme(
                               data:ThemeData.light().copyWith(
                                 colorScheme:const ColorScheme.light(
                                   primary: Color(0xFFAD794B)
                                 ),
                               ), child: child!,
                             );
                           }
                         );
                         if(date != null){
                           String formattedDate = DateFormat.yMMMMd().format(date);
                           dateController.text = formattedDate;
                         }
                       },
                     ),
                   ),
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.8,
                     height:MediaQuery.of(context).size.height*0.065,
                     child: TextFormField(
                       controller: timeController,
                       readOnly: true,
                       decoration:  const InputDecoration(
                           label:  Text("Enter Event Time", style: TextStyle(
                               color: Color(0xFFAD794B)
                           )),
                           prefixIcon: Icon(Icons.av_timer, color: Color(0xFFAD794B),),
                           enabledBorder:  OutlineInputBorder(
                               borderSide:  BorderSide(
                                   color:Color(0xFFAD794B),
                                   width:0.7
                               )
                           ),
                           focusedBorder: OutlineInputBorder(
                               borderSide:  BorderSide(
                                   color: Color(0xFFAD794B),
                                   width:2.0
                               )
                           )
                       ),
                       onTap: () async {
                         TimeOfDay? time =  await
                         showTimePicker(
                             context: context, initialTime: TimeOfDay.now(),
                           builder: (context, child){
                               return Theme(
                                 data: ThemeData.light().copyWith(
                                   colorScheme: const ColorScheme.light(
                                     primary:Color(0xFFAD794B)
                                   )
                                 ),
                                 child:child!
                               );
                           }
                         );
                         if(time != null && mounted ){
                             String formattedTime = time.format(context);
                             timeController.text = formattedTime;
                         }
                       },
                     ),
                   ),
                  ElevatedButton(onPressed: ()=>{}, style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width*0.8,
                        MediaQuery.of(context).size.height*0.06),
                    backgroundColor: const Color(0xFFAD794B),
                  ),
                    child:  Text("submit".toUpperCase(),
                        style:const TextStyle(
                            fontWeight: FontWeight.bold)
                    ),
                )
                 ],
               ),
       )),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}