import 'package:flutter/material.dart';
import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:kot/my_routes.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      semanticContainer: false,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.asset(
              'assets/images/tBanner.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Tournament Name',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 10),
                // time
                Expanded(
                  child: Text(
                    DateTime.now().toString(),
                    style: const TextStyle(
                      color: Color(0xFF74B9FF),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Challenge Details',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: CustomFilledButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRouters.myTournamentJoinChallengeScreen);
              },
              child: const Text('Join Challenge'),
            ),
          ),
        ],
      ),
    );
  }
}
