import 'package:rxdart/rxdart.dart';

enum NavBarItem { COMMUNITY, MSSG, MAP, ADD, DEALS }

class NavBarBloc {
  NavBarItem defaultItem = NavBarItem.COMMUNITY;
  int _navIndex = 0;
  final BehaviorSubject<NavBarItem> _navItem = BehaviorSubject<NavBarItem>();
  final BehaviorSubject<int> _navItemIndex = BehaviorSubject<int>();

  pickItem(int index) {
    _navIndex = index;
    _navItemIndex.sink.add(index);
    switch (index) {
      case 0:
        _navItem.sink.add(NavBarItem.COMMUNITY);
        break;
      case 1:
        // HelperCalls().initProductPage('', false, false);
        _navItem.sink.add(NavBarItem.MSSG);

        break;
      case 2:
        // HelperCalls().initProductPage('', false, false);
        _navItem.sink.add(NavBarItem.MAP);

        break;
      case 3:
        //  HelperCalls().initFarmGuide();
        _navItem.sink.add(NavBarItem.ADD);
        break;
      case 4:
        _navItem.sink.add(NavBarItem.DEALS);
        break;
    }
  }

  BehaviorSubject<NavBarItem> get navItem => _navItem;

  BehaviorSubject<int> get navItemIndex => _navItemIndex;

  get navIndex => _navIndex;

  dispose() {
    _navItem.close();
    _navItemIndex.close();
  }
}

final navBarBloc = NavBarBloc();
