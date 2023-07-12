import 'package:flutter/material.dart';
class LightDesign extends StatelessWidget {
  const LightDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffC2DFD0).withOpacity(0.5),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(200))
        ),
        height: 100,
        width: 150,
      ),);

  }
}
class DarkDesign extends StatelessWidget {
  const DarkDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff6FBF8F).withOpacity(0.5),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(180))
        ),
        height: 70,
        width: 120,
      ),);
  }
}
class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Align(
          alignment:Alignment.topCenter,child: Image.asset("assets/images/logo2.png")),
    );
  }
}

