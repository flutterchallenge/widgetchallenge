import 'package:flutter/material.dart';

/**
 * @author: Yubaraj Poudel
 * @Since: 05/05/2019
 */

//Spacer example
class AlignmentWithSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Alligment with Spacer"),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Row(children: [
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Spacer(), // default flex is 1
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Spacer(
                flex: 2,
              ), // flex is 2
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              )
            ])));
  }
}

//Allignment example
class RowColumnAlignment extends StatelessWidget {
  List colors = [Colors.teal, Colors.red, Colors.blue];

  _sampleWidget() => List<Widget>.generate(colors.length, (index) {
        return new Container(
          color: colors[index],
          height: 50,
          width: 50,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Spacer and alignment"),
        ),
        body: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    "Items are evenly distributed in the line with equal space around them (space around)"),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _sampleWidget()),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    "Items Spread across the screen however keeps equal space in  between (space between)"),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _sampleWidget()),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    "items are distributed so that the spacing between any two adjacent alignment subjects, before the first alignment subject, and after the last alignment subject is the same (Space evenly)"),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _sampleWidget()),
              ],
            )));
  }
}
