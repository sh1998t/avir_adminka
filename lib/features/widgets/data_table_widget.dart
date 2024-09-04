import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget(
      {super.key,
      this.title,
      this.title1,
      this.title2,
      this.title3,
      this.title4,
      this.title5,
      this.color,
      this.number});
  final String? title;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final String? title5;
  final Color? color;
  final String? number;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Container(
        width: 1300,
        height: 65,
        color: color,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  number ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black38,
              width: 1,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  title ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black38,
              width: 1,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  title1 ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black38,
              width: 1,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  title2 ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black38,
              width: 1,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  title3 ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black38,
              width: 1,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  title4 ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.black38,
              width: 1,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  title5 ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
