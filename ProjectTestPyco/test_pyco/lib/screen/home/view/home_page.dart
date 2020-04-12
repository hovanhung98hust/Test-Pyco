import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testpyco/common/size.dart';
import 'package:testpyco/common/strings.dart';
import 'package:testpyco/di/injector.dart';
import 'package:testpyco/model/user.dart';
import 'package:testpyco/screen/home/viewmodel/home_vm.dart';
import 'package:testpyco/screen/home/widget/card_animation.dart';
import 'package:testpyco/screen/home/widget/profile_card.dart';
import 'package:testpyco/screen/splash/viewmodel/splash_vm.dart';

List<Alignment> cardsAlign = [
  Alignment(0.0, 1.0),
  Alignment(0.0, 0.8),
  Alignment(0.0, 0.0)
];
List<Size> cardsSize = List(3);

class HomePage extends StatefulWidget {
  final bool online;

  HomePage({this.online = true}) {
    cardsSize[0] = Size(Sizes.screenWidth * 0.9, Sizes.screenHeight * 0.6);
    cardsSize[1] = Size(Sizes.screenWidth * 0.85, Sizes.screenHeight * 0.55);
    cardsSize[2] = Size(Sizes.screenWidth * 0.8, Sizes.screenHeight * 0.5);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int cardsCounter = 2;
  List<User> listData = List();
  List<ProfileCardAlignment> cards = List();
  AnimationController _controller;
  HomeViewModel homeViewModel;
  final Alignment defaultFrontCardAlign = Alignment(0.0, 0.0);
  Alignment frontCardAlign;
  double frontCardRot = 0.0;

  @override
  void initState() {
    homeViewModel = Injector.resolve<HomeViewModel>();
    listData = Injector.resolve<SplashViewModel>().listData;
    homeViewModel.online = widget.online;
    if (listData.isNotEmpty) {
      homeViewModel.currentUser = listData[0];
    }
    if (listData.length >= 3) {
      for (int i = 0; i < 3; i++) {
        cards.add(ProfileCardAlignment(listData[i], homeViewModel));
      }
    } else {
      cardsCounter = 1;
      for (int i = 0; i < listData.length; i++) {
        cards.add(ProfileCardAlignment(listData[i], homeViewModel));
      }
    }

    frontCardAlign = cardsAlign[2];
    // Init the animation controller
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) changeCardsOrder();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int length = listData.length;
    return Scaffold(
      backgroundColor: Colors.pinkAccent[200],
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          listData.isNotEmpty
              ? Expanded(
                  child: Stack(
                    children: <Widget>[
                      length >= 3 ? backCard() : Text(''),
                      length >= 2 ? middleCard() : Text(''),
                      length >= 1 ? frontCard() : Text(''),
                      // Prevent swiping if the cards are animating
                      _controller.status != AnimationStatus.forward
                          ? SizedBox.expand(
                              child: GestureDetector(
                              // While dragging the first card
                              onPanUpdate: (DragUpdateDetails details) {
                                // Add what the user swiped in the last frame to the alignment of the card
                                setState(() {
                                  // 20 is the "speed" at which moves the card
                                  frontCardAlign = Alignment(
                                      frontCardAlign.x +
                                          20 *
                                              details.delta.dx /
                                              MediaQuery.of(context).size.width,
                                      frontCardAlign.y +
                                          40 *
                                              details.delta.dy /
                                              MediaQuery.of(context)
                                                  .size
                                                  .height);

                                  frontCardRot =
                                      frontCardAlign.x; // * rotation speed;
                                });
                              },
                              // When releasing the first card
                              onPanEnd: (_) {
                                // If the front card was swiped far enough to count as swiped
                                if (frontCardAlign.x > 3.0 ||
                                    frontCardAlign.x < -3.0) {
                                  animateCards();
                                } else {
                                  // Return to the initial rotation and alignment
                                  setState(() {
                                    frontCardAlign = defaultFrontCardAlign;
                                    frontCardRot = 0.0;
                                  });
                                }
                              },
                            ))
                          : Container(),
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    STRING_NO_INTERNET,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget backCard() {
    return Align(
      alignment: _controller.status == AnimationStatus.forward
          ? CardsAnimation.backCardAlignmentAnim(_controller).value
          : cardsAlign[0],
      child: SizedBox.fromSize(
          size: _controller.status == AnimationStatus.forward
              ? CardsAnimation.backCardSizeAnim(_controller).value
              : cardsSize[2],
          child: cards[2]),
    );
  }

  Widget middleCard() {
    return Align(
      alignment: _controller.status == AnimationStatus.forward
          ? CardsAnimation.middleCardAlignmentAnim(_controller).value
          : cardsAlign[1],
      child: SizedBox.fromSize(
          size: _controller.status == AnimationStatus.forward
              ? CardsAnimation.middleCardSizeAnim(_controller).value
              : cardsSize[1],
          child: cards[1]),
    );
  }

  Widget frontCard() {
    return Align(
        alignment: _controller.status == AnimationStatus.forward
            ? CardsAnimation.frontCardDisappearAlignmentAnim(
                    _controller, frontCardAlign, homeViewModel)
                .value
            : frontCardAlign,
        child: Transform.rotate(
          angle: (pi / 180.0) * frontCardRot,
          child: SizedBox.fromSize(size: cardsSize[0], child: cards[0]),
        ));
  }

  void changeCardsOrder() {
    setState(() {
      if (listData.length >= 3) {
        cards[0] = cards[1];
        homeViewModel.setCurrentData(cards[0].user);
        cards[1] = cards[2];
        cards[2] = ProfileCardAlignment(listData[cardsCounter], homeViewModel);
        cardsCounter++;
        if (cardsCounter >= listData.length) {
          cardsCounter = 0;
        }
      } else if (listData.length >= 2) {
        cards[0] = cards[1];
        homeViewModel.setCurrentData(cards[0].user);
        cards[1] = ProfileCardAlignment(listData[cardsCounter], homeViewModel);
        cardsCounter++;
        if (cardsCounter >= listData.length) {
          cardsCounter = 0;
        }
      } else {
        cards[0] = ProfileCardAlignment(listData[0], homeViewModel);
      }
      frontCardAlign = defaultFrontCardAlign;
      frontCardRot = 0.0;
    });
  }

  void animateCards() {
    _controller.stop();
    _controller.value = 0.0;
    _controller.forward();
  }
}
