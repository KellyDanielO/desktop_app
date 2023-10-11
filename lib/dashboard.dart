import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';
import 'providers.dart';
import 'widgets/nav_btn.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      body: Container(
        color:
            isDarkMode ? AppColors.mainBgDarkShade : AppColors.mainBgLightShade,
        width: width,
        height: height,
        child: Row(
          children: <Widget>[
            leftHandWidgets(width, height, context, isDarkMode),
            mainContent(context, width, height, isDarkMode),
          ],
        ),
      ),
    );
  }

  Expanded mainContent(
      BuildContext context, double width, double height, bool isDarkMode) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      CupertinoIcons.bell,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                  SizedBox(width: width * .01),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      CupertinoIcons.person,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                ],
              ),
            ),
            // End Of top items
            Container(
              width: double.maxFinite,
              height: height * .9,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  itemSectionOne(width, height, context, isDarkMode),
                  SizedBox(width: width * .02),
                  itemSectionTwo(height, context, width, isDarkMode),
                  SizedBox(width: width * .02),
                  itemSectionThree(width, height, context),
                  SizedBox(width: width * .02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded itemSectionTwo(
      double height, BuildContext context, double width, bool isDarkMode) {
    return Expanded(
      child: Container(
        height: height * .8,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: width * .15,
              child: Image.asset(
                'assets/images/credit_card.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Transactions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * .01 + 7,
              ),
            ),
            FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDarkMode
                      ? AppColors.mainBgDarkShade
                      : AppColors.mainBgLightShade,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: width * .1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: isDarkMode
                            ? AppColors.mainBgLight
                            : AppColors.mainBgDark,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: width * .01 + 1,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.mainColorLight
                              : AppColors.mainColorDark,
                        ),
                      ),
                    ),
                    Container(
                      width: width * .1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Apply For',
                        style: TextStyle(
                          fontSize: width * .01 + 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text(
                  'Pay Id',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * .01 + 1,
                  ),
                ),
                SizedBox(height: height * .01),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.mainBgDarkShade
                        : AppColors.mainBgLightShade,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '3455-2647-3456-8652-9072-1287',
                    style: TextStyle(
                      fontSize: width * .01 + 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * .01),
                Center(
                  child: Text(
                    'Please enter your Wallet Id',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * .01 + .05,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * .01 + 1,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .005),
                    Container(
                      width: width * .1,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.mainBgDarkShade
                            : AppColors.mainBgLightShade,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: height * .01 + .07,
                        horizontal: height * .01 + 6,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: width * .01 + 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '20',
                                hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                  fontSize: width * .01 + 2,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Reasons',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * .01 + 1,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .005),
                    Container(
                      width: width * .1,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.mainBgDarkShade
                            : AppColors.mainBgLightShade,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: height * .01 + .07,
                        horizontal: height * .01 + 6,
                      ),
                      child: Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Games',
                            hintStyle: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontSize: width * .01 + 2,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Commission: ",
                      style: TextStyle(
                        fontSize: width * .01 + .06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: width * .02),
                    Text(
                      "\$3",
                      style: TextStyle(
                        fontSize: width * .01 + .06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Total: ",
                      style: TextStyle(
                        fontSize: width * .01 + .06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: width * .02),
                    Text(
                      "\$300",
                      style: TextStyle(
                        fontSize: width * .01 + .06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              mouseCursor: MaterialStateMouseCursor.clickable,
              onTap: () {},
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: height * .01 + 3,
                  vertical: height * .01 + 3,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.paperplane,
                      color: AppColors.mainColorDark,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Send',
                      style: TextStyle(
                        color: AppColors.mainColorDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container itemSectionThree(
      double width, double height, BuildContext context) {
    return Container(
      // width: width * .3,
      height: height * .8,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: width * .08,
                  height: width * .08,
                  child: SvgPicture.asset(
                    'assets/images/svg_2.svg',
                  ),
                ),
                SizedBox(height: height * .02),
                const Text(
                  'Payment Services',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: width * .08,
                  height: width * .08,
                  child: SvgPicture.asset(
                    'assets/images/svg_3.svg',
                  ),
                ),
                SizedBox(height: height * .02),
                const Text(
                  'Recharge Cell',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: width * .08,
                  height: width * .08,
                  child: SvgPicture.asset(
                    'assets/images/svg_1.svg',
                  ),
                ),
                SizedBox(height: height * .02),
                const Text(
                  'Payment cards',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container itemSectionOne(
      double width, double height, BuildContext context, bool isDarkMode) {
    return Container(
      width: width * .25,
      // height: height * .8,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // First Card item
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 5,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isDarkMode
                                  ? AppColors.mainBgDarkShade
                                  : AppColors.mainBgLightShade,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            CupertinoIcons.money_yen,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        SizedBox(width: width * .01),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.mainBgLight
                                : AppColors.mainBgDark,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.currency_exchange,
                            color: isDarkMode
                                ? AppColors.mainColorLight
                                : AppColors.mainColorDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Text(
                  '\$7,610.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * .01 + 2,
                  ),
                ),
                SizedBox(height: height * .02),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.mainBgDarkShade
                            : AppColors.mainBgLightShade,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        CupertinoIcons.arrow_up_right,
                        size: width * .01 + 1,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    SizedBox(width: width * .005),
                    Text(
                      '\$2,319.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 1,
                      ),
                    ),
                    SizedBox(width: width * .02),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.mainBgDarkShade
                            : AppColors.mainBgLightShade,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        CupertinoIcons.arrow_down_left,
                        size: width * .01 + 1,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    SizedBox(width: width * .005),
                    Text(
                      '-\$919.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
              ],
            ),
          ),
          // First Card Item End
          // Second Card Item
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isDarkMode
                              ? AppColors.mainBgDarkShade
                              : AppColors.mainBgLightShade,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        CupertinoIcons.pen,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.person,
                        ),
                        SizedBox(width: width * .005),
                        Text(
                          'Gender',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: width * .01 + 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width * .02),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(
                          CupertinoIcons.location_fill,
                        ),
                        SizedBox(width: width * .005),
                        Text(
                          'Location',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: width * .01 + 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width * .02),
                    Text(
                      'Nigeria',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.wallet_outlined,
                        ),
                        SizedBox(width: width * .005),
                        Text(
                          'Wallet ID',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: width * .01 + 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width * .02),
                    Text(
                      '72g7d9i9u9277890j9d8',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
              ],
            ),
          ),
          // Second Card Item End
          // Third Card Item
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Security',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .01 + 5,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.mainBgLight
                                : AppColors.mainBgDark,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.safety_check_outlined,
                            size: width * .01 + 4,
                            color: isDarkMode
                                ? AppColors.mainColorLight
                                : AppColors.mainColorDark,
                          ),
                        ),
                        SizedBox(width: width * .01),
                        Text(
                          '2F A enabled',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .01 + 1,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: isDarkMode
                          ? AppColors.mainBgLight
                          : AppColors.mainBgDark,
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.mainBgDarkShade
                                : AppColors.mainBgLightShade,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            CupertinoIcons.padlock,
                            size: width * .01 + 2,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        SizedBox(width: width * .01),
                        Text(
                          'Key',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .01 + 1,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
              ],
            ),
          ),
          // Third Card Item End
        ],
      ),
    );
  }

  Container leftHandWidgets(
    double width,
    double height,
    BuildContext context,
    bool isDarkMode,
  ) {
    return Container(
      width: width * .2,
      height: height,
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'HashPay',
            //   style: TextStyle(
            //     fontSize: width * .01 + 18,
            //     fontWeight: FontWeight.w800,
            //   ),
            // ),
            SizedBox(
              width: width * .1,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              child: Column(
                children: <Widget>[
                  NavBtn(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: isDarkMode
                          ? AppColors.mainColorLight
                          : AppColors.mainColorDark,
                    ),
                    text: 'Home',
                    isActive: true,
                  ),
                  NavBtn(
                    icon: Icon(
                      CupertinoIcons.bag,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Wallet',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      CupertinoIcons.money_dollar_circle,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Deposite & Withdraw',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Transfers',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      Icons.phone_android,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Phone Recharge',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      Icons.credit_card_outlined,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'My Payment Card',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      Icons.line_axis,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Movements',
                    isActive: false,
                  ),
                  SizedBox(height: height * .02),
                  Container(
                    width: double.maxFinite,
                    height: 5,
                    color: isDarkMode
                        ? AppColors.mainBgDarkShade
                        : AppColors.mainBgLightShade,
                  ),
                  SizedBox(height: height * .02),
                  NavBtn(
                    icon: Icon(
                      Icons.people_outline,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Accounts',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      CupertinoIcons.settings,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Settings',
                    isActive: false,
                  ),
                  NavBtn(
                    icon: Icon(
                      CupertinoIcons.chat_bubble,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    text: 'Chat',
                    isActive: false,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Switch(
                  activeColor: AppColors.primaryColor,
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(isDarkModeProvider.notifier).changeTheme(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
