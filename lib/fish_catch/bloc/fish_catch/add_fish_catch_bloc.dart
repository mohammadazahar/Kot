import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../repository/add_fish_catch_repo.dart';
import 'add_fish_catch_event.dart';
import 'add_fish_catch_state.dart';

class AddFishCatchBloc extends Bloc<AddFishCatchEvent, AddFishCatchState> {
  final AddFishCatchRepository addFishCatchRepo = AddFishCatchRepository();
  AddFishCatchBloc(AddFishCatchRepository addFishCatchRepository)
      : super(AddFishCatchInitial()) {
    on<FetchAddFishCatchEventEvent>((event, emit) async {
      emit(AddFishCatchLoadingState());
      try {
        final addFishCatch = await addFishCatchRepository.postFishCatchApi(
            name: event.name,
            dateOfCatch: event.dateOfCatch,
            timeOfCatch: event.timeOfCatch,
            weight: event.weight,
            length: event.length,
            method: event.method,
            description: event.description,
            position: event.position,
            lat: event.lat,
            lng: event.lng,
            address: event.address,
            images: event.images,
            videos: event.videos,
            species: event.species,
            likes: event.likes,
            createdBy: event.createdBy,
            modifiedBy: event.modifiedBy);
        if (addFishCatch != null) {
          emit(AddFishCatchLoadedState(addFishCatch));
        }
      } catch (e) {
        emit(AddFishCatchErrorState("No AddFishCatchDetails Found"));
      }
    });
  }
}
