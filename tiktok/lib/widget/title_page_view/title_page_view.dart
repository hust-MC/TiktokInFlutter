import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok/widget/title_page_view/title_page_controller.dart';

class TitlePageView extends StatefulWidget {
  final PageView pageView;
  final List<String> title;

  const TitlePageView({required this.pageView, this.title = const []});

  @override
  State<StatefulWidget> createState() {
    return TitlePageViewState();
  }
}

class TitlePageViewState extends State<TitlePageView> {
  static const tag = "TitlePageController";
  late final TitlePageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TitlePageController();
    widget.pageView.controller.addListener(() {
      _controller.focus.value = widget.pageView.controller.page?.round() ?? 0;
      print("$tag - Current page is ${_controller.focus.value}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ...widget.title.map((e) {
              var textColor = widget.title.indexOf(e) == _controller.focus.value
                  ? TitlePageController.titleColorFocus
                  : TitlePageController.titleColorNormal;
              return Text(e, style: TextStyle(color: textColor, fontSize: 18, decoration: TextDecoration.none));
            }),
          ]),
          Expanded(child: widget.pageView)
        ]));
  }
}
