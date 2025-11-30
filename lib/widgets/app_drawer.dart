import 'package:flutter/material.dart';
import 'package:testflutter/screens/assessment/assessment_submission_screen.dart';
import 'package:testflutter/screens/badges/badges_screen.dart';
import 'package:testflutter/screens/dashboard/dashboard_screen.dart';
import 'package:testflutter/screens/leaderboard/leaderboard_screen.dart';
import 'package:testflutter/screens/profile/profile_screen.dart';
// --- Corrected Placeholder Screens ---


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // We check the current route to highlight the selected item
    final currentRoute = ModalRoute.of(context)?.settings.name;

    Widget _buildDrawerItem({
      required IconData icon,
      required String title,
      required String routeName,
      required Widget screen,
      required bool isSelected,
    }) {
      return Container(
        // Highlight background if selected
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black87,
            ),
          ),
          onTap: () {
            Navigator.pop(context); // Close the drawer first
            
            // Navigate if not already on this screen
            if (currentRoute != routeName) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screen,
                  settings: RouteSettings(name: routeName),
                ),
              );
            }
          },
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Custom Header (Trophy + App Name)
          const SizedBox( // Changed to const
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  // Added const to Icon and Text widgets
                  const Icon(Icons.emoji_events, color: Colors.blue, size: 30), 
                  const SizedBox(width: 10),
                  const Text(
                    "Sports Talent Platform",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Navigation Links ---
          _buildDrawerItem(
            icon: Icons.dashboard_outlined,
            title: 'Dashboard',
            routeName: '/dashboard',
            screen: const DashboardScreen(),
            isSelected: currentRoute == '/dashboard' || currentRoute == null, 
          ),
          _buildDrawerItem(
            icon: Icons.show_chart,
            title: 'Fitness Tests',
            routeName: '/assessment',
            screen: const AssessmentSubmissionScreen(),
            isSelected: currentRoute == '/assessment',
          ),
          _buildDrawerItem(
            icon: Icons.emoji_events_outlined,
            title: 'Leaderboard',
            routeName: '/leaderboard',
            screen: const LeaderboardScreen(),
            isSelected: currentRoute == '/leaderboard',
          ),
          _buildDrawerItem(
            icon: Icons.workspace_premium_outlined,
            title: 'Badges',
            routeName: '/badges',
            screen: const BadgesScreen(),
            isSelected: currentRoute == '/badges',
          ),
          _buildDrawerItem(
            icon: Icons.person_outline,
            title: 'Profile',
            routeName: '/profile',
            screen: const ProfileScreen(),
            isSelected: currentRoute == '/profile',
          ),
        ],
      ),
    );
  }
}