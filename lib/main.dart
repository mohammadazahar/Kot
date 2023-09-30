import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kot/core/util/shared_preference_call.dart';
import 'package:kot/core/utils/initial_bindings.dart';
import 'package:kot/fish_catch/bloc/fish_catch/add_fish_catch_bloc.dart';
import 'package:kot/fish_catch/bloc/interest_bloc.dart';
import 'package:kot/fish_catch/repository/add_fish_catch_repo.dart';
import 'package:kot/fish_catch/repository/interst_repo.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/profiles/data/repository/profile_repo.dart';
import 'package:kot/profiles/presentation/bloc/profile_bloc.dart';
import 'package:sizer/sizer.dart';
import 'custom_color.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceInit.initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColor.colorPrimary, // status bar color
      statusBarBrightness: Brightness.dark, //status bar Brightness
      statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    ));
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => CategoryBloc(CategoryRepository())),
          BlocProvider(create: (context) => ProfileBloc(ProfileRepository())),
          BlocProvider(create: (context) => InterestBloc(InterestRepository())),
          BlocProvider(
              create: (context) => AddFishCatchBloc(AddFishCatchRepository())),
        ],
        child: GetMaterialApp(
          title: 'KOT',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            //   fontFamily: 'Poppins',
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: CustomColor.acceptButton, //thereby
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.acceptButton),
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: CustomColor.colorPrimary),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouters.generateRoute,
          navigatorObservers: [routeObserver],
          initialBinding: AppBindings(),
          //    initialRoute: MyRouters.SPLASH,
        ),
      );
    });
  }
}
