import 'package:catlog_app/widgets/home_widget/AddtoCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catlog_app/models/catlog.dart';
import 'package:catlog_app/screens/DetailPage.dart';
import 'package:catlog_app/widgets/home_widget/CatalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile ? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20),
      shrinkWrap: true,
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    ) : ListView.builder(
      shrinkWrap: true,
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog)
            );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  // CatalogItem(this.catalog);
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
          Hero(
              tag: Key(catalog.id.toString()),
              child: Catalogimage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).make(),
              catalog.desc.text.caption(context).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.all(0),
                children: [
                  "\$ ${catalog.price}".text.bold.xl.make(),
                  AddtoCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ).p(context.isMobile ? 0 : 16)
        )
        ];
    return VxBox(
        child: context.isMobile ? Row(
        children: children2,
      ) : Column(
        children: children2,
      )
      ).color(context.cardColor).roundedLg.square(150).make().py12();
  }
}

