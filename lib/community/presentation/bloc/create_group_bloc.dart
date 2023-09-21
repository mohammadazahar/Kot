// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lovely_s_application3/presentation/creating_group_screen/models/creating_group_model.dart';
// part 'creating_group_event.dart';
// part 'creating_group_state.dart';
//
// /// A bloc that manages the state of a CreatingGroup according to the event that is dispatched to it.
// class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
//   CreateGroupBloc(CreateGroupState initialState) : super(initialState) {
//     on<CreateGroupInitialEvent>(_onInitialize);
//   }
//
//   _onInitialize(
//     CreatingGroupInitialEvent event,
//     Emitter<CreatingGroupState> emit,
//   ) async {
//     emit(state.copyWith(
//         nameController: TextEditingController(),
//         descriptionController: TextEditingController(),
//         locationController: TextEditingController(),
//         addgrouptopicsController: TextEditingController(),
//         addpeopleController: TextEditingController(),
//         privateController: TextEditingController()));
//   }
// }
