import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.blue,
      ),
      elevation: 0,
      title: Text(
        'Weather',
        style: TextStyle(color: Colors.blue),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
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
