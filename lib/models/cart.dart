import 'package:catlog_app/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catlog_app/store/store.dart';

class CartModel {
  // catlog field
  late CatlogModel _catlog;

  // priiva item id list
  final List<int> _itemid = [];

  // get catalog
  CatlogModel get catalog => _catlog;

  // set calolog orr inshort making a catalog
  set catalog(CatlogModel newCatlog) {
    assert(newCatlog != null);
    _catlog = newCatlog;
  }

  // List that will return all the items
  List<Item> get items => _itemid.map((id) => _catlog.getById(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
 
  
  // delete items
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    print("invoked");
    store!.cart._itemid.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    print("invoked");
    store!.cart._itemid.remove(item.id);
  }
}
