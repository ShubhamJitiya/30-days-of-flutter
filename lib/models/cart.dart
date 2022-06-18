import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //Catalog field
  CatalogModel? _catalog;

  //Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel? get catalog => _catalog;

  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (totalPrice, current) => totalPrice + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.remove(item.id);
  }
}
