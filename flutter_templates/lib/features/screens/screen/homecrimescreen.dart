import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCrimeScreen extends ConsumerStatefulWidget {
  static const routeName = '/homecrime-screen';
  const HomeCrimeScreen({super.key});

  @override
  ConsumerState<HomeCrimeScreen> createState() => _HomeCrimeScreenState();
}

class _HomeCrimeScreenState extends ConsumerState<HomeCrimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
