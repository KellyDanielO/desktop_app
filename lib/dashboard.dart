import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              CupertinoIcons.bell,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          SizedBox(width: width * .01),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              CupertinoIcons.person,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // End Of top items
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: width * .3,
                          // height: height * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // First Card item
                              Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Balance',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: isDarkMode
                                                      ? AppColors
                                                          .mainBgDarkShade
                                                      : AppColors
                                                          .mainBgLightShade,
                                                  width: 1.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                CupertinoIcons.money_yen,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .color,
                                              ),
                                            ),
                                            SizedBox(width: width * .01),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: isDarkMode
                                                    ? AppColors.mainBgLight
                                                    : AppColors.mainBgDark,
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                    const Text(
                                      '\$7,610.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.arrow_up_right,
                                            size: 18,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
                                          ),
                                        ),
                                        SizedBox(width: width * .005),
                                        const Text(
                                          '\$2,319.00',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(width: width * .02),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: isDarkMode
                                                ? AppColors.mainBgDarkShade
                                                : AppColors.mainBgLightShade,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.arrow_down_left,
                                            size: 18,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
                                          ),
                                        ),
                                        SizedBox(width: width * .005),
                                        const Text(
                                          '-\$919.00',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 25,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Information',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.pen,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 25,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Security',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * .02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: isDarkMode
                                                    ? AppColors.mainBgLight
                                                    : AppColors.mainBgDark,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                Icons.safety_check_outlined,
                                                size: 30,
                                                color: isDarkMode
                                                    ? AppColors.mainColorLight
                                                    : AppColors.mainColorDark,
                                              ),
                                            ),
                                            SizedBox(width: width * .01),
                                            const Text(
                                              '2F A enabled',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: isDarkMode
                                                    ? AppColors.mainBgDarkShade
                                                    : AppColors
                                                        .mainBgLightShade,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                CupertinoIcons.padlock,
                                                // size: 18,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .color,
                                              ),
                                            ),
                                            SizedBox(width: width * .01),
                                            const Text(
                                              'Key',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Change',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .color),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'HashPay',
            style: TextStyle(
              fontSize: width * .01 + 18,
              fontWeight: FontWeight.w800,
            ),
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
    );
  }
}
