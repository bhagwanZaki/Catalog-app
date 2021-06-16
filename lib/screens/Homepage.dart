import 'dart:convert';
import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/models/catlog.dart';
import 'package:catlog_app/store/store.dart';
import 'package:catlog_app/utils/Routes.dart';
import 'package:catlog_app/widgets/home_widget/CatalogList.dart';
import 'package:catlog_app/widgets/home_widget/Catalogheader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    //loading data to string
    await Future.delayed(Duration(seconds: 2));
    // var catlogjson = await rootBundle.loadString("assets/files/catlog.json");
    var response = await http.get(Uri.parse(url));
    final catlogjson = response.body;
    // decoding it back to json
    var decodeddata = jsonDecode(catlogjson);
    // now taking all the products
    var productData = decodeddata["products"];
    CatlogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
        floatingActionButton: VxBuilder(
          builder: (context, store, status) {
            return FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              child: Icon(CupertinoIcons.cart),
              backgroundColor: context.theme.buttonColor,
            ).badge(
                color: Vx.red500,
                size: 25,
                count: _cart.items.length,
                textStyle: TextStyle(fontSize: 15));
          },
          mutations: {AddMutation, RemoveMutation},
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatlogHeader(),
                if (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
