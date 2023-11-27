import 'package:sdirbinsen/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          Expanded(child: SearchField()),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileInfo()
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Pencarian",
              helperStyle: TextStyle(
                color: Colors.black,fontSize: 15,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
              ),
              prefixIcon: Icon(Icons.search,color: Colors.grey.withOpacity(0.5),)
          ),
        ),
        // SizedBox(height: 20),
        // Text("Dashboard",
        // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        // )
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/icons/Bell.svg",
                    height: 25,
                    color: merahColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16.0),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0 / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/images/Ahmad.jpg',
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              if(!Responsive.isMobile(context))
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0 / 2),
                  child: Text('Hi, Ahmad Fauzi Lubis',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),),
                )
            ],
          ),
        )
      ],
    );
  }
}
