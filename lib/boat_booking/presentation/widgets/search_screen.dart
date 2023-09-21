import 'package:flutter/material.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';

class SearchScreen extends StatefulWidget {
  final String mowId;
  SearchScreen([this.mowId = ""]);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // SearchParamsModel searchParamsModel = SearchParamsModel();
  FocusNode _focus = new FocusNode();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    MyRouters.getCurrentScreenInformation(MyRouters.SEARCH);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border:
                      Border.all(color: CustomColor.searchBarColor, width: 1)),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
                child: _searchWidget(),
              ),
            ),
            // StreamBuilder<LoaderState>(
            //   stream: searchBloc.loaderState.stream,
            //   builder: (context, AsyncSnapshot<LoaderState> snapshot) {
            //     if (snapshot.data == LoaderState.LOADING) {
            //       return Container(
            //         margin: EdgeInsets.symmetric(horizontal: 15),
            //         child: LinearProgressIndicator(),
            //       );
            //     }
            //     return SizedBox();
            //   },
            // ),
            Expanded(child: _getBody()),
          ],
        ),
      ),
    );
  }

  _searchWidget() {
    return TextFormField(
      autofocus: true,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (value) {
        // String params  = jsonEncode({
        //   "mowId": widget.mowId,
        //   "query": value
        // });
      },
      //   controller: _searchController,
      onChanged: (text) {
        // searchBloc.setSearchState(text);
      },
      //  focusNode: _focus,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        prefixIconConstraints: BoxConstraints(
          minHeight: 40,
          maxHeight: 40,
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 40,
          maxHeight: 40,
        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.wrong_location),
        hintText: "Search",
        hintStyle: TextStyle(
            color: CustomColor.colorGreyLight,
            fontWeight: FontWeight.normal,
            fontSize: 16),
      ),
    );

    //   StreamBuilder<SearchState>(
    //   stream: searchBloc.searchState.stream,
    //   initialData: searchBloc.defaultItem,
    //   builder: (context, AsyncSnapshot<SearchState> snapshot) {
    //     return TextFormField(
    //       autofocus: true,
    //       textAlign: TextAlign.start,
    //       textInputAction: TextInputAction.search,
    //       onFieldSubmitted: (value) {
    //         // String params  = jsonEncode({
    //         //   "mowId": widget.mowId,
    //         //   "query": value
    //         // });
    //         searchParamsModel.mow = widget.mowId;
    //         searchParamsModel.query = value;
    //         FacebookAppEvent.facebookEvent(
    //             name: "search", params: {"query": value});
    //         Navigator.pushNamed(context, MyRouters.SEARCH_PRODUCT,
    //             arguments: searchParamsModel);
    //       },
    //       controller: _searchController,
    //       onChanged: (text) {
    //         searchBloc.setSearchState(text);
    //       },
    //       focusNode: _focus,
    //       decoration: InputDecoration(
    //         border: InputBorder.none,
    //         isDense: true,
    //         prefixIconConstraints: BoxConstraints(
    //           minHeight: 40,
    //           maxHeight: 40,
    //         ),
    //         suffixIconConstraints: BoxConstraints(
    //           minHeight: 40,
    //           maxHeight: 40,
    //         ),
    //         prefixIcon: _prefixIcon(snapshot.data!),
    //         suffixIcon: _searchController.text.isNotEmpty
    //             ? _suffixIcon(snapshot.data!)
    //             : _suffixCameraIcon(),
    //         hintText: ("Search"),
    //         hintStyle: TextStyle(
    //             color: CustomColor.colorGreyLight,
    //             fontWeight: FontWeight.normal,
    //             fontSize: 16),
    //       ),
    //     );
    //   },
    // );
  }

  // _prefixIcon(SearchState searchState) {
  //   if (searchState == SearchState.EMPTY) {
  //     return Padding(
  //       padding: const EdgeInsets.only(left: 8, right: 5, top: 1),
  //       child: Icon(
  //         Icons.search,
  //         color: CustomColor.colorBlack,
  //         size: 22,
  //       ),
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 5),
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.pop(context);
  //         },
  //         child: Icon(
  //           Icons.arrow_back,
  //           color: CustomColor.colorBlack,
  //           size: 20,
  //         ),
  //       ),
  //     );
  //   }
  // }
  //
  // _suffixIcon(SearchState searchState) {
  //   if (searchState == SearchState.EMPTY) {
  //     return Visibility(
  //       visible: false,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 5),
  //         child: InkWell(
  //           onTap: () {},
  //           child: Icon(
  //             Icons.mic,
  //             color: CustomColor.colorBlack,
  //             size: 20,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 5),
  //       child: InkWell(
  //         onTap: () {
  //           MyRouters.getCurrentScreenInformation(MyRouters.SEARCH);
  //           _searchController.clear();
  //           searchBloc.setSearchState(_searchController.text);
  //         },
  //         child: Icon(
  //           Icons.close,
  //           color: CustomColor.colorBlack,
  //           size: 20,
  //         ),
  //       ),
  //     );
  //   }
  // }
  //
  // _suffixCameraIcon() {
  //   return Builder(builder: (c) {
  //     return IconButton(
  //       onPressed: () {
  //         PopupHelper().cameraOverlayWidget(c);
  //         FirebaseAppEvents.customEvent(
  //             eventName: FirebaseEventsValues.ClickOnCameraIcon);
  //         //  mixPanelServices.trackEvent( MixpanelValues.ClickOnCameraIconInSearchBarPage);
  //       },
  //       icon: SvgPicture.asset(
  //         "assets/camera.svg",
  //         height: 20,
  //         width: 20,
  //       ),
  //     );
  //   });
  // }

  _getBody() {
    return Container(
      child: Text("comming soon!!"),
    );
  }
  // _getBody() {
  //   return StreamBuilder<SearchSuggestion>(
  //     stream: searchBloc.searchSuggestion.stream,
  //     builder: (context, AsyncSnapshot<SearchSuggestion> snapshot) {
  //       if (snapshot.connectionState != ConnectionState.waiting &&
  //           snapshot.hasData &&
  //           snapshot.data != null &&
  //           snapshot.data!.data!.length == 0 &&
  //           _searchController.text.isNotEmpty) {
  //         return NoProductFoundWidget(
  //           text:
  //               "Make sure words are spelled correctly, or try using different words"),
  //         );
  //       }
  //       if (snapshot.hasData &&
  //           snapshot.data != null &&
  //           snapshot.data!.data!.length > 0) {
  //         return ListView.separated(
  //           shrinkWrap: true,
  //           itemCount: snapshot.data!.data!.length,
  //           separatorBuilder: (context, index) {
  //             return Divider(
  //               height: 1,
  //               thickness: 1,
  //             );
  //           },
  //           itemBuilder: (context, index) {
  //             String id;
  //             String? name;
  //             snapshot.data!.data![index].forEach((key, value) {
  //               id = key;
  //               name = value;
  //             });
  //             return ListTile(
  //               onTap: () {
  //                 // String params  = jsonEncode({
  //                 //   "mowId": widget.mowId,
  //                 //   "query": name
  //                 // });
  //                 searchParamsModel.mow = widget.mowId;
  //                 searchParamsModel.query = name;
  //                 FacebookAppEvent.facebookEvent(
  //                     name: "search", params: {"query": name});
  //                 Navigator.pushNamed(context, MyRouters.SEARCH_PRODUCT,
  //                     arguments: searchParamsModel);
  //               },
  //               contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
  //               visualDensity: VisualDensity(vertical: -2),
  //               title: Text(
  //                 name!,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: CustomColor.colorBlack,
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       }
  //       return Container();
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }
}
