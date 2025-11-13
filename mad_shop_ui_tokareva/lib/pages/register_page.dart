import 'package:flutter/material.dart';
import 'package:mad_shop_ui_tokareva/pages/home_page.dart';
import 'package:mad_shop_ui_tokareva/widgets/action_button.dart';
import 'package:mad_shop_ui_tokareva/pages/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final phoneInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Create.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 120),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create\nAccount',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 120),
                TextField(
                  controller: emailInput,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordInput,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: phoneInput,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Your number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                ActionButton(
                  text: 'Done',
                  onPressed: () {
                    if (emailInput.text.isNotEmpty &
                        passwordInput.text.isNotEmpty &
                        phoneInput.text.isNotEmpty)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                ),
                SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginEmailPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Have an account? Login',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailInput.dispose();
    passwordInput.dispose();
    phoneInput.dispose();
    super.dispose();
  }
}
