import 'package:flutter/material.dart';
import 'package:testflutter/screens/auth/login_screen.dart';
// Assuming app_drawer.dart is in lib/widgets/app_drawer.dart
import '../../widgets/app_drawer.dart'; 

class LeaderboardScreen extends StatefulWidget {
  // Use a unique key to correctly define the route name for the drawer
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  // State variables for dropdown selections
  String? _selectedAgeGroup = 'All Age Groups';
  String? _selectedSport = 'All Sports';
  String? _selectedGender = 'All Genders';
  String? _selectedState = 'All States';
  String? _selectedDistrict = 'All Districts';

  // Dummy data (Initial values set in initState in original file, but setting here is fine too)
  final List<String> _ageGroups = ['All Age Groups', 'Under 18', '18-24', '25-34', '35+'];
  final List<String> _sports = ['All Sports', 'Football', 'Basketball', 'Cricket', 'Tennis'];
  final List<String> _genders = ['All Genders', 'Male', 'Female', 'Other'];
  final List<String> _states = ['All States', 'State A', 'State B', 'State C'];
  final List<String> _districts = ['All Districts', 'District X', 'District Y', 'District Z'];

  // Reusable widget for building dropdowns (kept for completeness)
  Widget _buildDropdownField({
    required String label,
    required String? selectedValue,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    // ... (Dropdown implementation from previous response) ...
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
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
      
      // --- ATTACH DRAWER ---
      drawer: const AppDrawer(), 
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        // --- FIXED: Menu icon uses Builder to open drawer ---
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
        // ---------------------------------------------------
        
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Leaderboard Header ---
            const Text(
              "Leaderboard",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Top performing athletes across the platform",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // --- Filters Card ---
            Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Filters",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),

                    // ... Dropdown fields updated with setState calls ...
                    _buildDropdownField(
                      label: "Age Group",
                      selectedValue: _selectedAgeGroup,
                      items: _ageGroups,
                      onChanged: (String? newValue) {
                        setState(() { _selectedAgeGroup = newValue; });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildDropdownField(
                      label: "Sport",
                      selectedValue: _selectedSport,
                      items: _sports,
                      onChanged: (String? newValue) {
                        setState(() { _selectedSport = newValue; });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildDropdownField(
                      label: "Gender",
                      selectedValue: _selectedGender,
                      items: _genders,
                      onChanged: (String? newValue) {
                        setState(() { _selectedGender = newValue; });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildDropdownField(
                      label: "State",
                      selectedValue: _selectedState,
                      items: _states,
                      onChanged: (String? newValue) {
                        setState(() { _selectedState = newValue; });
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildDropdownField(
                      label: "District",
                      selectedValue: _selectedDistrict,
                      items: _districts,
                      onChanged: (String? newValue) {
                        setState(() { _selectedDistrict = newValue; });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // --- Rankings Section ---
            const Text(
              "Rankings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      color: Colors.grey[300],
                      size: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "No athletes found with the selected filters",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
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