
import 'package:calendar/pages/activities.dart';
import 'package:calendar/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget{
  const BottomNavigation({super.key});

  @override
   State<BottomNavigation> createState () => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation>{
  int selectedIndex = 0;
  void _onDestinationSelected(int index){
    if(index == 0){
      Get.to(const HomePage());
    }else if (index == 1){
      Get.to(const Activities());
    }
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return  NavigationBarTheme(
      data:  NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        labelTextStyle:
         MaterialStateProperty.resolveWith<TextStyle>((states)
    {
      if (states.contains(MaterialState.selected)) {
        return (
             TextStyle(
                color: Colors.white.withOpacity(0.2),
                fontWeight: FontWeight.bold,
                fontSize: 18.0
            )
        );
      } else {
        return (
            const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0
            )
        );
      }
    }),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
              return
              states.contains(MaterialState.selected)
                  ?
               const IconThemeData(
                  color: Colors.white,
                      opacity:0.20,
              )
                  :
              const IconThemeData(
                  color:Colors.white
              );
            })
      ),

      child: NavigationBar(
        onDestinationSelected: _onDestinationSelected,
          selectedIndex:selectedIndex,
        backgroundColor:const Color(0xFFAD794B),
          height: MediaQuery.of(context).size.height*0.1,
          destinations: const [
        NavigationDestination(
              icon:Icon(Icons.home),
              label: "Home"
          ),
            NavigationDestination(
                icon:Icon(Icons.list_alt),
                label: "Schedule",

            )
      ]),
    );
  }
}