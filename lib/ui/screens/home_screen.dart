import 'package:essumin_mix/ui/widgets/start_popup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(150, 35),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const StartPopup(),
                );
              },
              child: const Text('Siglas'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(150, 35),
                ),
              ),
              onPressed: null,
              child: const Text('Simbologias'),
            ),
          ],
        ),
      ),
    );
  }
}
