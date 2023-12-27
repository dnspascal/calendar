import "package:calendar/pages/schedule.dart";
import"package:flutter/material.dart";
import "package:get/get.dart";
import "package:table_calendar/table_calendar.dart";
import "../customizable_widgets/appbar.dart";
import "../customizable_widgets/bottom_navigation.dart";


class HomePage extends StatefulWidget{
 const HomePage({super.key});
@override
  State<HomePage> createState() =>_HomePageState();

}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){

   return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(const Schedule()),
       backgroundColor: const Color(0xFFAD794B), tooltip: "add schedule",
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: const Icon(Icons.add),
      ) ,
       appBar: const AppBarClass(),
      body: Center(
        child: Column(
          children:[
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
           ]
        ),
      ),
     bottomNavigationBar: const BottomNavigation(),
    );
  }
}