import "package:calendar/pages/homepage.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context){
    return const GetMaterialApp(
 debugShowCheckedModeBanner: false,
      title:'calendar',
      home:HomePage(),
    );
  }

}