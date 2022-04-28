import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key, this.height}) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 20.0, 20.0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "< ",
            style: TextStyle(fontSize: height ?? 20),
          ),
          Image.asset(
            "assets/images/flutter.png",
            height: 50,
            width: 50,
          ),
          Text(
            MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
            style: TextStyle(fontSize: height ?? 20),
          )
        ],
      ),
    );
  }
}
