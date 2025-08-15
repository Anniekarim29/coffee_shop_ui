import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Dark coffee background
      appBar: AppBar(
        backgroundColor: const Color(0xFFB38C6C), // Light coffee tone
        elevation: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Image
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your image
            ),

            const SizedBox(height: 15),

            // Name
            const Text(
              "Annie",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),

            // Email
            const Text(
              "anna@example.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Roboto',
              ),
            ),

            const SizedBox(height: 25),

            // Profile Info Cards
            _buildInfoCard(Icons.phone, "Phone", "+92 300 1234567"),
            _buildInfoCard(Icons.location_on, "Address", "Karachi, Pakistan"),
            _buildInfoCard(Icons.coffee, "Favorite Coffee", "Cappuccino"),

            const SizedBox(height: 30),

            // Edit Button
            ElevatedButton.icon(
              onPressed: () {
                // Edit Profile
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB38C6C),
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Logout Button
            ElevatedButton.icon(
              onPressed: () {
                // Logout Action
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFB38C6C)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Roboto'),
              ),
              Text(
                value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
