import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisasterScreen extends ConsumerStatefulWidget {
  static const routeName = '/disaster-screen';
  const DisasterScreen({super.key});

  @override
  ConsumerState<DisasterScreen> createState() => _DisasterScreenState();
}

class _DisasterScreenState extends ConsumerState<DisasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
