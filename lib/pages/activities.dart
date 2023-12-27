import "package:calendar/customizable_widgets/appbar.dart";
import "package:flutter/material.dart";

import "../customizable_widgets/bottom_navigation.dart";

class Activities extends StatefulWidget{
  const Activities({super.key});
  @override
  State<Activities> createState() => _ActivitiesState();
}
class _ActivitiesState extends State<Activities>{
  @override
  Widget build (BuildContext context) => const Scaffold(
    appBar:  AppBarClass(),
    bottomNavigationBar: BottomNavigation(),
  );
  }
