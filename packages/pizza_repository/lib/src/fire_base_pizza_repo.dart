import 'dart:developer';
import 'dart:math' hide log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';

class FireBasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection("pizzas");

  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection
          .get()
          .then(((value) =>
          value.docs.map((e) =>
              Pizza.fromEntity(PizzaEntity.fromDocument(e.data()))
          ).toList()));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

}