import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ad_banner_cubit.dart';
part 'ad_banner_state.dart';

class AdBanners extends StatefulWidget {
  const AdBanners({super.key});

  @override
  State<AdBanners> createState() => _AdBannersState();
}

class _AdBannersState extends State<AdBanners> {
  late ScrollController controller;
  int bannerCount = 3;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocProvider(
        create: (context) => AdBannerCubit(),
        child: BlocConsumer<AdBannerCubit, int>(
          listener: (context, state) {},
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: state == 0
                        ? null
                        : () {
                            context.read<AdBannerCubit>().previous();
                            controller.animateTo(
                              controller.offset -
                                  MediaQuery.of(context).size.width * 0.7,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: state == 0 ? Colors.transparent : Colors.black,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.7 - 7,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: bannerCount,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width:
                                  MediaQuery.of(context).size.width * 0.7 - 23,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: state == bannerCount - 1
                        ? null
                        : () {
                            context.read<AdBannerCubit>().next();
                            controller.animateTo(
                              controller.offset +
                                  (MediaQuery.of(context).size.width * 0.7),
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: state == bannerCount - 1
                          ? Colors.transparent
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
