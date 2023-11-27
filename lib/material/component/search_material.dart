import 'package:flutter/material.dart';

class SearchPersonil extends StatelessWidget {
  const SearchPersonil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Pencarian",
              helperStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),fontSize: 15,
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
      ],
    );
  }
}
