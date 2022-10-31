import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar(
      {super.key, required this.deviceHeight, required this.deviceWidth});
  final double deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.08,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: deviceWidth * 0.5,
            height: deviceHeight * 0.05,
            child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white24,
                    ),
                    hintStyle: TextStyle(color: Colors.white54),
                    fillColor: Colors.white24,
                    hintText: "Search Audio...")),
          ),
        ],
      ),
    );
  }
}
