import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
import 'package:testflutter/screens/dashboard/dashboard_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for text fields (to retrieve input)
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _sportController = TextEditingController();

  // State variables for dropdowns
  String? _selectedGender; // Nullable to allow no initial selection or hint text
  String? _selectedRole; // Nullable to allow no initial selection or hint text
  String? _selectedState; // Placeholder, would typically come from a list
  String? _selectedSport; // Placeholder, would typically come from a list

  // Dummy lists for dropdowns (in a real app, these would come from an API or database)
  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _roles = ['Athlete', 'Coach', 'Admin', 'Spectator'];
  final List<String> _states = ['State A', 'State B', 'State C', 'State D']; // Example states
  final List<String> _sports = ['Football', 'Basketball', 'Cricket', 'Tennis', 'Running']; // Example sports


  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _stateController.dispose();
    _districtController.dispose();
    _sportController.dispose();
    super.dispose();
  }

  // --- Reusable Widget Functions ---

  Widget _buildTextField({
    required String label,
    required String hintText,
    TextEditingController? controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label *',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // No visible border
            ),
            enabledBorder: OutlineInputBorder( // Define border when enabled
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder( // Define border when focused
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5), // Highlight on focus
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    String? selectedValue,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String hintText = "Select an option",
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label *',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent), // Transparent border
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              hint: Text(hintText),
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: TextStyle(color: Colors.grey[800], fontSize: 16),
            ),
          ),
        ),
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
        // The first image shows 'Create Your Account' as a title, but also above the form.
        // For an AppBar, a simple title is usually better.
        // We'll put the main "Create Your Account" with icon in the body for flexibility.
        toolbarHeight: 0, // Hide the app bar completely as the design doesn't show one with title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header from Image 2
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(Icons.emoji_events, color: Colors.blue[600], size: 60), // Trophy icon
                  const SizedBox(height: 10),
                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Join the sports talent community",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // "Sign Up" section from Image 2
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Fill in your details to get started",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 25), // Increased spacing to match image

            // Form Fields based on Image 1 & 2
            _buildTextField(
              label: "Full Name",
              hintText: "Enter your full name",
              controller: _fullNameController,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Email",
              hintText: "your@email.com",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Password",
              hintText: "Enter password",
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Age",
              hintText: "Enter your age",
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              label: "Gender",
              selectedValue: _selectedGender,
              items: _genders,
              hintText: "Select gender",
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Phone",
              hintText: "Enter phone number",
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              label: "State",
              selectedValue: _selectedState,
              items: _states,
              hintText: "Select state",
              onChanged: (String? newValue) {
                setState(() {
                  _selectedState = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "District",
              hintText: "Enter district",
              controller: _districtController,
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              label: "Sport",
              selectedValue: _selectedSport,
              items: _sports,
              hintText: "Select sport",
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSport = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              label: "Role",
              selectedValue: _selectedRole,
              items: _roles,
              hintText: "Select role",
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue;
                });
              },
            ),

            const SizedBox(height: 35),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (route) => false);
                },
                        
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color from image
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // "Already have an account?" link
            Center(
              child: GestureDetector(
                onTap: () {
                Navigator.of(context).pushReplacementNamed('/login');
                           },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    children: const [
                      TextSpan(
                        text: "Sign in here",
                        style: TextStyle(
                          color: Colors.blue, // Blue link color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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