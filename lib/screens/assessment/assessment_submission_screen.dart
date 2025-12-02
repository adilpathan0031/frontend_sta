import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
import 'package:testflutter/widgets/app_drawer.dart';

class AssessmentSubmissionScreen extends StatefulWidget {
  const AssessmentSubmissionScreen({super.key});

  @override
  State<AssessmentSubmissionScreen> createState() => _AssessmentSubmissionScreenState();
}

class _AssessmentSubmissionScreenState extends State<AssessmentSubmissionScreen> {
  // --- REMOVED CONTROLLERS, AS MANUAL INPUT IS GONE ---
  
  // Controllers for the Height and Weight fields (These remain, as they are not performance tests)
  final TextEditingController _heightController = TextEditingController(text: '175.5');
  final TextEditingController _weightController = TextEditingController(text: '70.5');

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // --- REUSABLE WIDGETS FOR UI CONSISTENCY ---

  // Card for a specific test section (Modified to accept a callback for video upload)
  Widget _buildTestCard({
    required Color color,
    required String title,
    required String description,
    required VoidCallback onUploadPressed, // NEW: Callback for the button press
  }) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              children: [
                Icon(Icons.sports_gymnastics, color: color, size: 24),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const Divider(height: 25, color: Colors.black26),

            // Description
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 15),

            // --- REPLACEMENT: UPLOAD VIDEO BUTTON ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onUploadPressed,
                icon: const Icon(Icons.cloud_upload_outlined, color: Colors.white),
                label: const Text(
                  "Upload Video",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.withOpacity(0.8), // Button color matching the card
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text field for non-test metrics (Height/Weight)
  Widget _buildMetricField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.number,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Icon(Icons.emoji_events, color: Colors.blue[600], size: 24),
            const SizedBox(width: 8),
            const Text(
              "Fitness Assessments",
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
              // LOGOUT FIX: Clear stack and navigate to login
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, size: 18, color: Colors.black87),
            label: const Text(
              "Logout",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Submit Your Fitness Metrics",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Upload a video for each test. Manual entry for performance is disabled.",
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),

            // --- Non-Test Metrics (Height and Weight) - These remain as manual fields ---
            _buildMetricField(
              label: "Height (cm)",
              hintText: "Your Height *",
              controller: _heightController,
            ),
            _buildMetricField(
              label: "Weight (kg)",
              hintText: "Your Weight *",
              controller: _weightController,
            ),

            // --- Assessment Tests (Now using Upload Button only) ---

            // Vertical Jump Test
            _buildTestCard(
              color: Colors.blue,
              title: "Vertical Jump Test",
              description: "Upload video evidence of your vertical jump test. The result will be calculated upon review.",
              onUploadPressed: () {
                // TODO: Implement video picker/upload logic for Vertical Jump
                print("Upload video for Vertical Jump");
              },
            ),
            const SizedBox(height: 20),

            // Shuttle Run Test
            _buildTestCard(
              color: Colors.green,
              title: "Shuttle Run Test (4x10m)",
              description: "Upload video evidence of your shuttle run performance. Time is determined by the reviewer.",
              onUploadPressed: () {
                // TODO: Implement video picker/upload logic for Shuttle Run
                print("Upload video for Shuttle Run");
              },
            ),
            const SizedBox(height: 20),

            // Sit-ups Test
            _buildTestCard(
              color: Colors.red,
              title: "Sit-ups Test (1 Minute)",
              description: "Upload video evidence of your 1-minute sit-ups test. The count is determined by the reviewer.",
              onUploadPressed: () {
                Navigator.of(context).pushNamed('/analysis');
                print("Upload video for Sit-ups");
              },
            ),
            const SizedBox(height: 20),

            // 12-Minute Endurance Run
            _buildTestCard(
              color: Colors.orange,
              title: "12-Minute Endurance Run",
              description: "Upload video evidence of your endurance run. Distance covered is determined by the reviewer.",
              onUploadPressed: () {
                // TODO: Implement video picker/upload logic for Endurance Run
                print("Upload video for Endurance Run");
              },
            ),
            const SizedBox(height: 30),

            // --- Submit Button (This can now just finalize the submission process) ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement Final Submission Logic (e.g., check if all videos were uploaded)
                  print("Finalizing assessment submission...");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Finalize Submission",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}