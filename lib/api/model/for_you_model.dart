class ForYouModel {
  final String strMeal, strMealThumb, idMeal;

  ForYouModel(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});

  factory ForYouModel.fromJson(Map<String, dynamic> json) {
    return ForYouModel(
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
        idMeal: json['idMeal']);
  }

  Map<String, dynamic> toJson() =>
      {'strMeal': strMeal, 'strMealThumb': strMealThumb, 'idMeal': idMeal};
}
