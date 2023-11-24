import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Sample user details
  String name = "Jewel Maxwell";
  String email = "jewelmaxwell007@gmail.com";
  String phone = "9074756119";
  String address = "Eastfort(po) Thrissur";
  String about = "I love coding and technology!";
  String language = "English";
  String deliveryAddress = "Eastfort(po) Thrissur";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController deliveryAddressController =
      TextEditingController();
  

  bool isEditing = false;

  
Future<void> updateUserData() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('settings').doc(user.uid).set({
        'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'address': addressController.text,
          'about': aboutController.text,
          'language': languageController.text,
          'deliveryAddress': deliveryAddressController.text,
      });
    }
    print("User data updated successfully");
  } catch (error) {
    print('Error updating user data: $error');
  }
}
  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
       if (!isEditing) {
        // Reload user data from Firestore here...
        // For now, we'll just reassign the initial values for demonstration purposes
        nameController.text = "jewelmaxwell";
        emailController.text = "jewelmaxwell007@wgmail.com";
        phoneController.text = "9074756119";
        addressController.text = "Eastfort(po) Thrissur";
        aboutController.text = "I love coding and technology!";
        languageController.text = "English";
        deliveryAddressController.text = "Eastfort(po) Thrissur";
      }
    });
  }
   Future<void> loadUserData() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('settings')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        setState(() {
          nameController.text = data['name'];
          emailController.text = data['email'];
          phoneController.text = data['phone'];
          addressController.text = data['Address'];
          aboutController.text = data['About'];
          languageController.text = data['Language'];
          deliveryAddressController.text = data['Deilvery Address'];
        });
      }
    }
  } catch (error) {
    print('Error loading user data: $error');
  }
}
Future<void> loadUserDataFromFirebase() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('settings')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        setState(() {
          nameController.text = data['name'];
          emailController.text = data['email'];
          // Load other fields as needed
        });
      }
    }
  } catch (error) {
    print('Error loading user data: $error');
  }
}

  @override
  void initState() {
    super.initState();
    loadUserData();
    loadUserDataFromFirebase();
    final user = FirebaseAuth.instance.currentUser;
if (user != null) {
  final email = user.email; // Get the user's email
  final displayName = user.displayName; // Get the user's display name
  // Update your text controllers or UI elements with email and displayName
  emailController.text = email ?? "";
  nameController.text = displayName ?? "";
}

    //  firstNameController.text = widget.fullName;
       nameController.text = "jewelmaxwell";
      //   emailController.text = "jewelmaxwell007@wgmail.com";
        phoneController.text = "9074756119";
        addressController.text = "Eastfort(po) Thrissur";
        aboutController.text = "I love coding and technology!";
        languageController.text = "English";
        deliveryAddressController.text = "Eastfort(po) Thrissur";
  }    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    
       Text(
        "SETTINGS",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    
    SizedBox(height: 29,),
    Text(
      "Person Settings",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 16),
    // First Name
    Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Name:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
             
              enabled: isEditing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            enabled: isEditing,
          ),
        ),
      ],
    ),
    SizedBox(height: 10),
    // Last Name
    Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "email:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              
              enabled: isEditing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            enabled: isEditing,
          ),
        ),
      ],
    ),
    SizedBox(height: 10),
    // Address
    Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "phone:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
             
              enabled: isEditing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            enabled: isEditing,
          ),
        ),
      ],
    ),
    SizedBox(height: 10),
    // City
    Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Address:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: addressController,
            decoration: InputDecoration(
             
              enabled: isEditing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            enabled: isEditing,
          ),
        ),
      ],
    ),
    SizedBox(height: 10),
    // Country
    Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "About:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: aboutController,
            decoration: InputDecoration(
             
              enabled: isEditing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            enabled: isEditing,
          ),
        ),
      ],
    ),
      SizedBox(height: 30),
            Text(
              "App Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
    // Phone Number
    Row(
      children: [
        Expanded(
          flex: 1,
          child:DropdownButtonFormField<String>(
  value: languageController.text,
  items: ["English", "Spanish", "French"] // Add your language options here
      .map((value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList(),
  onChanged: isEditing
      ? (value) {
          setState(() {
            languageController.text = value!;
          });
        }
      : null,
  decoration: InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.all(10),
  ),
)
      
        ),
      ],
    ),
    SizedBox(height: 10),
     Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Delivery Address:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: deliveryAddressController,
            decoration: InputDecoration(
             
              enabled: isEditing,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            enabled: isEditing,
          ),
        ),
      ],
    ),
    // Add the Save and Cancel buttons here
  

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Toggle editing mode
                        toggleEditing();
                      },
                      child: Text(isEditing ? "Cancel" : "Edit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (isEditing) {
                          // Save user data if in editing mode
                          updateUserData();
                          

                        }
                        toggleEditing();
                      },
                      child: Text(isEditing ? "Save" : "Save"),
                    ),
                  ],
                ),
  ]),
        
      ),
    );
  }
}
