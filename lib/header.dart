// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_portfolio/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameWidget = "Vikash\nJha"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack([
          PictureWidget(),
          Row(
            children: [
              VStack([
                if (context.isMobile) 50.heightBox else 10.heightBox,
                CustomAppBar().shimmer(
                  primaryColor: Coolors.accentColor,
                ),
                30.heightBox,
                nameWidget,
                20.heightBox,
                VxBox()
                    .color(Coolors.accentColor)
                    .size(60, 10)
                    .make()
                    .shimmer(primaryColor: Coolors.accentColor),
                50.heightBox,
                SocialAccounts(),
              ]).pSymmetric(h: context.percentWidth * 10, v: 32),
              Expanded(
                  child: VxResponsive(
                fallback: const Offstage(),
                medium: IntroductionWidget()
                    .pOnly(left: 120)
                    .h(context.percentHeight * 60),
                large: IntroductionWidget()
                    .pOnly(left: 120)
                    .h(context.percentHeight * 60),
              ))
            ],
          ).w(context.screenWidth)
        ]),
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "@googledevexpert for flutter, firebase, dart & web, React Native & React Js. \n Blogger & YouTuber"
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
            launch("https://mrvikashjha.com");
          },
          child: "Visit mrvikashjha.com".text.make(),
          color: Coolors.accentColor,
          shape: Vx.roundedSm,
          hoverColor: Vx.purple700,
        ).h(50)
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Image.asset(
          "assets/pic.png",
          fit: BoxFit.cover,
          height: context.percentHeight * 30,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolors.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com/mr_vikash_jha");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://instagram.com/mr_vikash_jha");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.youtube,
        color: Colors.white,
      ).mdClick(() {
        launch("https://youtube.com/c/MrVikashJha");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/mr-vikash-jha");
      }).make(),
    ].hStack();
  }
}
