import '../entities/entities.dart';
import '../entities/macros_entity.dart';
import 'models.dart';

class Macros {
  int calories;
  int protein;
  int fat;
  int crab;

  Macros(
  {
    required this.calories,
    required this.protein,
    required this.fat,
    required this.crab,
}
      );


  MacrosEntity toEntity(){
    return MacrosEntity(
      calories:calories,
      protein:protein,
      fat:fat,
      crab:crab,
    );
  }

  static Macros  fromEntity(MacrosEntity entity){
    return Macros(
      calories: entity.calories,
      protein: entity.protein,
      fat: entity.fat,
      crab: entity.crab,
    );
  }

}