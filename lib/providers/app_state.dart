import 'package:flutter/cupertino.dart';
import 'package:turbocare_task/scenes/home_page.dart';

class AppStateProvider extends ChangeNotifier {

  List<CupertinoPage> pageStack = [ const CupertinoPage(child: HomePage(),key: ValueKey('home')) ];

  pushPage(Widget page, String key) {
    pageStack.add(CupertinoPage(child: page,key: ValueKey(key)));
    pageStack = List.from(pageStack);
    notifyListeners();
  }

  popPage() {
    pageStack.removeLast();
    pageStack = List.from(pageStack);
    notifyListeners();
  }

  changePageStack(List<CupertinoPage> pageList) {
    pageStack = pageList;
    notifyListeners();
  }

  notifyMyListeners() {
    notifyListeners();
  }

}
