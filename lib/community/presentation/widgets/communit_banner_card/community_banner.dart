import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kot/community/data/model/recommented_group.dart';

part 'community_banner_cubit.dart';

part 'community_banner_state.dart';

class CommunityCardBanners extends StatefulWidget {
  final List<RecommendedCommunities> groupData;

  const CommunityCardBanners({super.key, required this.groupData});

  @override
  State<CommunityCardBanners> createState() => _CommunityCardBannersState();
}

class _CommunityCardBannersState extends State<CommunityCardBanners> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          if (selectedIndex != 0)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (selectedIndex > 0) {
                  setState(() {
                    selectedIndex--;
                  });
                }
              },
            ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.groupData.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child:
                        Image.network(widget.groupData[index].coverPhoto ?? ""),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              if (selectedIndex < widget.groupData.length - 1) {
                setState(() {
                  selectedIndex++;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
