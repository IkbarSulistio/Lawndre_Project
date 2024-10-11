import 'package:get/get.dart';

// Item class with observable value
class Item {
  String name;
  RxInt value; // Using RxInt for the observable

  Item({required this.name, int value = 0})
      : value = value.obs; // Initializing value as observable
}

class SelimutCarpetItemController extends GetxController {
  // List of items
  var items = <Item>[
    Item(name: 'Selimut'),
    Item(name: 'Karpet'),
    Item(name: 'Karpet Bulu'),
  ].obs;

  void increaseValue(int index) {
    items[index].value.value++; // Increase the value
  }

  void decreaseValue(int index) {
    if (items[index].value.value > 0) {
      items[index].value.value--; // Decrease the value
    }
  }

  int get totalItems {
    return items.fold(
        0, (sum, item) => sum + item.value.value); // Calculate total
  }
}
