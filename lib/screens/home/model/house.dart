class HouseModel {
  final String name;
  final String description;
  final String andress;
  final String km;
  final String image;
  final double? price;
  final int? bedroom;
  final int? bathroom;

  HouseModel({
    required this.name,
    required this.description,
    required this.andress,
    required this.km,
    required this.image,
    this.price,
    this.bedroom,
    this.bathroom,
  });
}
