import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonationScreen extends ConsumerStatefulWidget {
  static const routeName = '/donation-screen';
  const DonationScreen({super.key});

  @override
  ConsumerState<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends ConsumerState<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
