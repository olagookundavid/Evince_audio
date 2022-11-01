import 'package:evince_test/screens.dart/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends ConsumerWidget {
  const TopBar(
      {super.key, required this.deviceHeight, required this.deviceWidth});
  final double deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            width: deviceWidth * 0.8,
            height: deviceHeight * 0.05,
            child: TextField(
              onChanged: (value) {
                ref
                    .read(mainPageDataControllerProvider.notifier)
                    .getAudios(searchTerm: value);
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white24,
                  ),
                  hintStyle: TextStyle(color: Colors.white54),
                  fillColor: Colors.white24,
                  hintText: "Search Audio by title..."),
            ),
          ),
        ],
      ),
    );
  }
}
