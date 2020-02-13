import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healthoui/ui/shared/text_style.dart';
import 'package:healthoui/ui/shared/ui_helper.dart';
import 'package:healthoui/ui/shared/widget/onboard_widget.dart';
import 'package:healthoui/ui/shared/widget/rounded_button_widget.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({Key key}) : super(key: key);

  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController;
  double _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  _navigateLoginPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
  }

  void _onPageChangeEvent(double number) {
    if (number == UIHelper.ONBOARD_PAGE_COUNT) {
      //end page
      _navigateLoginPage();
      return;
    } else {
      setState(() {
        _currentPageIndex = number;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: _pageView),
            _indicatorPageView,
            _nextButtonWrap
          ],
        ),
      ),
    );
  }

  Widget get _appBar => AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: UIHelper.Space0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          ActionChip(
            label: Text(
              "ATLA",
              style: TextStyle(letterSpacing: 2),
            ),
            elevation: UIHelper.Space10,
            onPressed: _navigateLoginPage,
          ),
          SizedBox(
            width: UIHelper.Space15,
          ),
        ],
      );

  Widget get _indicatorPageView => SizedBox(
      height: UIHelper.Space50, width: UIHelper.dynamicWidth(300), child: _pageIndicator);

  Widget get _nextButtonWrap => SizedBox(
      width: UIHelper.dynamicHeight(UIHelper.Space200), child: _nextButton);

  Widget get _pageView => PageView(
        onPageChanged: (page) {
          _onPageChangeEvent(page.toDouble());
        },
        controller: _pageController,
        children: <Widget>[_onBoardFirst, _onBoardSecond, _onBoardThree],
      );

  Widget get _onBoardFirst => OnBoardWidget(
        title: "Yemek Listesi",
        subTitle: "Yemek listesi artık cebinde!",
        imagePath: "yemek",
      );

  Widget get _onBoardSecond => OnBoardWidget(
        title: "Etkinlikler",
        subTitle: "Kampüs içi etkinliklerden anında haberin olsun!",
        imagePath: "etkinlikler1",
      );

  Widget get _onBoardThree => OnBoardWidget(
        title: "İndirimler ",
        subTitle: "Anlaşmalı işletmelerde indirimlerden haberdar ol!",
        imagePath: "indirim1",
      );

  Widget get _pageIndicator => ListView.builder(
        itemCount: UIHelper.ONBOARD_PAGE_COUNT,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 5,
              backgroundColor:
                  index == _currentPageIndex ? Colors.yellow : Colors.grey,
            ),
          );
        },
      );

  void _nextButtonOnPress() {
    _onPageChangeEvent(_currentPageIndex);
    _pageController.nextPage(
        duration: Duration(milliseconds: UIHelper.ONBOARD_NEXT_DURATION),
        curve: Curves.easeIn);
  }

  Widget get _nextButton => RoundedButtonWidget(
        onPress: _nextButtonOnPress,
        child: Text(
          "İLERİ",
          style: onBoardingNextButtonStyle,
        ),
      );
}
