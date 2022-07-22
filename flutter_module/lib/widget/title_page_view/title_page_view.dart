import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_module/widget/title_page_view/title_page_controller.dart';

typedef TableBuilder = Widget Function(int index, int focus);
typedef PageBuilder = Widget Function(int index);

class TitlePageView extends StatefulWidget {
  final PageBuilder pageBuilder;
  final TableBuilder tableBuilder;
  final int length;

  const TitlePageView({required this.pageBuilder, required this.tableBuilder, required this.length});

  @override
  State<StatefulWidget> createState() {
    return TitlePageViewState();
  }
}

class TitlePageViewState extends State<TitlePageView> {
  static const tag = "TitlePageController";
  late final TitlePageViewController _controller;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _controller = TitlePageViewController();
    _pageController = PageController();
    // widget.pageView.controller.addListener(_pageViewListener);
  }

  @override
  void dispose() {
    super.dispose();
    // widget.pageView.controller.removeListener(_pageViewListener);
  }

  @override
  Widget build(BuildContext context) {
    var titles = <Widget>[];
    var pages = <Widget>[];
    for (int i = 0; i < 2; i++) {
      titles.add(widget.tableBuilder(i, 0));
    }

    for (int i = 0; i < 2; i++) {
      pages.add(widget.pageBuilder(i));
    }
    print('MCLOG====titles: $titles, pages:$pages');
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: titles),
      SizedBox(height: 14),
      Expanded(
        child: PageView(
          controller: _pageController,
          children: pages,
        ),
      )
    ]);
  }

  void _pageViewListener() {
    // _controller.focus.value = widget.pageView.controller.page?.round() ?? 0;
    print("$tag - Current page is ${_controller.focus.value}");
  }
}
