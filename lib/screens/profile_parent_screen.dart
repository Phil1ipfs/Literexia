import 'package:flutter/material.dart';
import 'package:literexia/screens/home_parent_screen.dart';

class ProfileParentPage extends StatelessWidget {
  const ProfileParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profileimagee.png"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Phillip Casingal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                 fontFamily: 'Atkinson',
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoTile(
              icon: Icons.person,
              label: "Full Name",
              value: "Phillip Casingal",
            ),
            _buildInfoTile(
              icon: Icons.email,
              label: "Email",
              value: "Phillip@gmail.com",
            ),
            _buildInfoTile(
              icon: Icons.phone,
              label: "Contact Number",
              value: "0999212343123",
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C7BA2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              // - FOR GOING BACK TO THE LOGIN PAGE -- 
              onPressed: () {
              },
              // - FOR GOING BACK TO THE LOGIN PAGE -- 

              child: const Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                   Icon(Icons.logout,
                      color: Colors.white), 
                   SizedBox(width: 16), 
                   Text(
                    "Logout",
                    style: TextStyle(color: Colors.white,  fontFamily: 'Atkinson',),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5E9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                   fontFamily: 'Atkinson',
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.grey,
                   fontFamily: 'Atkinson',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
