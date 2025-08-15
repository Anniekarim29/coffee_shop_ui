class Coffee {
  final String name;
  final double price;
  final double rating;
  final String image;
  final String description;
  final List<String> brewingSteps;

  Coffee({
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
    required this.description,
    required this.brewingSteps,
  });
}

class SpecialOffer {
  final String name;
  final double price;
  final double originalPrice;
  final String image;

  SpecialOffer({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.image,
  });
}