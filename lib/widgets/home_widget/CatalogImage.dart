import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogimage extends StatelessWidget {
  final String image;
  const Catalogimage({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
            .box
            .roundedLg
            .p8
            .color(context.canvasColor)
            .make()
            .p16()
            .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20);
  }
}
