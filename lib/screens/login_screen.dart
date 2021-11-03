import 'package:fingerprin_voting_app/services/auth.dart';
import 'package:fingerprin_voting_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try{
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async{
    final isAvailable = await hasBiometrics();
    try{
      return await _auth.authenticate(
        localizedReason: 'Scan fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
    } on PlatformException catch (e) {
      return false;
    }
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String _password = "";
  bool _obscureText = true;
  final AuthService _auth = AuthService();


  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login screen"),
      ),
      key: const Key('LoginScreen'),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("email"),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
              setState(() {
              email = value;
              });
              }
              ),
              const SizedBox(height: 16),
              const Text("Password"),
              const SizedBox(height: 16),
              TextField(
                obscureText: _obscureText,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
              setState(() {
                _password = value;
              });
              }
              ),
              TextButton(
                onPressed: _togglePasswordVisibility,
                child: Row(children: [
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  const SizedBox(width: 8),
                  Text(_obscureText ? "Show password" : "Hide password")
                ]),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 56,
                    width: 186,
                    child: ElevatedButton(
                        onPressed: (email.isEmpty == true || _password.isEmpty == true)
                            ? null
                            : () async {
                            Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: const Text("Login")
                    ),
                  ),
                  const SizedBox(width: 3, height: 3),
                  SizedBox(
                    height: 56,
                    width: 186,
                    child: ElevatedButton(
                        onPressed: () async {
                          final isAuthenticated = await LocalAuthApi.authenticate();
                          if(isAuthenticated){
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        child: const Text("Login with fingerprint")
                    ),
                  ),
                ]
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                      // Navigator.pushReplacementNamed(context, '/registerscreen');
                    },
                    child: const Text("Need an account? Register here")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
