import 'package:flutter/material.dart';
import 'package:testflutter/screens/assessment/assessment_submission_screen.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
// Import the AssessmentSubmissionScreen

// Import the new AppDrawer
import '../../widgets/app_drawer.dart'; 

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // --- ATTACH DRAWER ---
      drawer: const AppDrawer(), 
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
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
            Icon(Icons.emoji_events, color: Colors.blue[600], size: 24), // Trophy icon
            const SizedBox(width: 8),
            // FIX: Wrap the Text with Expanded to constrain its width
            Expanded( 
              child: const Text(
                "Sports Talent Platform",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                maxLines: 1, 
                overflow: TextOverflow.ellipsis, // Added to handle edge cases gracefully
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
               Navigator.push(
                          context,MaterialPageRoute(builder: (context) => LoginScreen())
                          );
              // TODO: Implement logout logic
            },
            icon: const Icon(Icons.logout, size: 18, color: Colors.black87),
            label: const Text(
              "Out",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      
      // The body is scrollable, which is the KEY to prevent overflow
      body: SingleChildScrollView(
        // Slightly reduced top padding to provide more vertical space
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Dashboard Header ---
            const Text(
              "Dashboard",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Overview of your fitness journey",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // --- Start Test Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Assuming AssessmentSubmissionScreen is the corrected name
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AssessmentSubmissionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.electric_bolt, size: 20, color: Colors.white),
                label: const Text(
                  "Start Test",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Grid of Statistic Cards ---
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(), 
              // Increased ratio slightly to give cards more height if needed
              childAspectRatio: 1.3, 
              children: [
                _buildStatCard(
                  title: "Overall Score",
                  value: "0",
                  subtitle: "Average across all tests",
                  icon: Icons.shield_outlined,
                  color: Colors.blue,
                ),
                _buildStatCard(
                  title: "Tests Submitted",
                  value: "0",
                  subtitle: "Total assessments",
                  icon: Icons.show_chart,
                  color: Colors.green,
                ),
                _buildStatCard(
                  title: "Current Rank",
                  value: "#1",
                  subtitle: "Out of 1 athletes",
                  icon: Icons.ssid_chart,
                  color: Colors.purple,
                ),
                _buildStatCard(
                  title: "Badges Earned",
                  value: "0",
                  // Shortened subtitle slightly to fit on one line on small screens
                  subtitle: "Achievements", 
                  icon: Icons.workspace_premium_outlined,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 25),

            // --- Recent Submissions Section ---
            _buildSectionTitle("Recent Submissions"),
            const SizedBox(height: 15),
            _buildEmptyContentCard(
              child: Text(
                "No tests submitted yet",
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),

            // --- Quick Stats Section (Placeholder) ---
            _buildSectionTitle("Quick Stats"),
            const SizedBox(height: 15),
            _buildEmptyContentCard(
              child: Text(
                "Pending Tests", 
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            // Added a final spacer to ensure bottom content doesn't hug the edge
            const SizedBox(height: 40), 
          ],
        ),
      ),
    );
  }

  // --- REUSABLE WIDGET FUNCTIONS ---

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Set to start for better vertical control on smaller screens
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    // Allowed the title to wrap if necessary
                    style: TextStyle(color: Colors.grey[700], fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(icon, size: 18, color: color), 
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Spacer(), // Use a spacer to push the subtitle to the bottom
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
              maxLines: 2, // Allow subtitle to wrap if needed
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEmptyContentCard({required Widget child}) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}