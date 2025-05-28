import 'package:flutter/material.dart';
/* 
    MyButton class is a reusable custom button widget, 
    it is used in Submit Completion screens.
*/
class MyButton2 extends StatelessWidget {
    final String text;
  final void Function()? onTap;
  final Icon icon;
  const MyButton2({super.key, required this.text, required this.onTap, required this.icon});

 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Calls the onTap function when user taps the button
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text, // Display the provided button text
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Serif',
                letterSpacing: 7,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(icon.icon, color: Colors.white), // Display the provided icon
          ],
        ),
      ),
    );
  }
}
