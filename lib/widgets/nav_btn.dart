import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../colors.dart';
import '../providers.dart';

class NavBtn extends ConsumerWidget {
  final Widget icon;
  final String text;
  final bool isActive;
  const NavBtn(
      {super.key,
      required this.icon,
      required this.text,
      required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () {},
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isActive
              ? isDarkMode
                  ? AppColors.mainBgLight
                  : AppColors.mainBgDark
              : null,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Row(
          children: <Widget>[
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: isActive
                    ? isDarkMode
                        ? AppColors.mainColorLight
                        : AppColors.mainColorDark
                    : Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeight.w600,
                fontSize: width * .01 + 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
