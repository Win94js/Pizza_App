import 'package:pizza_repository/src/entities/macros_entity.dart';

import '../models/macros.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  double price;
  double discount;
  Macros macros;

  PizzaEntity({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument (){
    return {
      "pizzaId":pizzaId,
      "picture":picture,
      "isVeg":isVeg,
      "spicy":spicy,
      "name":name,
      "description":description,
      "price":price,
      "discount":discount,
      "macros": macros.toEntity().toDocument()  ,



    };
  }
  static PizzaEntity fromDocument(Map<String, dynamic> doc){
    return PizzaEntity(
      pizzaId: doc["pizzaId"] ?? "",
      picture: doc["picture"] ?? "",
      isVeg: doc["isVeg"] ?? false,
      spicy: (doc["spicy"] ?? 0) as int, // 👈 null ဖြစ်နေပါက 0 သတ်မှတ်မည်
      name: doc["name"] ?? "",
      description: doc["description"] ?? "",
      // Firestore မှ int (10) ရောက်လာလည်း double (10.0) ဖြစ်အောင် num ဖြင့် ပြောင်းလဲပေးခြင်း
      price: (doc["price"] as num?)?.toDouble() ?? 0.0,
      discount: (doc["discount"] as num?)?.toDouble() ?? 0.0,
      macros: Macros.fromEntity(
        MacrosEntity.fromDocument(doc["macros"] is Map<String, dynamic> ? doc["macros"] : {}),
      ),
    );
  }

}