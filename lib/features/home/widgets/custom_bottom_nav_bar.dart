import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    const icons = [
      Icons.receipt_long, // طلباتي
      Icons.home,         // الرئيسية
      Icons.person,       // حسابي
    ];
    const labels = ['طلباتي', 'الرئيسية', 'حسابي'];

    return BottomAppBar(
      color: Colors.white,
      elevation: 15,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 80,
        child: Row(
          children: List.generate(3, (index) {
            final isSelected = selectedIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onItemTapped(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: isSelected ? 50 : 0,
                      width: isSelected ? 50 : 0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? Colors.orange.withOpacity(0.1)
                            : Colors.transparent,
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ]
                            : [],
                      ),
                      child: isSelected
                          ? Icon(
                        icons[index],
                        color: Colors.orange,
                        size: 26,
                      )
                          : null,
                    ),
                    if (!isSelected)
                      Icon(
                        icons[index],
                        size: 24,
                        color: Colors.grey,
                      ),
                    const SizedBox(height: 4),
                    Text(
                      labels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey,
                        fontSize: 12,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
