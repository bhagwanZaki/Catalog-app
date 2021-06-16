import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/models/catlog.dart';
import 'package:catlog_app/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isIncart = _cart.items.contains(catalog);
    return ElevatedButton(
        child: isIncart
            ? Icon(CupertinoIcons.checkmark_alt)
            : Icon(Icons.add_shopping_cart_sharp),
        onPressed: () {
          if (!isIncart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        ));
  }
}
