import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';

class AssessmentSubmissionScreen extends StatefulWidget {
  const AssessmentSubmissionScreen({super.key});

  @override
  State<AssessmentSubmissionScreen> createState() => _AssessmentSubmissionScreenState();
}

class _AssessmentSubmissionScreenState extends State<AssessmentSubmissionScreen> {
  // Controllers for text fields
  final TextEditingController _heightController = TextEditingController(text: '175.5');
  final TextEditingController _weightController = TextEditingController(text: '70.5');
  final TextEditingController _verticalJumpController = TextEditingController(text: '45.5');
  final TextEditingController _shuttleRunController = TextEditingController(text: '12.5');
  final TextEditingController _sitUpsController = TextEditingController(text: '45');
  final TextEditingController _enduranceRunController = TextEditingController(text: '2800');

  // --- Reusable Widgets for UI consistency ---

  // Card for a specific test section (e.g., Vertical Jump)
  Widget _buildTestCard({
    required Color color,
    required String title,
    required String hintText,
    required String description,
    required TextEditingController controller,
  }) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color.withOpacity(0.05), // Light background tint
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.videocam_outlined, color: Colors.black87, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              hintText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g., ${controller.text}',
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 15),
            const Text(
              "Upload Video",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 8),
            // Placeholder for Upload Button
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Choose File",
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "No file chosen",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Input fields for simple body measurements
  Widget _buildMeasurementField({
    required String label,
    required String unit,
    required TextEditingController controller,
    required bool showArrow,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ($unit) *',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'e.g., ${controller.text}',
            suffixIcon: showArrow ? const Icon(Icons.swap_vert) : null,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey[200],
            filled: true,
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // The menu icon is typically used to open the Drawer
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {
            // Note: Since this screen might be pushed onto a stack,
            // we typically don't use a Builder here if the root Scaffold
            // doesn't have a Drawer. But since we want the drawer here too:
            Scaffold.of(context).openDrawer(); // Assumes the parent has a drawer setup
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
      
      // Use the AppDrawer on this screen as well
      // NOTE: You must have imported AppDrawer at the top of this file
      // If you are pushing this screen from the Dashboard, you may not need the drawer here.
      // But for completeness, you can add it:
      // drawer: const AppDrawer(), 

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            const Text(
              "Fitness Assessment",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Complete your fitness test measurements",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // --- Submit New Assessment Card ---
            Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.assessment, color: Colors.blue[600], size: 20),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            "Submit New Assessment",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Enter your measurements and upload videos for each fitness parameter",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const Divider(height: 30),

                    // Body Measurements
                    const Text(
                      "Body Measurements",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    _buildMeasurementField(
                      label: "Height",
                      unit: "cm",
                      controller: _heightController,
                      showArrow: true,
                    ),
                    _buildMeasurementField(
                      label: "Weight",
                      unit: "kg",
                      controller: _weightController,
                      showArrow: false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Individual Test Cards ---
            _buildTestCard(
              color: Colors.blue,
              title: "Vertical Jump Test",
              hintText: "Vertical Jump (cm) *",
              description: "Maximum height reached",
              controller: _verticalJumpController,
            ),
            const SizedBox(height: 20),

            _buildTestCard(
              color: Colors.green,
              title: "Shuttle Run Test",
              hintText: "Shuttle Run (seconds) *",
              description: "Time to complete shuttle run",
              controller: _shuttleRunController,
            ),
            const SizedBox(height: 20),

            _buildTestCard(
              color: Colors.purple,
              title: "Sit-ups Test",
              hintText: "Sit-ups Count *",
              description: "Number completed in 1 minute",
              controller: _sitUpsController,
            ),
            const SizedBox(height: 20),

            _buildTestCard(
              color: Colors.orange,
              title: "12-Minute Endurance Run",
              hintText: "Distance (meters) *",
              description: "Distance covered in 12 minutes",
              controller: _enduranceRunController,
            ),
            const SizedBox(height: 30),

            // --- Submit Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement Submission Logic (Frontend only - maybe show a success dialog)
                  print("Submitting assessment...");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Submit Assessment",
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