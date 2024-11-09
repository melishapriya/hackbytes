import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading: "My Account"
            Text(
              'My Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Profile Picture: Centered in the middle
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  '"C:Users\melis\Desktop\grandma.jpg"'), // Your profile image
            ),
            SizedBox(height: 20),

            // Display each detail in a "bar" style
            ProfileDetailBar(label: 'Name:', value: 'John Doe'),
            ProfileDetailBar(label: 'Birth Date:', value: '01/01/1990'),
            ProfileDetailBar(label: 'Mobile Number:', value: '+1234567890'),
            ProfileDetailBar(label: 'Email:', value: 'johndoe@example.com'),
            ProfileDetailBar(label: 'Guardian\'s Name:', value: 'Jane Doe'),
            ProfileDetailBar(
                label: 'Guardian\'s Number:', value: '+0987654321'),
          ],
        ),
      ),
    );
  }
}

// A widget to display each detail in a "bar" style
class ProfileDetailBar extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailBar({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color of the bar
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Row(
        children: [
          Text(
            '$label ',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.right, // Aligns the value to the right
            ),
          ),
        ],
      ),
    );
  }
}
