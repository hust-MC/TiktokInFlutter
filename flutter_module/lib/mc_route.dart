import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_module/gen/assets.gen.dart';
import 'package:flutter_module/page/friend_page.dart';
import 'package:flutter_module/page/message_page/message_page.dart';
import 'package:flutter_module/page/mine_page/mine_page.dart';
import 'package:flutter_module/photo/photo_picker_page.dart';

class MCRouter extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  static const String photo_picker = '/photo_picker';
  static const String mine_page = '/mine';
  static const String friend_page = '/friend';
  static const String message_page = '/message';

  static const String key_url = 'url';

  final List<Page> _pages = [];

  late Completer<Object?> _boolResultCompleter;

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
  Future<bool> popRoute({Object? params}) {
    if (params != null) {
      _boolResultCompleter.complete(params);
    }

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

  Future<Object?> push({required String name, dynamic arguments}) async {
    _boolResultCompleter = Completer<Object?>();

    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
    return _boolResultCompleter.future;
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
        String? url;
        String height = '';
        String width = '';

        if (args is Map<String, String>) {
          url = args[MCRouter.key_url];
          height = args["height"] ?? height;
          width = args["width"] ?? width;
        }
        child = PhotoPickerPage(url ?? Assets.image.defaultPhoto.assetName,
            width: double.tryParse(width), height: double.tryParse(height));
        break;
      case mine_page:
        child = MinePage();
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
            content: const Text('???????????????App????'),
            actions: [
              TextButton(
                child: const Text('??????'),
                onPressed: () => Navigator.pop(context, true),
              ),
              TextButton(
                child: const Text('??????'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          );
        });
    return result ?? true;
  }
}
