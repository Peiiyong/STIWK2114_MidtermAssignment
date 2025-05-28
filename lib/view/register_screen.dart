import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wtms/components/my_button.dart';
import 'package:wtms/service/config.dart';
import 'package:wtms/theme/color.dart';
import 'package:wtms/view/login_screen.dart';

// Register screen widget (stateful because it manages form state and visibility)
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isObscurePass = true;
  bool _isObscureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const SizedBox(height: 10),
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: sprimaryColor,
                    letterSpacing: 7,
                    fontFamily: 'Serif',
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    // App Logo
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    // App Name
                    Text(
                      'WTMS',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: sprimaryColor,
                        letterSpacing: 5,
                        fontFamily: 'Serif',
                        shadows: [
                          Shadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Full Name TextField
                    TextField(
                      controller: _fullnameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: sprimaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    // Email TextField
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: sprimaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    // Password TextField
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: sprimaryColor,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscurePass
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _passVisibility,
                        ),
                      ),
                      obscureText: _isObscurePass,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    // Confirm Password TextField
                    TextField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: sprimaryColor,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscureConfirmPass
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _confirmPassVisibility,
                        ),
                      ),
                      obscureText: _isObscureConfirmPass,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    // Phone Number TextField
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: sprimaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 10),
                    // Address TextField
                    TextField(
                      controller: _addressController,
                      maxLines: 3,
                      maxLength: 40,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.home),
                        label: const Text('Address'),
                        hintText: 'Enter your address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: sprimaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Resgiter Button
                    MyButton(
                      icon: Icon(Icons.logout),
                      text: 'REGISTER',
                      onTap: registerWorkerDialog, // call method to check validation
                    ),
                    const SizedBox(height: 15),
                    // Already have an account? Login now !
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap:
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              ),
                          child: Text(
                            'Login now!',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Toggle password visibility
  void _passVisibility() {
    setState(() {
      _isObscurePass = !_isObscurePass;
    });
  }

  // Toggle confirm password visibility
  void _confirmPassVisibility() {
    setState(() {
      _isObscureConfirmPass = !_isObscureConfirmPass;
    });
  }

  // Displays a dialog to confirm registration
  void registerWorkerDialog() {
    String fullname = _fullnameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String address = _addressController.text;
    String phone = _phoneController.text;

     // Validates email format
    bool isValidEmail(String email) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return emailRegex.hasMatch(email);
    }

    // Validation check
    if (fullname.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        address.isEmpty ||
        phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill in all fields',
            style: TextStyle(fontFamily: 'Serif'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid email format',
            style: TextStyle(fontFamily: 'Serif'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must be at least 6 characters',
            style: TextStyle(fontFamily: 'Serif'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Passwords do not match',
            style: TextStyle(fontFamily: 'Serif'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else if (_phoneController.text.length < 10 ||
        _phoneController.text.length > 11 ||
        !RegExp(r'^[0-9]+$').hasMatch(_phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Phone number must be at least 10 digits, at most 11 digits and contain only numbers',
            style: TextStyle(fontFamily: 'Serif'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Show confirmation dialog and call registerWorker() to proceed registration
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Register this account?',
              style: TextStyle(fontFamily: 'Serif'),
            ),
            content: const Text(
              'Are you sure to register?',
              style: TextStyle(fontSize: 16, fontFamily: 'Serif'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  registerWorker();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
  }

  // Sends a registration request to the server using POST
  Future<void> registerWorker() async {
    var response = await http.post(
      Uri.parse('${Config.server}/register_worker.php'),
      body: {
        'full_name': _fullnameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
      },
    );

    print(response.body);

    // Check if the response is successful
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      // Register Success
      if (jsondata['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Registration successful",
              style: TextStyle(fontFamily: 'Serif'),
            ),
            backgroundColor: Colors.green,
          ),
        );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        });
      } else {
        // Resgiter Failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Registration failed: ${jsondata['message']}',
              style: const TextStyle(fontFamily: 'Serif'),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
