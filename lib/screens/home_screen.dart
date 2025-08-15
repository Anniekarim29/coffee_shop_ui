import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'product_details_screen.dart';
import '../models/coffee_model.dart';
import 'cart_screen.dart';
import 'profile_screen.dart'; // ✅ Import your profile screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  bool isLoading = true;

  List<Coffee> cartItems = []; // Cart list

  final List<String> categories = [
    'Espresso',
    'Cold brew',
    'Cappuccino',
    'Latte'
  ];

  final List<Coffee> coffees = [
    Coffee(
      name: 'Espresso',
      price: 5.96,
      rating: 4.8,
      image: 'assets/images/express.jpg',
      description: 'Espresso is a concentrated coffee beverage that originated in Italy.',
      brewingSteps: [
        'Espresso is made by forcing hot water through finely-ground coffee beans under high pressure.',
      ],
    ),
    Coffee(
      name: 'Cappuccino',
      price: 6.50,
      rating: 4.6,
      image: 'assets/images/cappu.jpg',
      description: 'Rich and bold Cappuccino with perfect foam.',
      brewingSteps: [
        'Grind coffee beans to fine consistency.',
        'Tamp the grounds evenly in the portafilter.',
        'Extract for 25-30 seconds.',
      ],
    ),
    Coffee(
      name: 'Latte',
      price: 6.20,
      rating: 4.5,
      image: 'assets/images/pic1.jpg',
      description: 'Smooth and creamy Latte to kickstart your day.',
      brewingSteps: [
        'Steam the milk to a creamy texture.',
        'Pour over freshly brewed espresso.',
      ],
    ),
    Coffee(
      name: 'Mocha',
      price: 6.80,
      rating: 4.7,
      image: 'assets/images/pic2.jpg',
      description: 'Delicious Mocha with chocolate and espresso blend.',
      brewingSteps: [
        'Mix chocolate syrup with espresso.',
        'Add steamed milk and top with whipped cream.',
      ],
    ),
  ];

  final List<SpecialOffer> specialOffers = [
    SpecialOffer(
      name: 'Hamburger',
      price: 16.55,
      originalPrice: 20.99,
      image: 'assets/images/burger.jpg',
    ),
    SpecialOffer(
      name: 'Sandwiches with French Fries',
      price: 11.55,
      originalPrice: 15.99,
      image: 'assets/images/sandwich.jpg',
    ),
    SpecialOffer(
      name: 'Chocolate Muffin',
      price: 5.50,
      originalPrice: 7.00,
      image: 'assets/images/image1.jpg',
    ),
    SpecialOffer(
      name: 'Fruit Donut',
      price: 4.80,
      originalPrice: 6.50,
      image: 'assets/images/image2.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                        ),
                        const Text(
                          'Coffee Lover',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(cartItems: cartItems),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            if (cartItems.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  cartItems.length.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Search your coffee...',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 50,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryChip(categories[index], index == selectedCategoryIndex);
                  },
                ),
              ),

              const SizedBox(height: 25),

              // Popular Coffee
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Popular Coffee',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 280,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: coffees.length,
                  itemBuilder: (context, index) {
                    return _buildCoffeeCard(coffees[index]);
                  },
                ),
              ),

              const SizedBox(height: 25),

              // Special Offers
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Special Offers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: specialOffers.length,
                  itemBuilder: (context, index) {
                    return _buildSpecialOfferCard(specialOffers[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF2A2A2A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, true),
            _buildNavItem(Icons.favorite_border, false),
            _buildNavItem(Icons.shopping_bag_outlined, false),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: _buildNavItem(Icons.person_outline, false),
            ),
          ],
        ),
      ),
    );
  }

  // Coffee Card
  Widget _buildCoffeeCard(Coffee coffee) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              coffee: coffee,
              cartItems: cartItems, // pass cartItems
            ),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey[800],
              ),
              child: isLoading
                  ? Shimmer.fromColors(
                baseColor: Colors.grey[800]!,
                highlightColor: Colors.grey[600]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              )
                  : Hero(
                tag: coffee.name,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    coffee.image,
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            coffee.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFFF8C42),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              coffee.rating.toString(),
                              style: const TextStyle(fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${coffee.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cartItems.add(coffee);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to cart!'),
                                backgroundColor: Color(0xFFFF8C42),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF8C42),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialOfferCard(SpecialOffer offer) {
    return GestureDetector(
      onTap: () {
        Coffee dummyCoffee = Coffee(
          name: offer.name,
          price: offer.price,
          rating: 4.5,
          image: offer.image,
          description: '${offer.name} is a special offer product.',
          brewingSteps: [],
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              coffee: dummyCoffee,
              cartItems: cartItems,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: offer.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  offer.image,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              offer.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '\$${offer.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(width: 5),
                Text(
                  '\$${offer.originalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12, color: Colors.white54, decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF8C42) : const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[400],
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF8C42) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: isSelected ? Colors.white : Colors.white54, size: 24),
    );
  }
}
