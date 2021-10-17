import 'package:new_project/core/store.dart';
import 'package:new_project/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatlogModel _catalog;

  final List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatlogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatlogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in cart
  List<Items> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Items items;

  AddMutation(this.items);
  @override
  perform() {
    store!.cart._itemIds.add(items.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Items items;

  RemoveMutation(this.items);
  @override
  perform() {
    store!.cart._itemIds.remove(items.id);
  }
}
