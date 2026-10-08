class MacrosEntity {
  int calories;
  int protein;
  int fat;
  int crab;

  MacrosEntity({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.crab,
  });

  Map<String, Object?> toDocument (){
    return {
      "calories":calories,
      "protein":protein,
      "fat":fat,
      "crab":crab,



    };
  }
  static MacrosEntity fromDocument(Map<String, dynamic> doc){
    return MacrosEntity(
      calories: (doc['calories'] ?? 0) as int,
      protein: (doc['protein'] ?? 0) as int,
      fat: (doc['fat'] ?? 0) as int,
      crab: (doc['crab'] ?? 0) as int,


    );
  }

}