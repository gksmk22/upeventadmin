import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upeventadmin/screens/homescreen.dart';
import 'package:upeventadmin/screens/loginscreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const UPEventAdmin());
}

class UPEventAdmin extends StatefulWidget {
  const UPEventAdmin({super.key});

  @override
  State<UPEventAdmin> createState() => _UPEventAdminState();
}

class _UPEventAdminState extends State<UPEventAdmin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UPEvent Admin",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return const HomeScreen();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return const LoginScreen();
          }),
    );
  }
}
