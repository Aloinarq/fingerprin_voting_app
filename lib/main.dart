import 'package:fingerprin_voting_app/providers/poll_provider.dart';
import 'package:fingerprin_voting_app/screens/candidates_screen.dart';
import 'package:fingerprin_voting_app/screens/home_screen.dart';
import 'package:fingerprin_voting_app/screens/register_screen.dart';
import 'package:fingerprin_voting_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FingerVoteApp());
}

class FingerVoteApp extends StatelessWidget {
  const FingerVoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        var pollProvider = PollProvider();
        pollProvider.loadPollList();
        return pollProvider;
      },
      child: MaterialApp(
        home: const Wrapper(),
        initialRoute: "/",
        routes: {
          '/polls': (context) => Scaffold(
                appBar: AppBar(
                  title: const Text("Polls screen"),
                ),
                body: const HomeScreen(),
              ),
          '/registerscreen': (context) => Scaffold(
                appBar: AppBar(
                  title: const Text("Register screen"),
                ),
                body: const RegisterScreen(),
              ),
          '/polls/candidates': (context) => Scaffold(
                appBar: AppBar(
                  title: const Text("Candidates screen"),
                ),
                body: CandidatesScreen(
                  actualID: '',
                ),
              )
        },
      ),
    );
  }
}
