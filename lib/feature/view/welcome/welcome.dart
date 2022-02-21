import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '/core/constants/app_strings.dart';
import '../home/view/homepage.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_logo.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: context.paddingMedium,
            child: _buildPageContent(context),
          ),
        ),
      ),
    );
  }

  Column _buildPageContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: _buildMainText(context),
        ),
        Padding(
          padding: context.paddingLow,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.appTheme.primaryColor,
                    ),
                    text: AppStrings().welcomeSubText),
                TextSpan(
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.appTheme.primaryColor,
                    ),
                    text: AppStrings().welcomeSubTextBold),
              ])),
        ),
        const Spacer(),
        Padding(
          padding: context.verticalPaddingMedium,
          child: _buildNavigatorButton(context),
        ),
      ],
    );
  }

  Text _buildMainText(BuildContext context) {
    return Text(
      AppStrings().welcomeText,
      textAlign: TextAlign.center,
      style: context.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w600,
        color: context.appTheme.primaryColor,
      ),
    );
  }

  ElevatedButton _buildNavigatorButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () {
        context.navigateToPage(const HomePage());
      },
      child: Padding(
        padding: context.paddingLow,
        child: Text(
          AppStrings().welcomeButtonText,
          style: context.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.appTheme.primaryColor),
        ),
      ),
    );
  }
}
