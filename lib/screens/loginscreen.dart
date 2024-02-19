import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool _isloading = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
    _isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UP Event Admin Panel"),
          actions: [
            _isloading
                ? const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator()),
                  )
                : Container(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "example@gmail.com",
                    icon: const Icon(Icons.email_outlined),
                    labelText: "Email"),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    icon: const Icon(Icons.password_outlined),
                    hintText: "Password",
                    labelText: "Password"),
              ),
              TextButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      auth.sendPasswordResetEmail(email: emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Check your mail.")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Please enter your email for password reset.")));
                    }
                  },
                  child: const Text("Forgot your password?")),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.length > 6) {
                        login();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Email is empty or password is invalid")));
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: Text("Log-in"))),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const Dialog(
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    "Send a mail on this : area22gml@gmail.com",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: const Text("Get help!"),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> login() async {
    setState(() {
      _isloading = true;
    });
    try {
      auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (er) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(er.toString())));
    }
  }
}
