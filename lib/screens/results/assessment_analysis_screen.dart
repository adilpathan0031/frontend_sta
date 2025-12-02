import 'package:flutter/material.dart';

class AssessmentAnalysisScreen extends StatefulWidget {
  const AssessmentAnalysisScreen({super.key});

  @override
  State<AssessmentAnalysisScreen> createState() => _AssessmentAnalysisScreenState();
}

class _AssessmentAnalysisScreenState extends State<AssessmentAnalysisScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a 3-second analysis process
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the results screen and replace the current screen
      Navigator.of(context).pushReplacementNamed('/results');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.analytics, color: Colors.blue[600], size: 24),
            const SizedBox(width: 8),
            const Text(
              "Analyzing Assessments",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        // No back button during analysis
        automaticallyImplyLeading: false, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              // Consistent Blue primary color
              child: CircularProgressIndicator(
                color: Colors.blue[600], 
                strokeWidth: 5,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Analyzing videos and calculating scores...",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "This may take a few moments.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}