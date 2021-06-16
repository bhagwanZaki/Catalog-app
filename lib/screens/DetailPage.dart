import 'package:catlog_app/models/catlog.dart';
import 'package:catlog_app/widgets/home_widget/AddtoCart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatelessWidget {
  final Item catalog;
  const DetailPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.all(0),
            children: [
              "\$ ${catalog.price}".text.bold.xl3.color(context.accentColor).make(),
              AddtoCart(catalog: catalog).wh(130,40)
            ],
          ).p32(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).h32(context).p1(),
            Expanded(
              child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: SingleChildScrollView(
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(context.accentColor).make(),
                        catalog.desc.text.caption(context).xl.make(),
                        10.heightBox,
                        "Tempor vero nonumy justo ipsum stet sadipscing invidunt kasd lorem dolore, ea sadipscing kasd diam lorem. Dolor invidunt ea clita aliquyam diam sed. Elitr voluptua gubergren justo et no sadipscing. Amet ea sanctus takimata dolore eirmod sit. Justo gubergren vero sanctus elitr lorem lorem. Gubergren sea voluptua sanctus takimata erat.".text.caption(context).make().p16()
                      ],
                    ).py32(),  
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
