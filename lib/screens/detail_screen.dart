import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 🔥 Black background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detail",
          style: TextStyle(
            color: Colors.white, // 🔥 White text
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Deliver"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.brown.shade300, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Deliver",
                        style: TextStyle(color: Colors.white)), // 🔥 White text
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Delivery Address
            const Text(
              "Delivery Address",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white), // 🔥 White text
            ),
            const SizedBox(height: 10),
            const Text(
              "Jl. Kgp sutoyo",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white), // 🔥
            ),
            const Text(
              "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
              style: TextStyle(color: Colors.white70), // 🔥 Light white
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text("Edit Address",
                        style: TextStyle(color: Colors.white)), // 🔥
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text("Edit Address",
                        style: TextStyle(color: Colors.white)), // 🔥
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(color: Colors.white24), // 🔥 Light divider

            // Coffee Item
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("assets/coffee.png", width: 50),
              ),
              title: const Text("Caffe Mocha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white)), // 🔥 White text
              subtitle: const Text("Deep foam",
                  style: TextStyle(color: Colors.white70)), // 🔥
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove, color: Colors.white)), // 🔥
                  const Text("1", style: TextStyle(color: Colors.white)), // 🔥
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white)), // 🔥
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Discount Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.local_offer, color: Colors.brown),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text("1 Discount Apply",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white)), // 🔥
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.white), // 🔥
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Payment Summary
            const Text("Payment summary",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)), // 🔥
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Price",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white)), // 🔥
                Text("\$10.00", style: TextStyle(color: Colors.white)), // 🔥
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Delivery fee",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white)), // 🔥
                Text("\$1.00", style: TextStyle(color: Colors.white)), // 🔥
              ],
            ),

            const SizedBox(height: 20),

            // Wallet
            ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: const Text("Cash/wallet",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)), // 🔥
              leading: const Icon(Icons.account_balance_wallet,
                  color: Colors.brown),
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("%50.00", style: TextStyle(color: Colors.white)), // 🔥
                )
              ],
            ),

            const SizedBox(height: 20),

            // Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Order",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)), // 🔥
              ),
            ),
          ],
        ),
      ),
    );
  }
}
