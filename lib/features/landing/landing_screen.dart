import 'package:flutter/material.dart';
import 'package:sayaraty/features/home/home_screen.dart';
import 'package:sayaraty/features/home/widgets/custom_bottom_nav_bar.dart';
import 'package:sayaraty/features/requests/requests_screen.dart';

// Replace these with your actual files
// import 'app_colors.dart'; // Your colors file
// import 'home_screen.dart'; // Your HomeScreen file

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final screens = [
    RequestsScreen(),
    HomeScreen(),
    const Center(child: Text("حسابي", style: TextStyle(fontSize: 24))),
  ];
  int currentIndex = 1;
  void _onNavItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => _onNavItemTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isSelected ? 40 : 0,
              width: isSelected ? 40 : 0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.orange.withOpacity(0.2) : null,
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  )
                ]
                    : [],
              ),
              child: isSelected
                  ? Icon(icon, color: Colors.orange, size: 22)
                  : null,
            ),
            if (!isSelected)
              Icon(icon, color: Colors.grey, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Page $currentIndex")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentIndex == 1 ? Colors.orange : Colors.grey[300],
        child: Icon(
          Icons.home,
          color: currentIndex == 1 ? Colors.white : Colors.black54,
        ),
        onPressed: () => _onNavItemTap(1),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 12,
        color: Colors.white,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildNavItem(icon: Icons.assignment, label: 'طلباتي', index: 0),
              const SizedBox(width: 40), // space for the FAB notch
              buildNavItem(icon: Icons.person, label: 'حسابي', index: 2),
            ],
          ),
        ),
      ),
    );
  }
}
