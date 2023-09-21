import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kot/profiles/presentation/bloc/profile_event.dart';
import 'package:kot/profiles/presentation/bloc/profile_state.dart';
import 'package:meta/meta.dart';

import '../../data/repository/profile_repo.dart';


class ProfileBloc
    extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository = ProfileRepository();
  ProfileBloc(ProfileRepository profileRepository) : super(ProfileLoadingState()) {
    on<FetchProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final profileApi = await profileRepository.callPostProfileApi(id: event.id,
          firstName: event.firstName,
          lastName: event.lastName,
          address: event.address,
          zip: event.zip,
          city: event.city,
          photo: event.photo,
          interests: event.interests,
          auto_play: event.auto_play,
          mobile_data: event.mobile_data,
          wifi: event.wifi,
          push: event.push,
          mail: event.mail,
          sms: event.sms,
          community_notifications: event.community_notifications,
          daily_briefing: event.daily_briefing,
          notification_from_followers: event.notification_from_followers,
          notify_nearby_hotspots: event.notify_nearby_hotspots

        );
        if (profileApi != null) {
          emit(ProfileLoadedState(profileApi));
        }
      } catch (e) {
        emit(ProfileErrorState("No ProfileDetails Found"));
      }
    });
  }
}// "_id": "64b57a4b30eb00393e49b530",
// "firstName": "Sagar",
// "lastName": "KOT",
// "address": "Hyd street ",
// "zip": "009966",
// "city": "Hyderabad",
// "photo": "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
// "interests": ["64e46514f2df61197c765389","64e464c3f78397034ee426ba","64e497f0c5ffb8fbc19c8220"],
// "auto_play": true,
// "mobile_data": false,
// "wifi": true,
// "push": true,
// "mail": false,
// "sms": true,
// "community_notifications": false,
// "daily_briefing": true,
// "notify_nearby_hotspots": true,
// "notification_from_followers": true