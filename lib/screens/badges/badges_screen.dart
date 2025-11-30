import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
import '../../widgets/app_drawer.dart'; // Import the AppDrawer

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

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
            onPressed: ( ) 
            { 
                 Navigator.push(
                          context,MaterialPageRoute(builder: (context) => LoginScreen())
                          );  // TODO: Implement logout logic
            },
            icon: const Icon(Icons.logout, size: 18, color: Colors.black87),
            label: const Text(
              "Out",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(), // Include the drawer
      
      // *** FIX FOR OVERFLOW: Ensure the body is scrollable ***
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            const Text(
              "Badges",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Track your achievements and unlock new badges",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // --- Stat Cards ---
            _buildStatCard(title: "Total Badges", value: "6"),
            const SizedBox(height: 15),
            _buildStatCard(title: "Earned", value: "0"),
            const SizedBox(height: 15),
            _buildStatCard(title: "Locked", value: "6"),
            const SizedBox(height: 25),

            // --- Badge List ---
            _buildBadgeItem(
              icon: Icons.track_changes_outlined,
              title: "First Test",
              description: "Complete your first fitness assessment",
              isLocked: true,
            ),
            const SizedBox(height: 15),
            _buildBadgeItem(
              icon: Icons.star_border,
              title: "Rising Star",
              description: "Achieve a score of 500 or higher",
              isLocked: true,
            ),
            const SizedBox(height: 15),
            _buildBadgeItem(
              icon: Icons.directions_run_outlined,
              title: "Sprint Master",
              description: "Complete the Shuttle Run in under 10 seconds",
              isLocked: true,
            ),
            const SizedBox(height: 15),
            _buildBadgeItem(
              icon: Icons.fitness_center_outlined,
              title: "Iron Core",
              description: "Complete 60 sit-ups in one minute",
              isLocked: true,
            ),
            // Add a final spacer to prevent content from touching the bottom edge
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE WIDGETS ---

  // Statistic Card Widget
  Widget _buildStatCard({required String title, required String value}) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Individual Badge Item Widget
  Widget _buildBadgeItem({
    required IconData icon,
    required String title,
    required String description,
    required bool isLocked,
  }) {
    Color itemColor = isLocked ? Colors.grey : Colors.blue;
    
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge Icon (Styled based on lock state)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: itemColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 24, color: itemColor),
            ),
            const SizedBox(width: 15),
            // Badge Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Lock Icon
            Icon(
              isLocked ? Icons.lock_outline : Icons.check_circle_outline,
              color: isLocked ? Colors.grey : Colors.green,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}