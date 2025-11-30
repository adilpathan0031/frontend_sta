import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
import '../../widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Drawer Icon
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.emoji_events, color: Colors.blue[600], size: 24),
            const SizedBox(width: 8),
            const Text(
              "Sports Talent Platform",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              // TODO: Implement logout logic
               Navigator.push(
                          context,MaterialPageRoute(builder: (context) => LoginScreen())
                          );
            },
            icon: const Icon(Icons.logout, size: 18, color: Colors.black87),
            label: const Text(
              "Out",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      
      // *** FIX FOR OVERFLOW: Ensure the body is scrollable ***
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Text(
              "Profile",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Manage your account information",
              style: TextStyle(fontSize: 14, color: Color(0xFF757575)), // grey[600]
            ),
            SizedBox(height: 20),

            // --- Action Buttons ---
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: _ActionButton(
                      label: "Edit Profile",
                      icon: Icons.edit_outlined,
                      isSelected: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: _ActionButton(
                      label: "Login as Admin",
                      icon: Icons.login_outlined,
                      isSelected: false,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // --- User Info Card ---
            _UserInfoCard(
              name: "admin",
              role: "Athlete",
              memberSince: "11/30/2025",
            ),
            SizedBox(height: 30),

            // --- Personal Information Section ---
            Text(
              "Personal Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),

            _DataField(label: "Full Name", value: "admin"),
            _DataField(label: "Email", value: "admin@example.com"),
            _DataField(label: "Age", value: "18"),
            _DataField(label: "Gender", value: "Male"),
            _DataField(label: "Phone", value: "08866214504"),
            _DataField(label: "Sport", value: "Wrestling"),
            _DataField(label: "State", value: "Mizoram"),
            _DataField(label: "District", value: "sabar"),
            SizedBox(height: 30),

            // --- Account Details Section ---
            Text(
              "Account Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            
            _AccountDetailRow(title: "Role", value: "Athlete", isBold: true),
            _AccountDetailRow(title: "Account Created", value: "11/30/2025"),
            _AccountDetailRow(title: "User ID", value: "1764515887996"),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets ---

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  
  const _ActionButton({required this.label, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: isSelected ? 2 : 0,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isSelected ? BorderSide.none : const BorderSide(color: Color(0xFFE0E0E0)),
        ),
      ),
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _UserInfoCard extends StatelessWidget {
  final String name;
  final String role;
  final String memberSince;

  const _UserInfoCard({required this.name, required this.role, required this.memberSince});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, size: 30, color: Colors.deepPurple),
            ),
            const SizedBox(width: 15),
            // User Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  role,
                  style: TextStyle(fontSize: 14, color: Colors.blue[600], fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  "Member since $memberSince",
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DataField extends StatelessWidget {
  final String label;
  final String value;
  
  const _DataField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _AccountDetailRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;

  const _AccountDetailRow({required this.title, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.black : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}