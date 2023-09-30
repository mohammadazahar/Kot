import 'package:flutter/material.dart';
import 'package:kot/authtentication/presentation/pages/intro_screens.dart';
import 'package:kot/authtentication/presentation/pages/register_otp_page.dart';
import 'package:kot/authtentication/presentation/pages/singin_page.dart';
import 'package:kot/authtentication/presentation/pages/splash_screen.dart';
import 'package:kot/authtentication/presentation/pages/thank_you_screen.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/presentation/pages/activity_selection.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';
import 'package:kot/boat_booking/presentation/pages/boat_calendar_new.dart';
import 'package:kot/boat_booking/presentation/pages/boat_calender.dart';
import 'package:kot/boat_booking/presentation/pages/boat_details.dart';
import 'package:kot/boat_booking/presentation/pages/boat_listing.dart';
import 'package:kot/boat_booking/presentation/pages/boat_recommendation_screen.dart';
import 'package:kot/boat_booking/presentation/pages/boat_type.dart';
import 'package:kot/boat_booking/presentation/pages/close_order_screen.dart';
import 'package:kot/boat_booking/presentation/pages/depature_time_screen.dart';
import 'package:kot/boat_booking/presentation/pages/open_order_screen.dart';
import 'package:kot/boat_booking/presentation/widgets/add_screen.dart';
import 'package:kot/boat_booking/presentation/widgets/search_screen.dart';
import 'package:kot/community/presentation/pages/communtity_screen.dart';
import 'package:kot/community/presentation/pages/create_group.dart';
import 'package:kot/community/presentation/pages/edit_group.dart';
import 'package:kot/constants_values.dart';

import 'package:kot/dashboard/map.dart';
import 'package:kot/dashboard/navigation_screen.dart';
import 'package:kot/deals/presentation/pages/cart_page.dart';
import 'package:kot/deals/presentation/pages/checkout.dart';
import 'package:kot/deals/presentation/pages/deals.dart';
import 'package:kot/deals/presentation/pages/deals_thanks_scren_deals.dart';
import 'package:kot/deals/presentation/pages/oders_detailed.dart';
import 'package:kot/deals/presentation/pages/order_history.dart';
import 'package:kot/deals/presentation/pages/product_details.dart';
import 'package:kot/deals_new/components/cart_page.dart';
import 'package:kot/deals_new/components/checkout.dart';
import 'package:kot/deals_new/components/oders_detailed.dart';
import 'package:kot/deals_new/components/order_history.dart';
import 'package:kot/deals_new/deals.dart';
import 'package:kot/fish_catch/fish_catch_dialog1.dart';
import 'package:kot/fish_catch/fish_catch_edit_dialog.dart';
import 'package:kot/fish_catch/image_dialog.dart';
import 'package:kot/fish_catch/weather_card.dart';
import 'package:kot/fishcharter/pages/fishCarcter_mainScreen.dart';
import 'package:kot/fishcharter/pages/fish_catcher_payment.dart';
import 'package:kot/fishcharter/pages/fish_charter_cloder.dart';
import 'package:kot/fishcharter/pages/fish_charter_detail2.dart';
import 'package:kot/fishcharter/pages/fish_charter_detail_screen.dart';
import 'package:kot/fishcharter/pages/fish_charter_screen1.dart';
import 'package:kot/fishcharter/pages/fish_charter_search_screen.dart';
import 'package:kot/fishcharter/pages/fish_charterthanks_scren.dart';
import 'package:kot/fishcharter/pages/fishcharter_history.dart';
import 'package:kot/fishcharter/pages/fissh_cather_list.dart';
import 'package:kot/nav/nav_bar.dart';
import 'package:kot/nav/navbar1.dart';
import 'package:kot/post/view/add_post.dart';
import 'package:kot/post/view/edit_post.dart';
import 'package:kot/post/view/recent_posts.dart';
import 'package:kot/tournaments/details.dart';
import 'package:kot/tournaments/history.dart';
import 'package:kot/tournaments/join.challenge.dart';
import 'package:kot/tournaments/my_tournaments.dart';
import 'package:kot/tournaments/tournament.home.dart';

import 'authtentication/data/model/register_otp_params_model.dart';
import 'boat_booking/presentation/pages/boat_inquiry_screen.dart';
import 'boat_booking/presentation/pages/boat_query_screen.dart';
import 'boat_booking/presentation/pages/boat_query_screen1.dart';
import 'boat_booking/presentation/pages/boat_query_two_screen.dart';
import 'boat_booking/presentation/pages/booking_enquiry_first.dart';
import 'boat_booking/presentation/pages/thanks_scren.dart';
import 'dashboard/message.dart';
import 'fish_catch/page/intrest_page.dart';
import 'fish_catch/page/map_page.dart';
import 'profiles/presentation/pages/app_setting_screen.dart';
import 'profiles/presentation/pages/faqs_screen.dart';
import 'profiles/presentation/pages/profile_screen.dart';
import 'profiles/presentation/pages/userProfile.dart';
import 'tournaments/leaderboard.dart';
import 'tournaments/thanks_screen_tournament.dart';

class MyRouters {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String INTROSCREEN = '/introscreen';
  static const String REGISTER = '/register';
  static const String REGISTER_OTP = '/register_otp';
  static const String THANKYOU = '/thankYou';
  static const String COMMUNITYsCREEN = '/CommunityScreen';
  static const String Message_Screen = '/MessageScreen';
  static const String MAP = '/Map';
  static const String Add = '/add';
  static const String DEALS = '/deals';
  static const String SEARCH = '/search';
  static const String fish_intrestPage = '/fish_intrestPage';
  static const String fish_mapPage = '/fish_mapPage';
  static const String fish_detailPage = '/fish_detailPage';
  static const String fish_catchDialog1 = '/fish_catchDialog1';
  static const String fish_catch_editDialog = '/fish_catch_editDialog';
  static const String fish_imageDialog = '/fish_imageDialog';
  static const String NAV = '/nav';
  static const String BOAT_TYPE = '/boatType';
  static const String boatListing = '/boat_listing';
  static const String boatQueryScreenOne = '/boat_query_one';
  static const String boatQueryScreenTwo = '/boat_query_Two';
  static const String boatRecommendation = '/boat_recommendation';
  static const String boatInquiryScreenFirst = '/boat_inquiry_first';
  static const String boatInquiryScreenOne = '/boat_inquiry_one';
  static const String thanksScreen = '/thanks_screen';
  static const String thanksScreenTournament = '/thanksScreenTournament';
  static const String openOrderScreen = '/open_order';
  static const String fishCharterHistoryScreen = '/fishCharterHistory';
  static const String fishCloseOrderScreen = '/fishCloseOrderScreen';
  static const String closeOrderScreen = '/close_order';
  static const String BOAT_DETAILS = '/boat_detail_screen';
  static const String BOAT_Calender = '/boat_details';
  static const String BOAT_Calender_new = '/boat_calendar_new';
  static const String dealsCartPage = '/dealsCartPage';
  static const String dealsCheckoutPage = '/dealsCheckoutPage';
  static const String dealsOderDetailsPage = '/dealsOderDetailsPage';
  static const String dealsOrderHistoryPage = '/dealsOrderHistoryPage';
  static const String dealsProductDetailsPage = '/dealsProductDetailsPage';
  static const String dealsThanksPage = '/dealsThanksPage';
  static const String creatingGroupScreen = '/CreatingGroupScreen';
  static const String userProfileScreen = '/userProfileScreen';
  static const String profileScreen = '/profileScreen';
  static const String appSettingScreen = '/appSettingScreen';
  static const String faqsScreen = '/faqsScreen';
  static const String myTournamentScreen = '/myTournamentScreen';
  static const String editGroupPost = '/editGroupPost';
  static const String fishcharterHistory = '/fishcharterHis';
  static const String fishCatcherListing = '/fishCatcherListing';
  static const String weatherPage = '/weatherPage';

  static const String addPostScreen = '/addPostScreen';
  static const String editPostScreen = '/editPostScreen';
  static const String recentPostScreen = '/recentPostScree';
  static const String fishcharterDetail = '/fishcharterDetailScreen';
  static const String fishcharterDetail2 = '/fishcharterDetail2';
  static const String fishCatcherPayment = '/fishCatcherPayment';
  static const String fishCharSearchScreen = '/FishCharterSearchScreen';
  static const String fishCharMainpPage = '/fishCharMainpPage';
  static const String depTimeScreen = '/depTimeScreen';
  static const String fishCatcherScreen1 = '/fishCatcherScr';
  static const String myScreen = '/myScreen';
  static const String myTournamentHistoryScreen = '/myTournamentHistoryScreen';
  static const String myTournamentLeaderBoardScreen =
      '/myTournamentLeaderBoardScreen';
  static const String myTournamentDetailedScreen =
      '/myTournamentDetailedScreen';
  static const String myTournamentJoinChallengeScreen =
      '/myTournamentJoinChallengeScreen';
  static const String myTournamentRequestCardScreen =
      '/myTournamentRequestCardScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    getCurrentScreenInformation(settings.name ?? "/");
    switch (settings.name) {
      case NAV:
        return MaterialPageRoute(
          settings: RouteSettings(name: NAV),
          builder: (context) {
            return NavScreen1();
          },
        );

      case REGISTER:
        return MaterialPageRoute(
          builder: (context) {
            return SingInPage();
          },
        );
      case fishCharSearchScreen:
        return MaterialPageRoute(
          builder: (context) {
            return FishCharterSearchScreen();
          },
        );
      case fishCharMainpPage:
        return MaterialPageRoute(
          builder: (context) {
            return FishCharterMainScreen();
          },
        );

      case editGroupPost:
        return MaterialPageRoute(
          builder: (context) {
            return EditGroup();
          },
        );
      case dealsProductDetailsPage:
        return MaterialPageRoute(
          builder: (context) {
            return ProductDetails();
          },
        );
      case myTournamentScreen:
        return MaterialPageRoute(
          builder: (context) {
            return TournamentHomeScreen();
          },
        );
      case fishCatcherListing:
        return MaterialPageRoute(
          builder: (context) {
            return FishCatcherList();
          },
        );
      case weatherPage:
        return MaterialPageRoute(
          builder: (context) {
            return WeatherCard();
          },
        );

      case SEARCH:
        return MaterialPageRoute(
          builder: (context) {
            return SearchScreen();
          },
        );
      case fish_intrestPage:
        return MaterialPageRoute(
          builder: (context) {
            return IntrestPage();
          },
        );
      case fishCatcherPayment:
        return MaterialPageRoute(
          builder: (context) {
            return FishCatcherPayment();
          },
        );
      case fishCatcherScreen1:
        return MaterialPageRoute(
          builder: (context) {
            return FishCharterScreen1();
          },
        );
      case depTimeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return DepatureTimeScreen();
          },
        );
      case fish_intrestPage:
        return MaterialPageRoute(
          builder: (context) {
            return IntrestPage();
          },
        );
      case fishcharterHistory:
        return MaterialPageRoute(
          builder: (context) {
            return FishCharterThanksScreen();
          },
        );

      case fishcharterDetail:
        return MaterialPageRoute(
          builder: (context) {
            return FishcharterDetailScreen();
          },
        );

      case fishcharterDetail2:
        return MaterialPageRoute(
          builder: (context) {
            return FishCharterDetail2();
          },
        );
      case fish_mapPage:
        return MaterialPageRoute(
          builder: (context) {
            return MapPage();
          },
        );
      case fish_catchDialog1:
        return MaterialPageRoute(
          builder: (context) {
            return FishCatchDialog();
          },
        );
      case fish_catch_editDialog:
        return MaterialPageRoute(
          builder: (context) {
            return FishCatchEditDialog();
          },
        );
      case fish_imageDialog:
        return MaterialPageRoute(
          builder: (context) {
            return ImageDialog();
          },
        );

      case Message_Screen:
        return MaterialPageRoute(
          builder: (context) {
            return MessageScreen();
          },
        );
      case myTournamentLeaderBoardScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LeaderboardScreen();
          },
        );
      case BOAT_Calender:
        return MaterialPageRoute(
          builder: (context) {
            return BoatCalender(settings.arguments as BoatBookingParams);
          },
        );
      case dealsCartPage:
        return MaterialPageRoute(
          builder: (context) {
            return CartPage();
          },
        );
      case dealsCheckoutPage:
        return MaterialPageRoute(
          builder: (context) {
            return CheckoutPage();
          },
        );
      case dealsOderDetailsPage:
        return MaterialPageRoute(
          builder: (context) {
            return OrderDetailsPage();
          },
        );
      case dealsThanksPage:
        return MaterialPageRoute(
          builder: (context) {
            return DealsThanksScreen();
          },
        );
      case dealsOrderHistoryPage:
        return MaterialPageRoute(
          builder: (context) {
            return OrderHistory();
          },
        );
      // case dealsProductDetailsPage:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProductDetails();
      //     },
      //   );
      case myTournamentDetailedScreen:
        return MaterialPageRoute(
          builder: (context) {
            return TournamentDetailsScreen();
          },
        );
      case myTournamentHistoryScreen:
        return MaterialPageRoute(
          builder: (context) {
            return TournamentHistoryScreen();
          },
        );
      case myTournamentJoinChallengeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return JoinTournamentScreen();
          },
        );
      case myTournamentRequestCardScreen:
        return MaterialPageRoute(
          builder: (context) {
            return MyTournamentScreen();
          },
        );
      case BOAT_Calender_new:
        return MaterialPageRoute(
          builder: (context) {
            return BoatCalenderNew(settings.arguments as BoatBookingParams);
          },
        );
      case Add:
        return MaterialPageRoute(
          builder: (context) {
            return ActivitySelection();
          },
        );
      case appSettingScreen:
        return MaterialPageRoute(
          builder: (context) {
            return AppSettingScreen();
          },
        );
      case addPostScreen:
        return MaterialPageRoute(builder: (context) {
          return AddPost();
        });
      case editPostScreen:
        return MaterialPageRoute(builder: (context) {
          return EditPost();
        });
      case recentPostScreen:
        return MaterialPageRoute(builder: (context) {
          return RecentPosts();
        });

      case DEALS:
        return MaterialPageRoute(
          builder: (context) {
            return DealScreen();
          },
        );
      case MAP:
        return MaterialPageRoute(
          builder: (context) {
            return MapScreen();
          },
        );
      case REGISTER_OTP:
        return MaterialPageRoute(builder: (context) {
          return RegisterOtpPage(settings.arguments as RegisterOtpParams);
        });
      case BOAT_TYPE:
        return MaterialPageRoute(builder: (context) {
          return BoatType();
        });
      case boatListing:
        return MaterialPageRoute(builder: (context) {
          return BoatListingScreen(settings.arguments as BoatBookingParams);
        });
      case boatQueryScreenOne:
        return MaterialPageRoute(builder: (context) {
          return BoatBookingScreen(settings.arguments as BoatBookingParams);
        });

      case boatQueryScreenTwo:
        return MaterialPageRoute(builder: (context) {
          return BoatBookingSecondScreen2(
              settings.arguments as BoatBookingParams);
        });

      case boatRecommendation:
        return MaterialPageRoute(builder: (context) {
          return BoatRecommendationScreen(
              settings.arguments as BoatBookingParams);
        });
      case boatInquiryScreenOne:
        return MaterialPageRoute(builder: (context) {
          return BoatInquiryScreen(settings.arguments as BoatBookingParams);
        });
      case boatInquiryScreenFirst:
        return MaterialPageRoute(builder: (context) {
          return BookingInquiryFirst(settings.arguments as BoatBookingParams);
        });

      case thanksScreen:
        return MaterialPageRoute(builder: (context) {
          return ThanksScreen();
        });
      case thanksScreenTournament:
        return MaterialPageRoute(builder: (context) {
          return ThanksScreenTournament();
        });

      case openOrderScreen:
        return MaterialPageRoute(builder: (context) {
          return OpenOrderScreen();
        });
      case fishCharterHistoryScreen:
        return MaterialPageRoute(builder: (context) {
          return FishCharterHistoryScreen();
        });

      case closeOrderScreen:
        return MaterialPageRoute(builder: (context) {
          return CloseOrderScreen();
        });
      case fishCloseOrderScreen:
        return MaterialPageRoute(builder: (context) {
          return FIshCatcherCloseOrderScreen();
        });

      case THANKYOU:
        return MaterialPageRoute(
            settings: const RouteSettings(name: THANKYOU),
            builder: (context) {
              return const ThankYouScreen();
            });
      case INTROSCREEN:
        return MaterialPageRoute(
            settings: const RouteSettings(name: INTROSCREEN),
            builder: (context) {
              return IntoScreens();
            });
      case COMMUNITYsCREEN:
        return MaterialPageRoute(
            settings: const RouteSettings(name: COMMUNITYsCREEN),
            builder: (context) {
              return CommunityScreen();
            });

      case faqsScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: faqsScreen),
            builder: (context) {
              return FaqsScreen();
            });

      case creatingGroupScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: creatingGroupScreen),
            builder: (context) {
              return CreateGroup();
            });

      case userProfileScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: userProfileScreen),
            builder: (context) {
              return UserProfile();
            });
      case profileScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: profileScreen),
            builder: (context) {
              return ProfileScreen();
            });

      case BOAT_DETAILS:
        return MaterialPageRoute(
          builder: (context) {
            return BoatDetails(settings.arguments as BoatBookingParams);
          },
        );
      case LOGIN:
        return MaterialPageRoute(
            settings: const RouteSettings(name: LOGIN),
            builder: (context) {
              return const SingInPage();
            });

      case SPLASH:
        return MaterialPageRoute(builder: (context) {
          return DealScreen();
        });

      default:
        return MaterialPageRoute(
            settings: RouteSettings(name: SPLASH),
            builder: (context) {
              return DealScreen();
            });
    }
  }

  static getCurrentScreenInformation(String routeName) {
    String name = routeName.replaceFirst("/", "");
    switch (name) {
      case "":
        ConstantsValues.currentScreeName = SPLASH.replaceFirst("/", "");
        break;

      case "nav":
        ConstantsValues.currentScreeName =
            COMMUNITYsCREEN.replaceFirst("/", "");
        break;

      default:
        ConstantsValues.currentScreeName = name;
    }
  }
}
