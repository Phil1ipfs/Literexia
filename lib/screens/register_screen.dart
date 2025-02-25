import 'package:flutter/material.dart';
import 'package:literexia/screens/login_screen.dart';
import 'package:literexia/widgets/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (_selectedRole == 'Parent' && _emailController.text.endsWith(".edu")) {
        _showDialog("Error", "Parents cannot use a .edu email.");
        return;
      }
      if (_selectedRole == 'Student' && !_emailController.text.endsWith(".edu")) {
        _showDialog("Error", "Students must use a .edu email.");
        return;
      }
      if (_selectedRole == 'Parent' && registeredParentEmails.contains(_emailController.text)) {
        _showDialog("Error", "This parent email is already registered.");
        return;
      }
      if (_selectedRole == 'Parent') {
        _saveParentEmail(_emailController.text);
      }
      _showDialog("Success", "Account successfully created!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Literexia_PRIMARY,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GUMAWA NG ACCOUNT",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Atkinson'),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      
                      items: ["Student", "Parent"].map((String role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _selectedRole = value!),
                      decoration: InputDecoration(labelText: "Role", filled: true, fillColor: BACKGROUND_COLOR),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: "Kabuuang Pangalan", filled: true, fillColor: Colors.white),
                      validator: (value) => value!.isEmpty ? "Punan ang pangalan" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email", filled: true, fillColor: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Di wastong email";
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password", filled: true, fillColor: Colors.white),
                      validator: (value) => value!.length < 6 ? "Dapat 6+ characters" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Kumpirmahin ang Password", filled: true, fillColor: Colors.white),
                      validator: (value) => value != _passwordController.text ? "Di tugma ang password" : null,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFCE29A)),
                        onPressed: _register,
                        child: Text("MAG REHISTRO", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text("MAYROON NANG ACCOUNT? SIGN IN", style: TextStyle(color: Colors.white)),
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
              icon: Icon(Icons.close, color: Colors.yellow, size: 30),
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
