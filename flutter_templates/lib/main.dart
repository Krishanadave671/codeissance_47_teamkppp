import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates/common/widgets/error.dart';
import 'package:flutter_templates/common/widgets/loading.dart';
import 'package:flutter_templates/features/auth/controller/auth_controller.dart';
import 'package:flutter_templates/features/auth/screen/login_screen.dart';
import 'package:flutter_templates/features/landing/landing_screen.dart';
import 'package:flutter_templates/features/screens/home_page.dart';
import 'package:flutter_templates/features/screens/screen/disasterscreen.dart';
import 'package:flutter_templates/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const DisasterScreen();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
    );
  }

  // Login page
}
