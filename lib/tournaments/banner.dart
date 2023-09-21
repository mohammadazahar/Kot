import 'package:flutter/material.dart';

class TournamentBanner extends StatelessWidget {
  const TournamentBanner({
    super.key,
    required this.bannerName,
    required this.onTap,
  });
  final GestureTapCallback onTap;

  final String bannerName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 24,
                height: 210,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/tBanner.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 0,
              left: 0,
              child: Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(78),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    bannerName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF74B9FF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
