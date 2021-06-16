import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatlogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatlogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
