import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/my_sponsor.dart';
import 'package:moya/domain/usecases/get_my_sponsor_list_use_case.dart';
import 'package:moya/presentation/profile/widgets/my_sponsor_history_item.dart';

class MySponsorHistory extends StatefulWidget {
  const MySponsorHistory({super.key});

  @override
  State<MySponsorHistory> createState() => _MySponsorHistoryState();
}

class _MySponsorHistoryState extends State<MySponsorHistory> {
  List<MySponsor> _mySponsorList = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    GetMySponsorListUseCase useCase = serviceLocator<GetMySponsorListUseCase>();
    final result = await useCase.call();
    result.when(
      success: (mySponsorList) {
        setState(() {
          _mySponsorList = mySponsorList;
        });
      },
      error: (message) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.white,
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "내 후원 기록",
            style: TypoTextStyle.h4(
              color: Palette.black,
            ),
          ),
          if (_mySponsorList.isNotEmpty) const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return MySponsorHistoryItem(
                mySponsor: _mySponsorList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: _mySponsorList.length,
          ),
        ],
      ),
    );
  }
}
