import 'package:flutter/cupertino.dart';

class image1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage a=AssetImage("images/simple.jfif");
    Image i=Image(image:a,width: 400,);
    return Container(child: i,) ;
  }

}