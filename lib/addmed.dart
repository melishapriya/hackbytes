import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add image_picker import
import 'dart:io'; // For File handling

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String? selectedDosage = 'Morning'; // Default value
  String? selectedDuration = '1 Week'; // Default duration

  File? _image; // To store the captured image

  final ImagePicker _picker = ImagePicker();

  // List of available durations
  List<String> durations = ['1 Week', '2 Weeks', '1 Month', '2 Months'];

  // Function to pick an image from the camera
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the image path to the state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medicine Name TextField
            const Text(
              'Medicine Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter medicine name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Dosage Radio Buttons (Morning, Afternoon, Evening)
            const Text(
              'Dosage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Morning',
                  groupValue: selectedDosage,
                  onChanged: (String? value) {
                    setState(() {
                      selectedDosage = value;
                    });
                  },
                ),
                const Text('Morning'),
                Radio<String>(
                  value: 'Afternoon',
                  groupValue: selectedDosage,
                  onChanged: (String? value) {
                    setState(() {
                      selectedDosage = value;
                    });
                  },
                ),
                const Text('Afternoon'),
                Radio<String>(
                  value: 'Evening',
                  groupValue: selectedDosage,
                  onChanged: (String? value) {
                    setState(() {
                      selectedDosage = value;
                    });
                  },
                ),
                const Text('Evening'),
              ],
            ),
            const SizedBox(height: 20),

            // Time TextField
            const Text(
              'Time to take medicine:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                hintText: 'Enter time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Duration Dropdown
            const Text(
              'Select Duration:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedDuration,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDuration = newValue!;
                });
              },
              items: durations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Camera Icon for Image
            const Text(
              'Capture Medicine Image:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: _pickImage,
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.file(_image!), // Display the captured image
              ),
            const SizedBox(height: 30),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle saving the medicine details (e.g., store in a database)
                  final medicineName = nameController.text;
                  final dosage = selectedDosage;
                  final time = timeController.text;
                  final duration = selectedDuration;

                  if (medicineName.isNotEmpty &&
                      dosage != null &&
                      time.isNotEmpty &&
                      duration != null) {
                    // Here you can implement logic to save this data (e.g., to a database or a list)
                    print(
                        'Medicine Added: $medicineName, Dosage: $dosage, Time: $time, Duration: $duration');
                  }
                  // Optionally, navigate back to the HomePage after saving
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Medicine',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
