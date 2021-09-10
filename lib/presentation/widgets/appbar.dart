import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/searchScreen.dart';



class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
 final String title;
  CustomAppBar({this.title});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ), onPressed: () {
          Navigator.pop(context);
      },
      ),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: ()=> Navigator.pushReplacementNamed(context, SearchScreen.id),
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
