import 'package:flutter/material.dart';
import 'package:kot/deals/presentation/widgets/custom_button.dart';
import 'package:kot/tournaments/leaderboard.dart';

class ChallengeRequestCard extends StatelessWidget {
  const ChallengeRequestCard({
    super.key,
    this.isApproved = true,
  });

  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      semanticContainer: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.asset(
                'assets/images/tBanner.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Challenge Name',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Challenge Name',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF74B9FF),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // datetime
                Text(
                  DateTime.now().toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Price \$200',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF74B9FF),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: CustomFilledButton(
                onPressed: isApproved ? () {} : null,
                child: Text(isApproved ? 'Accepted' : 'Pending'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
