import 'package:fooddelivery/services/db_service.dart';
import 'package:mobx/mobx.dart';
import '../cake_item_model/cake_item_model.dart';

part 'cake_item_list_model.g.dart';

class CakeItemListModel = CakeItemListModelBase with _$CakeItemListModel;

abstract class CakeItemListModelBase with Store {
  //all database tasks are managed here upon adding/deleting/updating products
  final DatabaseService _databaseService = DatabaseService();

  @observable
  ObservableList<CakeItemModel> cakeItems = ObservableList<CakeItemModel>();

  @action
  Future<void> fetchProductsFromDatabase() async {
    final List<CakeItemModel> cakeItemsList =
        await _databaseService.getAllProducts();
    cakeItems.clear();
    cakeItems.addAll(cakeItemsList);
  }

  @action
  void addCakeItem(CakeItemModel cakeItem) {
    _databaseService.addProduct(cakeItem);
    cakeItems.add(cakeItem);
  }

  @action
  void removeCakeItem(CakeItemModel cakeItem) {
    cakeItems.remove(cakeItem);
    _databaseService.deleteProduct(cakeItem);
  }

  @action
  void updateCakeItem(CakeItemModel cakeItem) {
    _databaseService.updateProduct(cakeItem); //adding to database
    for (var item in cakeItems) {
      //working in O(n)
      if (item.id == cakeItem.id) {
        cakeItems.remove(item); //working in O(n)
        cakeItems.add(cakeItem);
      }
    }
  }
}
