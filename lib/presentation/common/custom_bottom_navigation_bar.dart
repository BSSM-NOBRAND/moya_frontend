import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTabChange});

  final Function(int) onTabChange;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final _icon_paths = <String>[
    'assets/images/home.svg',
    'assets/images/heart.svg',
    'assets/images/people.svg',
    'assets/images/person.svg',
  ];

  final _labels = <String>['홈', '위시리스트', '친구', '프로필'];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        decoration: const BoxDecoration(
          color: Palette.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_icon_paths.length, (index) {
              String iconPath = _icon_paths[index];
              bool isSelected = _selected == index;

              return Expanded(
                child: InkWell(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        colorFilter: ColorFilter.mode(
                          isSelected ? Palette.gray900 : Palette.gray400,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        _labels[index],
                        style: TypoTextStyle.body3(
                            color:
                                isSelected ? Palette.gray900 : Palette.gray400),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _selected = index;
                      widget.onTabChange(index);
                    });
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
