import 'package:flutter/material.dart';
import 'calling.dart'; // Import the calling screen

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool _isCalling = false; // Track whether the call is in progress

  // Function to show call options
  void _startCall(BuildContext context, String callType) {
    setState(() {
      _isCalling = true; // Start the calling animation
    });
    // Navigate to the CallingScreen after starting the call animation
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CallingScreen(callType: callType),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Call Type'),
        centerTitle: true,
      ),
      body: Center(
        child: _isCalling
            ? const CircularProgressIndicator() // Show a loading animation while the call starts
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _startCall(context, 'Video'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 60),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Video Call',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between buttons
                  ElevatedButton(
                    onPressed: () => _startCall(context, 'Audio'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 60),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Audio Call',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
