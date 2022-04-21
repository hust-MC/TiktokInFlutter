import 'package:flutter/cupertino.dart';

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

  @override
  void initState() {
    super.initState();
    widget.pageView.controller.addListener(() {
      print('MCLOG: POSITION: ${widget.pageView.controller.page}');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ...widget.title.map((e) => Text(e)),
      ]),
      Expanded(child: widget.pageView)
    ]);
  }
}
