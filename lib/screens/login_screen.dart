import 'package:flutter/material.dart';
import 'package:literexia/screens/home_parent_screen.dart';
import 'package:literexia/screens/register_screen.dart';
import 'package:literexia/widgets/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:literexia/screens/quest_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Student';
  List<String> registeredParentEmails = [];

  @override
  void initState() {
    super.initState();
    _loadRegisteredParents();
  }

  Future<void> _loadRegisteredParents() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      registeredParentEmails = prefs.getStringList('parentEmails') ?? [];
    });
  }

  Future<void> _saveParentEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    registeredParentEmails.add(email);
    await prefs.setStringList('parentEmails', registeredParentEmails);
  }

  Future<void> _showDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
  void _signIn() {
    if (_formKey.currentState!.validate()) {
      if ((_selectedRole == 'Parent' && _emailController.text.endsWith('.edu')) ||
          (_selectedRole == 'Student' && !_emailController.text.endsWith('.edu'))) {
        _showDialog("Error", "Please enter valid email and password");
        return;
      }

      _showDialog("Success", "Login Successful!").then((_) {
        if (_selectedRole == 'Parent' && !registeredParentEmails.contains(_emailController.text)) {
          _saveParentEmail(_emailController.text);
        }
        if (_selectedRole == 'Student') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Quest()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      });
    }
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Literexia_PRIMARY,
    body: Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "SIGN IN",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Atkinson'),
                  ),
                  const SizedBox(height: 10),
                  const Text("Maligayang pagbabalik!", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: BACKGROUND_COLOR,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                    items: ['Student', 'Parent'].map((role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (_selectedRole == 'Student' && !value.endsWith(".edu")) {
                        return "Students must use a .edu email";
                      }
                      if (_selectedRole == 'Parent' && registeredParentEmails.contains(value)) {
                        return "This parent email is already registered";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFCE29A),
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("SIGN IN", style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()), 
                      );
                    },
                    child: const Text(
                      "WALA PANG ACCOUNT? REGISTER",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Ekis Button (Close Button)
        Positioned(
          top: 40, 
          left: 20,
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.yellow, size: 30), // Yellow "X"
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  );
}
}