import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverCarousel extends StatelessWidget {
  const DiscoverCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            10,
            (index) {
              if (index % 2 == 0)
                return Container(
                  color: Colors.amber,
                  child: Text("Box number ${index / 2}"),
                );
              else
                return const SizedBox(
                  width: 5,
                );
            },
          ),
        ],
      ),
    );
  }
}
