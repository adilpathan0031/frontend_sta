import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/signup_screen.dart';
import 'package:testflutter/screens/dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light blue/grey background gradient for the whole screen
      backgroundColor: const Color(0xFFF5F8FF), 
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80), // Space from the top

            // --- Header Section (Trophy and Welcome Text) ---
            Icon(
              Icons.emoji_events, 
              color: Colors.blue[600], 
              size: 70,
            ),
            const SizedBox(height: 10),
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Sign in to continue your journey",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 40),

            // --- Login Card ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Card(
                elevation: 5, // Soft shadow for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Wrap content height
                    children: [
                      // "Sign In" Title
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Enter your credentials to access your account",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Email Field
                      _buildLabel("Email"),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _emailController,
                        hintText: "your@email.com",
                        initialValue: "akpathan7861133@gmail.com", // Example value from image
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      _buildLabel("Password"),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _passwordController,
                        hintText: "••••••••",
                        obscureText: true,
                        initialValue: "1234", // Example dots from image
                      ),
                      const SizedBox(height: 30),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                           Navigator.push(
                          context,MaterialPageRoute(builder: (context) => DashboardScreen())
                          );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Black background
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Don't have an account? Sign up here
                      Center(
                        child: GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  SignupScreen()),
                        );
                      },
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.grey[700], fontSize: 14),
                              children: const [
                                TextSpan(
                                  text: "Sign up here",
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE WIDGET FUNCTIONS ---

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? initialValue,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    // If an initial value is provided, set the controller's text
    if (initialValue != null && controller.text.isEmpty) {
      controller.text = initialValue;
    }

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF0F0F0), // Light grey fill color
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
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
      ),
    );
  }
}