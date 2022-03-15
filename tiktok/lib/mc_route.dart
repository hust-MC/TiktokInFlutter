import 'package:flutter/material.dart';
import 'package:tiktok/page/friend_page.dart';
import 'package:tiktok/page/message_page.dart';
import 'package:tiktok/page/mine_page.dart';
import 'package:tiktok/photo/photo_picker_page.dart';

class MCRouter extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  static const String photo_picker = '/photo_picker';
  static const String mine_page = '/mine';
  static const String friend_page = '/friend';
  static const String message_page = '/message';

  final List<Page> _pages = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;

    if (canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  void push({required String name, dynamic arguments}) {
    print('page is : $_pages');
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    print('page is : $_pages');
    notifyListeners();
  }

  void replace({required String name, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name, arguments: arguments);
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child;

    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case photo_picker:
        String url;
        if (args is Map<String, String>) {
          url = args['url'] ?? '';
        }
        url = 'asset/image/default_photo.jpg';
        child = PhotoPickerPage(url);
        break;
      case mine_page:
        child = MinePage();
        break;
      case friend_page:
        child = FriendPage(title: 'title');
        break;
      case message_page:
        child = MessagePage(title: 'title');
        break;
      default:
        child = const Scaffold();
    }

    return MaterialPage(
      child: child,
      key: Key(routeSettings.name!) as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: const Text('确定要退出App吗?'),
            actions: [
              TextButton(
                child: const Text('取消'),
                onPressed: () => Navigator.pop(context, true),
              ),
              TextButton(
                child: const Text('确定'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          );
        });
    return result ?? true;
  }
}
