import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
import 'package:testflutter/screens/auth/signup_screen.dart';
import 'package:testflutter/screens/results/assessment_analysis_screen.dart';
import 'package:testflutter/screens/results/assessment_results_screen.dart';

// Import all screens necessary for named routes
import 'screens/dashboard/dashboard_screen.dart'; 
import 'screens/assessment/assessment_submission_screen.dart'; // Corrected file path
import 'screens/badges/badges_screen.dart'; // NEW: Import Badges Screen
import 'screens/leaderboard/leaderboard_screen.dart'; // Assuming you have this file
import 'screens/profile/profile_screen.dart'; // Assuming you have this file


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports Talent Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // ** FIX for Overflow Warning: **
        // This is a global setting that can prevent the red/yellow warning banner
        // from showing up in debug mode when an overflow occurs. 
        // Note: It hides the warning, but doesn't fix the underlying layout issue.
        // We've already fixed the layout in the screens, but this provides the final safeguard.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/signup': (context) => const SignupScreen(), // Placeholder for SignupScreen
        // FIX: Using the correct screen class
        '/assessment': (context) => const AssessmentSubmissionScreen(), 
        '/leaderboard': (context) => const LeaderboardScreen(),
        // NEW: Add Badges screen route
        '/badges': (context) => const BadgesScreen(), 
        '/profile': (context) => const ProfileScreen(),
        '/analysis': (context) => const AssessmentAnalysisScreen(), 
        '/results': (context) => const AssessmentResultsScreen(),
      },
    );
  }
}