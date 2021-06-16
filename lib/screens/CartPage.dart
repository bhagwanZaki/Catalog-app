import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.all(0),
          children: [
            VxConsumer(
              notifications: {},
              mutations: {RemoveMutation},
              builder: (context, store, status) {
                return "\$${_cart.totalprice}".text.xl5.color(context.accentColor).make();
              },
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Feature not available currently".text.make()));
                },
                child: "Buy".text.make(),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                )).wh(130, 40)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl3.color(context.accentColor).make(),
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "No item added in cart".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(CupertinoIcons.checkmark_alt),
              trailing: IconButton(
                icon: Icon(CupertinoIcons.delete),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
