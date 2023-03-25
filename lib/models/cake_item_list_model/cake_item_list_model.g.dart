// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cake_item_list_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CakeItemListModel on CakeItemListModelBase, Store {
  late final _$cakeItemsAtom =
      Atom(name: 'CakeItemListModelBase.cakeItems', context: context);

  @override
  ObservableList<CakeItemModel> get cakeItems {
    _$cakeItemsAtom.reportRead();
    return super.cakeItems;
  }

  @override
  set cakeItems(ObservableList<CakeItemModel> value) {
    _$cakeItemsAtom.reportWrite(value, super.cakeItems, () {
      super.cakeItems = value;
    });
  }

  late final _$fetchProductsFromDatabaseAsyncAction = AsyncAction(
      'CakeItemListModelBase.fetchProductsFromDatabase',
      context: context);

  @override
  Future<void> fetchProductsFromDatabase() {
    return _$fetchProductsFromDatabaseAsyncAction
        .run(() => super.fetchProductsFromDatabase());
  }

  late final _$CakeItemListModelBaseActionController =
      ActionController(name: 'CakeItemListModelBase', context: context);

  @override
  void addCakeItem(CakeItemModel cakeItem) {
    final _$actionInfo = _$CakeItemListModelBaseActionController.startAction(
        name: 'CakeItemListModelBase.addCakeItem');
    try {
      return super.addCakeItem(cakeItem);
    } finally {
      _$CakeItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCakeItem(CakeItemModel cakeItem) {
    final _$actionInfo = _$CakeItemListModelBaseActionController.startAction(
        name: 'CakeItemListModelBase.removeCakeItem');
    try {
      return super.removeCakeItem(cakeItem);
    } finally {
      _$CakeItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCakeItem(CakeItemModel cakeItem) {
    final _$actionInfo = _$CakeItemListModelBaseActionController.startAction(
        name: 'CakeItemListModelBase.updateCakeItem');
    try {
      return super.updateCakeItem(cakeItem);
    } finally {
      _$CakeItemListModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cakeItems: ${cakeItems}
    ''';
  }
}
