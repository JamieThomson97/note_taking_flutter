import 'package:VeloGo/presentation/home/widgets/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    double titleBarProportion() => screenHeight * 0.08;
    double carouselProportion() => screenHeight * 0.24;
    double tileProportion() => screenHeight * 0.21;

    final Container listSpacer = Container(
      height: screenHeight * 0.02,
    );

    return Material(
        child: ListView(
      padding: const EdgeInsets.fromLTRB(16, 45, 16, 0),
      children: <Widget>[
        TitleBar(height: titleBarProportion()),
        listSpacer,
        Container(
          height: carouselProportion(),
          color: Colors.amber[700],
          child: const Center(child: Text('Discover Carousel')),
        ),
        listSpacer,
        Container(
          height: tileProportion(),
          color: Colors.amber[600],
          child: const Center(child: Text('Recently Listened')),
        ),
        listSpacer,
        Container(
          height: tileProportion(),
          color: Colors.amber[500],
          child: const Center(child: Text('What we think you\'ll like')),
        ),
        listSpacer,
        Container(
          height: tileProportion(),
          color: Colors.amber[400],
          child: const Center(child: Text('Dope producers')),
        ),
      ],
    ));
  }
}
