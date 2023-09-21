import 'package:flutter/material.dart';
import 'package:kot/deals/presentation/widgets/custom_button.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({
    required this.title,
    required this.message,
    required this.assetPath,
    required this.buttonChild,
    this.onTap,
    super.key,
  });
  final String title;
  final String message;
  final String assetPath;
  final Widget buttonChild;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 78.0, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Text(message),
                  ),
                ],
              ),
            ),
            Image.asset(
              assetPath,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomFilledButton(
                onPressed: onTap,
                child: buttonChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
