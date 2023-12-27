import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget implements PreferredSizeWidget{
  const AppBarClass({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
            "Calendar", style: TextStyle(
            fontWeight:FontWeight.w900,
            letterSpacing:3.0,
            fontSize: 30.0,
          color: Colors.white
        ),
        ),
        centerTitle: true,
        backgroundColor:  const Color(0xFFAD794B),
      actions:  [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(onPressed: () {  },
          icon:const Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}